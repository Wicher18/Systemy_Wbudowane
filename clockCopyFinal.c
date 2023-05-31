#include <8051.h>

#define T0_DAT 65535-921
#define TL_0 T0_DAT%256
#define TH_0 T0_DAT/256

__code unsigned char WZOR[10] = {0b0111111, 0b0000110, 0b1011011,
								 0b1001111, 0b1100110, 0b1101101,
								 0b1111101, 0b0000111, 0b1111111,
								 0b1101111};

__bit __at (0x96) SEG_OFF; //wyłączeine wyświetlaczy 7-seg
__bit t0_flag;
__bit mode = 0; //tryb pracy, 0 - odliczanie, 1 - ustawianie
__bit active_flag; //flaga aktywnego wyświetlacza (dla trybu ustawiania)

unsigned int timer_buf; //bufor licznika przerwań

unsigned char led_p = 0; //iterator dla wyświetlaczy
unsigned char key_p; //bufor stanu klawiatury
unsigned char time_p; //iterator dla tabeli time
unsigned char time[3]; //tablica przechowująca wartości sekund, minut, godzin
unsigned char keys[4]; //tablica przechowująca wybrany klawisz
unsigned char zegar[6]; //tablica przechowująca aktualny stan zegara
unsigned char i; //iterator dla funkcji stan_zegara
unsigned char active; //młodszy z aktywnyh wyświetlaczy (tryb ustawiania)
unsigned char delay = 0; //opónienie dla wyświetlania nieaktywnych wyświetlaczy (tryb ustawiania)

void t0_serv(void); //obsługa przerwań
void key_serv(void); //obsługa klawiatury
void stan_zegara(void); //ustawienie nowych wzorów
void przelicz(void); //sprawdzenie czy wartości nie wykraczają poza zakres

void main()
{

	__xdata unsigned char * led_wyb = (__xdata unsigned char *) 0xFF30;
	__xdata unsigned char * led_seg = (__xdata unsigned char *) 0xFF38;

	TMOD = 0b00100001;
	TL0 = TL_0;
	TH0 = TH_0;

	timer_buf = 1000;
	t0_flag = 0;

	IE = 0;
	ET0 = 1;
	TR0 = 1;
	EA = 1;

	//stan początkowy zegara
	time[0] = 24; //sekundy
	time[1] = 35; //minuty
	time[2] = 22; //godziny
	*keys = 0;

	key_p = 6;
	stan_zegara();

	while(1){	//MAIN LOOP

		if(t0_flag){ //sprawdzenie czy nastąpiło przerwanie
 		    t0_flag = 0;	//wyzerowanie flagi informującej o przerwaniu
         	t0_serv();	//wywołanie obsługi przerwania

            if(!key_p){ //Jeżli key_p osiągnie 0, to
               	key_p=6; //ustaw go na 6
                *(keys+3) = *(keys+2); //i przesuń wybrane klawisze
		       	*(keys+2) = *(keys+1);
                *(keys+1) = *(keys);
		       	*(keys) = 0;
            }

	        if(led_p == 6){ //jeśli iterator tabeli time wyszedł za ostatni wyświetlacz
 				led_p = 0; //wyzerj go

 				if(delay == 3){ //jeśli opónienie wyszło poza zakres
			 		delay = 0; //wyzeruj
			 	} else { //w przeciwnym razie
			        delay++; //inkrementuj
			 	}
 			}

 		SEG_OFF = 1; //wyłącz wyświetlacz
 		*led_wyb = 1 << led_p; //ustaw aktywny wyświetlacz poprzez przesunięcie bitowe jedynki o led_p miejsc w lewo
 		if(mode){ //jeśli jest w trybie ustawiania
			active_flag = (1 << led_p == active) || (1 << led_p == active*2); //sprawdź czy dany wyświetlacz jest aktywny
			if(active_flag || (!active_flag && delay == 0)){ //jeśli wyświetlacz jest aktywny, lub jeśli opónienie jest równe 0
				*led_seg = zegar[led_p]; //ustaw wzór dla wyświetlacza
 				SEG_OFF = 0; //włącz wyświetlacz
			}
		} else { //w normalnym trybie
			*led_seg = zegar[led_p]; //ustaw wzór dla wyświetlacza
 			SEG_OFF = 0; //włącz wyświetlacz
		}


		if(P3_5){ //jeśli klawisz został wciśnięty
                        *keys |= 1 << led_p; //pobierz go przez or logiczny na zmiennej keys[0] i aktywnym wyświetlaczu
                        key_p=1; //ustaw key_p
                }

                //Je�li klawiatura jest stabilna, wywo�aj obs�ug� klawiatury
		if((*keys == *(keys+1)) && (*keys == *(keys+2)) && (*keys != *(keys+3)) && (*keys != 0)) key_serv();



 		led_p++; //inkrementuj iterator dla wyświetlaczy
                key_p--; //dekrementuj key_p


                }
	}
}

void stan_zegara(void)
{
	time_p = 0;
	for(i = 0; i < 6; i += 2){
 	        zegar[i+1] = WZOR[(time[time_p])/10];	//ustawienie wartości dziesiątek
		zegar[i] = WZOR[(time[time_p])%10];	//ustawienie wartości jednostek
		time_p++;
 	}
}

void przelicz(void)
{
    if(time[0] >= 200){ //jeśli sekundy zeszły poniżej 0
        time[1]--; //dekrementuj minuty
        time[0] = 59; //ustaw sekundy na 59
    }
    if(time[1] >= 200){	//to samo dla minut
        time[2]--;
        time[1] = 59;
    }
    if(time[2] >= 200){	//to samo dla godzin
        time[2] = 23;
    }

	if(time[0] >= 60){ //jeżeli sekundy się przepełniły
        time[1]++; //inkrementuj liczbę minut
        time[0] = 0; //zeruj sekundy
 	}
	if(time[1] >= 60){ //to samo dla minut
        time[2]++;
        time[1] = 0;
 	}
 	if(time[2] >= 24){ //to samo dla godzin
        time[2] = 0;
  	}

  	stan_zegara(); //ustaw nowe wzory dla zegara
}

void t0_serv(void)
{
    if(!mode){ //jeśli zegar jest w trybie odlicznia
        if(timer_buf) timer_buf--; //sprawdź czy licznik osiągnął 0
        else { //jeśli tak
        timer_buf = 993; //zresetuj licznik
        P1_7 = !P1_7;	//zaneguj diodę
        time[0]++;	//zwiększ liczbę sekund
        przelicz();	//sprawdź czy liczby nie wyszły poza zakres
  	}
    }
}

void t0_int(void) __interrupt(1)
{
	TL0 = TL0 | TL_0;
	TH0 = TH_0;
	t0_flag = 1;
}

void key_serv()
{
	if(*keys == 0b10){ //esc
                mode = 0; //wyjdź z trybu ustawiania
                timer_buf = 993; //zresetuj licznik
        }
	if(*keys == 0b1){ //enter
		mode = 1; //wejdź w tryb ustawiania
		active = 1; //ustaw sekundy jako aktywne
	}
	if(*keys == 0b100 && mode){ //right arrow
	       if(active == 1){ //jeśli aktywne są sekundy
 	              active = 16; //ustaw godziny jako aktywne
	       } else { //w przeciwnym razie
		      active = active/4; //ustaw segment po prawo jako aktywny
	       }
	}
	if(*keys == 0b100000 && mode){ //left arrow
	       if(active == 16){ //jeśli godziny są aktywne
 	              active = 1; //ustaw sekundy jako aktywne
	       } else { //w przeciwnym razie
		      active = active*4; //ustaw segment po lewo jako aktywny
	       }
	}
	if(*keys == 0b1000 && mode){ //up arrow
	       if(active == 1) time[0]++; //inkrementuj aktywny segment
       	       if(active == 4) time[1]++;
      	       if(active == 16) time[2]++;
	}
	if(*keys == 0b10000 && mode){ //down arrow
	       if(active == 1) time[0]--; //dekrementuj aktywny segment
       	       if(active == 4) time[1]--;
      	       if(active == 16) time[2]--;
	}


	przelicz(); //sprawdź czy liczby nie wyszły poza zakres
}