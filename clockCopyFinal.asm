;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Mar 22 2009) (MINGW32)
; This file was generated Fri Jan 20 11:30:02 2023
;--------------------------------------------------------
	.module clockCopyFinal
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _WZOR
	.globl _t0_int
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _active_flag
	.globl _mode
	.globl _t0_flag
	.globl _SEG_OFF
	.globl _delay
	.globl _active
	.globl _i
	.globl _zegar
	.globl _keys
	.globl _time
	.globl _time_p
	.globl _key_p
	.globl _led_p
	.globl _timer_buf
	.globl _stan_zegara
	.globl _przelicz
	.globl _t0_serv
	.globl _key_serv
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_timer_buf::
	.ds 2
_led_p::
	.ds 1
_key_p::
	.ds 1
_time_p::
	.ds 1
_time::
	.ds 3
_keys::
	.ds 4
_zegar::
	.ds 6
_i::
	.ds 1
_active::
	.ds 1
_delay::
	.ds 1
_main_led_wyb_1_1:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_SEG_OFF	=	0x0096
_t0_flag::
	.ds 1
_mode::
	.ds 1
_active_flag::
	.ds 1
_main_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_t0_int
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	clockCopyFinal.c:23: unsigned char led_p = 0; //iterator dla wyœwietlaczy
	mov	_led_p,#0x00
;	clockCopyFinal.c:31: unsigned char delay = 0; //opóŸnienie dla wyœwietlania nieaktywnych wyœwietlaczy (tryb ustawiania)
	mov	_delay,#0x00
;	clockCopyFinal.c:18: __bit mode = 0; //tryb pracy, 0 - odliczanie, 1 - ustawianie
	clr	_mode
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;led_wyb                   Allocated with name '_main_led_wyb_1_1'
;led_seg                   Allocated to registers r4 r5 
;------------------------------------------------------------
;	clockCopyFinal.c:38: void main()
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	clockCopyFinal.c:41: __xdata unsigned char * led_wyb = (__xdata unsigned char *) 0xFF30;
	mov	_main_led_wyb_1_1,#0x30
	mov	(_main_led_wyb_1_1 + 1),#0xFF
;	clockCopyFinal.c:42: __xdata unsigned char * led_seg = (__xdata unsigned char *) 0xFF38;
	mov	r4,#0x38
	mov	r5,#0xFF
;	clockCopyFinal.c:44: TMOD = 0b00100001;
	mov	_TMOD,#0x21
;	clockCopyFinal.c:45: TL0 = TL_0;
	mov	_TL0,#0x66
;	clockCopyFinal.c:46: TH0 = TH_0;
	mov	_TH0,#0xFC
;	clockCopyFinal.c:48: timer_buf = 1000;
	mov	_timer_buf,#0xE8
	mov	(_timer_buf + 1),#0x03
;	clockCopyFinal.c:49: t0_flag = 0;
	clr	_t0_flag
;	clockCopyFinal.c:51: IE = 0;
	mov	_IE,#0x00
;	clockCopyFinal.c:52: ET0 = 1;
	setb	_ET0
;	clockCopyFinal.c:53: TR0 = 1;
	setb	_TR0
;	clockCopyFinal.c:54: EA = 1;
	setb	_EA
;	clockCopyFinal.c:57: time[0] = 24; //sekundy
	mov	_time,#0x18
;	clockCopyFinal.c:58: time[1] = 35; //minuty
	mov	(_time + 0x0001),#0x23
;	clockCopyFinal.c:59: time[2] = 22; //godziny
	mov	(_time + 0x0002),#0x16
;	clockCopyFinal.c:60: *keys = 0;
	mov	_keys,#0x00
;	clockCopyFinal.c:62: key_p = 6;
	mov	_key_p,#0x06
;	clockCopyFinal.c:63: stan_zegara();
	push	ar4
	push	ar5
	lcall	_stan_zegara
	pop	ar5
	pop	ar4
;	clockCopyFinal.c:65: while(1){	//MAIN LOOP
00125$:
;	clockCopyFinal.c:67: if(t0_flag){ //sprawdzenie czy nast¹pi³o przerwanie
;	clockCopyFinal.c:68: t0_flag = 0;	//wyzerowanie flagi informuj¹cej o przerwaniu
	jbc	_t0_flag,00147$
	sjmp	00125$
00147$:
;	clockCopyFinal.c:69: t0_serv();	//wywo³anie obs³ugi przerwania
	push	ar4
	push	ar5
	lcall	_t0_serv
	pop	ar5
	pop	ar4
;	clockCopyFinal.c:71: if(!key_p){ //Jeœli key_p osi¹gnie 0, to
	mov	a,_key_p
	jnz	00102$
;	clockCopyFinal.c:72: key_p=6; //ustaw go na 6
	mov	_key_p,#0x06
;	clockCopyFinal.c:73: *(keys+3) = *(keys+2); //i przesuñ wybrane klawisze
	mov	r6,(_keys + 0x0002)
	mov	(_keys + 0x0003),r6
;	clockCopyFinal.c:74: *(keys+2) = *(keys+1);
	mov	r6,(_keys + 0x0001)
	mov	(_keys + 0x0002),r6
;	clockCopyFinal.c:75: *(keys+1) = *(keys);
	mov	r6,_keys
	mov	(_keys + 0x0001),r6
;	clockCopyFinal.c:76: *(keys) = 0;
	mov	_keys,#0x00
00102$:
;	clockCopyFinal.c:79: if(led_p == 6){ //jeœli iterator tabeli time wyszed³ za ostatni wyœwietlacz
	mov	a,#0x06
	cjne	a,_led_p,00107$
;	clockCopyFinal.c:80: led_p = 0; //wyzerj go
	mov	_led_p,#0x00
;	clockCopyFinal.c:82: if(delay == 3){ //jeœli opóŸnienie wysz³o poza zakres
	mov	a,#0x03
	cjne	a,_delay,00104$
;	clockCopyFinal.c:83: delay = 0; //wyzeruj
	mov	_delay,#0x00
	sjmp	00107$
00104$:
;	clockCopyFinal.c:85: delay++; //inkrementuj
	inc	_delay
00107$:
;	clockCopyFinal.c:89: SEG_OFF = 1; //wy³¹cz wyœwietlacz
	setb	_SEG_OFF
;	clockCopyFinal.c:90: *led_wyb = 1 << led_p; //ustaw aktywny wyœwietlacz poprzez przesuniêcie bitowe jedynki o led_p miejsc w lewo
	mov	b,_led_p
	inc	b
	mov	a,#0x01
	sjmp	00155$
00153$:
	add	a,acc
00155$:
	djnz	b,00153$
	mov	r6,a
	mov	dpl,_main_led_wyb_1_1
	mov	dph,(_main_led_wyb_1_1 + 1)
	movx	@dptr,a
;	clockCopyFinal.c:91: if(mode){ //jeœli jest w trybie ustawiania
	jnb	_mode,00113$
;	clockCopyFinal.c:92: active_flag = (1 << led_p == active) || (1 << led_p == active*2); //sprawdŸ czy dany wyœwietlacz jest aktywny
	mov	b,_led_p
	inc	b
	mov	r6,#0x01
	mov	r7,#0x00
	sjmp	00158$
00157$:
	mov	a,r6
	add	a,r6
	mov	r6,a
	mov	a,r7
	rlc	a
	mov	r7,a
00158$:
	djnz	b,00157$
	mov	r2,_active
	mov	r3,#0x00
	mov	a,r6
	cjne	a,ar2,00159$
	mov	a,r7
	cjne	a,ar3,00159$
	sjmp	00130$
00159$:
	mov	a,_active
	mov	b,#0x02
	mul	ab
	mov	r2,a
	mov	r3,b
	mov	a,r6
	cjne	a,ar2,00160$
	mov	a,r7
	cjne	a,ar3,00160$
	sjmp	00130$
00160$:
	clr	_main_sloc0_1_0
	sjmp	00131$
00130$:
	setb	_main_sloc0_1_0
00131$:
	mov	c,_main_sloc0_1_0
;	clockCopyFinal.c:93: if(active_flag || (!active_flag && delay == 0)){ //jeœli wyœwietlacz jest aktywny, lub jeœli opóŸnienie jest równe 0
	mov	_active_flag,c
	jc	00108$
	jb	_active_flag,00114$
	mov	a,_delay
	jnz	00114$
00108$:
;	clockCopyFinal.c:94: *led_seg = zegar[led_p]; //ustaw wzór dla wyœwietlacza
	mov	a,_led_p
	add	a,#_zegar
	mov	r0,a
	mov	ar2,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	a,r2
	movx	@dptr,a
;	clockCopyFinal.c:95: SEG_OFF = 0; //w³¹cz wyœwietlacz
	clr	_SEG_OFF
	sjmp	00114$
00113$:
;	clockCopyFinal.c:98: *led_seg = zegar[led_p]; //ustaw wzór dla wyœwietlacza
	mov	a,_led_p
	add	a,#_zegar
	mov	r0,a
	mov	ar2,@r0
	mov	dpl,r4
	mov	dph,r5
	mov	a,r2
	movx	@dptr,a
;	clockCopyFinal.c:99: SEG_OFF = 0; //w³¹cz wyœwietlacz
	clr	_SEG_OFF
00114$:
;	clockCopyFinal.c:103: if(P3_5){ //jeœli klawisz zosta³ wciœniêty
	jnb	_P3_5,00116$
;	clockCopyFinal.c:104: *keys |= 1 << led_p; //pobierz go przez or logiczny na zmiennej keys[0] i aktywnym wyœwietlaczu
	mov	b,_led_p
	inc	b
	mov	a,#0x01
	sjmp	00167$
00165$:
	add	a,acc
00167$:
	djnz	b,00165$
	mov	r2,a
	orl	a,_keys
	mov	_keys,a
;	clockCopyFinal.c:105: key_p=1; //ustaw key_p
	mov	_key_p,#0x01
00116$:
;	clockCopyFinal.c:109: if((*keys == *(keys+1)) && (*keys == *(keys+2)) && (*keys != *(keys+3)) && (*keys != 0)) key_serv();
	mov	a,_keys
	mov	r2,a
	cjne	a,(_keys + 0x0001),00118$
	mov	a,r2
	cjne	a,(_keys + 0x0002),00118$
	mov	a,r2
	cjne	a,(_keys + 0x0003),00172$
	sjmp	00118$
00172$:
	mov	a,r2
	jz	00118$
	push	ar4
	push	ar5
	lcall	_key_serv
	pop	ar5
	pop	ar4
00118$:
;	clockCopyFinal.c:113: led_p++; //inkrementuj iterator dla wyœwietlaczy
	inc	_led_p
;	clockCopyFinal.c:114: key_p--; //dekrementuj key_p
	dec	_key_p
	ljmp	00125$
;------------------------------------------------------------
;Allocation info for local variables in function 'stan_zegara'
;------------------------------------------------------------
;------------------------------------------------------------
;	clockCopyFinal.c:121: void stan_zegara(void)
;	-----------------------------------------
;	 function stan_zegara
;	-----------------------------------------
_stan_zegara:
;	clockCopyFinal.c:123: time_p = 0;
	mov	_time_p,#0x00
;	clockCopyFinal.c:124: for(i = 0; i < 6; i += 2){
	mov	_i,#0x00
00101$:
	mov	a,#0x100 - 0x06
	add	a,_i
	jc	00105$
;	clockCopyFinal.c:125: zegar[i+1] = WZOR[(time[time_p])/10];	//ustawienie wartoœci dziesi¹tek
	mov	a,_i
	inc	a
	add	a,#_zegar
	mov	r0,a
	mov	a,_time_p
	add	a,#_time
	mov	r1,a
	mov	ar2,@r1
	mov	b,#0x0A
	mov	a,r2
	div	ab
	mov	dptr,#_WZOR
	movc	a,@a+dptr
	mov	r3,a
	mov	@r0,a
;	clockCopyFinal.c:126: zegar[i] = WZOR[(time[time_p])%10];	//ustawienie wartoœci jednostek
	mov	a,_i
	add	a,#_zegar
	mov	r0,a
	mov	b,#0x0A
	mov	a,r2
	div	ab
	mov	r2,b
	mov	a,r2
	mov	dptr,#_WZOR
	movc	a,@a+dptr
	mov	r2,a
	mov	@r0,a
;	clockCopyFinal.c:127: time_p++;
	inc	_time_p
;	clockCopyFinal.c:124: for(i = 0; i < 6; i += 2){
	inc	_i
	inc	_i
	sjmp	00101$
00105$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'przelicz'
;------------------------------------------------------------
;------------------------------------------------------------
;	clockCopyFinal.c:131: void przelicz(void)
;	-----------------------------------------
;	 function przelicz
;	-----------------------------------------
_przelicz:
;	clockCopyFinal.c:133: if(time[0] >= 200){ //jeœli sekundy zesz³y poni¿ej 0
	mov	a,#0x100 - 0xC8
	add	a,_time
	jnc	00102$
;	clockCopyFinal.c:134: time[1]--; //dekrementuj minuty
	mov	a,(_time + 0x0001)
	mov	r2,a
	dec	a
	mov	(_time + 0x0001),a
;	clockCopyFinal.c:135: time[0] = 59; //ustaw sekundy na 59
	mov	_time,#0x3B
00102$:
;	clockCopyFinal.c:137: if(time[1] >= 200){	//to samo dla minut
	mov	a,#0x100 - 0xC8
	add	a,(_time + 0x0001)
	jnc	00104$
;	clockCopyFinal.c:138: time[2]--;
	mov	a,(_time + 0x0002)
	mov	r2,a
	dec	a
	mov	(_time + 0x0002),a
;	clockCopyFinal.c:139: time[1] = 59;
	mov	(_time + 0x0001),#0x3B
00104$:
;	clockCopyFinal.c:141: if(time[2] >= 200){	//to samo dla godzin
	mov	a,#0x100 - 0xC8
	add	a,(_time + 0x0002)
	jnc	00106$
;	clockCopyFinal.c:142: time[2] = 23;
	mov	(_time + 0x0002),#0x17
00106$:
;	clockCopyFinal.c:145: if(time[0] >= 60){ //je¿eli sekundy siê przepe³ni³y
	mov	a,#0x100 - 0x3C
	add	a,_time
	jnc	00108$
;	clockCopyFinal.c:146: time[1]++; //inkrementuj liczbê minut
	mov	a,(_time + 0x0001)
	mov	r2,a
	inc	a
	mov	(_time + 0x0001),a
;	clockCopyFinal.c:147: time[0] = 0; //zeruj sekundy
	mov	_time,#0x00
00108$:
;	clockCopyFinal.c:149: if(time[1] >= 60){ //to samo dla minut
	mov	a,#0x100 - 0x3C
	add	a,(_time + 0x0001)
	jnc	00110$
;	clockCopyFinal.c:150: time[2]++;
	mov	a,(_time + 0x0002)
	mov	r2,a
	inc	a
	mov	(_time + 0x0002),a
;	clockCopyFinal.c:151: time[1] = 0;
	mov	(_time + 0x0001),#0x00
00110$:
;	clockCopyFinal.c:153: if(time[2] >= 24){ //to samo dla godzin
	mov	a,#0x100 - 0x18
	add	a,(_time + 0x0002)
	jnc	00112$
;	clockCopyFinal.c:154: time[2] = 0;
	mov	(_time + 0x0002),#0x00
00112$:
;	clockCopyFinal.c:157: stan_zegara(); //ustaw nowe wzory dla zegara
	ljmp	_stan_zegara
;------------------------------------------------------------
;Allocation info for local variables in function 't0_serv'
;------------------------------------------------------------
;------------------------------------------------------------
;	clockCopyFinal.c:160: void t0_serv(void)
;	-----------------------------------------
;	 function t0_serv
;	-----------------------------------------
_t0_serv:
;	clockCopyFinal.c:162: if(!mode){ //jeœli zegar jest w trybie odlicznia
	jb	_mode,00106$
;	clockCopyFinal.c:163: if(timer_buf) timer_buf--; //sprawdŸ czy licznik osi¹gn¹³ 0
	mov	a,_timer_buf
	orl	a,(_timer_buf + 1)
	jz	00102$
	dec	_timer_buf
	mov	a,#0xff
	cjne	a,_timer_buf,00112$
	dec	(_timer_buf + 1)
00112$:
	ret
00102$:
;	clockCopyFinal.c:165: timer_buf = 993; //zresetuj licznik
	mov	_timer_buf,#0xE1
	mov	(_timer_buf + 1),#0x03
;	clockCopyFinal.c:166: P1_7 = !P1_7;	//zaneguj diodê
	cpl	_P1_7
;	clockCopyFinal.c:167: time[0]++;	//zwiêksz liczbê sekund
	mov	a,_time
	inc	a
	mov	_time,a
;	clockCopyFinal.c:168: przelicz();	//sprawdŸ czy liczby nie wysz³y poza zakres
	ljmp	_przelicz
00106$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 't0_int'
;------------------------------------------------------------
;------------------------------------------------------------
;	clockCopyFinal.c:173: void t0_int(void) __interrupt(1)
;	-----------------------------------------
;	 function t0_int
;	-----------------------------------------
_t0_int:
;	clockCopyFinal.c:175: TL0 = TL0 | TL_0;
	orl	_TL0,#0x66
;	clockCopyFinal.c:176: TH0 = TH_0;
	mov	_TH0,#0xFC
;	clockCopyFinal.c:177: t0_flag = 1;
	setb	_t0_flag
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'key_serv'
;------------------------------------------------------------
;------------------------------------------------------------
;	clockCopyFinal.c:180: void key_serv()
;	-----------------------------------------
;	 function key_serv
;	-----------------------------------------
_key_serv:
;	clockCopyFinal.c:182: if(*keys == 0b10){ //esc
	mov	r2,_keys
	cjne	r2,#0x02,00102$
;	clockCopyFinal.c:183: mode = 0; //wyjdŸ z trybu ustawiania
	clr	_mode
;	clockCopyFinal.c:184: timer_buf = 993; //zresetuj licznik
	mov	_timer_buf,#0xE1
	mov	(_timer_buf + 1),#0x03
00102$:
;	clockCopyFinal.c:186: if(*keys == 0b1){ //enter
	cjne	r2,#0x01,00104$
;	clockCopyFinal.c:187: mode = 1; //wejdŸ w tryb ustawiania
	setb	_mode
;	clockCopyFinal.c:188: active = 1; //ustaw sekundy jako aktywne
	mov	_active,#0x01
00104$:
;	clockCopyFinal.c:190: if(*keys == 0b100 && mode){ //right arrow
	cjne	r2,#0x04,00109$
	jnb	_mode,00109$
;	clockCopyFinal.c:191: if(active == 1){ //jeœli aktywne s¹ sekundy
	mov	a,#0x01
	cjne	a,_active,00106$
;	clockCopyFinal.c:192: active = 16; //ustaw godziny jako aktywne
	mov	_active,#0x10
	sjmp	00109$
00106$:
;	clockCopyFinal.c:194: active = active/4; //ustaw segment po prawo jako aktywny
	mov	a,_active
	rr	a
	rr	a
	anl	a,#0x3f
	mov	_active,a
00109$:
;	clockCopyFinal.c:197: if(*keys == 0b100000 && mode){ //left arrow
	cjne	r2,#0x20,00115$
	jnb	_mode,00115$
;	clockCopyFinal.c:198: if(active == 16){ //jeœli godziny s¹ aktywne
	mov	a,#0x10
	cjne	a,_active,00112$
;	clockCopyFinal.c:199: active = 1; //ustaw sekundy jako aktywne
	mov	_active,#0x01
	sjmp	00115$
00112$:
;	clockCopyFinal.c:201: active = active*4; //ustaw segment po lewo jako aktywny
	mov	a,_active
	add	a,_active
	add	a,acc
	mov	_active,a
00115$:
;	clockCopyFinal.c:204: if(*keys == 0b1000 && mode){ //up arrow
	cjne	r2,#0x08,00124$
	jnb	_mode,00124$
;	clockCopyFinal.c:205: if(active == 1) time[0]++; //inkrementuj aktywny segment
	mov	a,#0x01
	cjne	a,_active,00118$
	mov	a,_time
	mov	r3,a
	inc	a
	mov	_time,a
00118$:
;	clockCopyFinal.c:206: if(active == 4) time[1]++;
	mov	a,#0x04
	cjne	a,_active,00120$
	mov	a,(_time + 0x0001)
	mov	r3,a
	inc	a
	mov	(_time + 0x0001),a
00120$:
;	clockCopyFinal.c:207: if(active == 16) time[2]++;
	mov	a,#0x10
	cjne	a,_active,00124$
	mov	a,(_time + 0x0002)
	mov	r3,a
	inc	a
	mov	(_time + 0x0002),a
00124$:
;	clockCopyFinal.c:209: if(*keys == 0b10000 && mode){ //down arrow
	cjne	r2,#0x10,00133$
	jnb	_mode,00133$
;	clockCopyFinal.c:210: if(active == 1) time[0]--; //dekrementuj aktywny segment
	mov	a,#0x01
	cjne	a,_active,00127$
	mov	a,_time
	mov	r2,a
	dec	a
	mov	_time,a
00127$:
;	clockCopyFinal.c:211: if(active == 4) time[1]--;
	mov	a,#0x04
	cjne	a,_active,00129$
	mov	a,(_time + 0x0001)
	mov	r2,a
	dec	a
	mov	(_time + 0x0001),a
00129$:
;	clockCopyFinal.c:212: if(active == 16) time[2]--;
	mov	a,#0x10
	cjne	a,_active,00133$
	mov	a,(_time + 0x0002)
	mov	r2,a
	dec	a
	mov	(_time + 0x0002),a
00133$:
;	clockCopyFinal.c:216: przelicz(); //sprawdŸ czy liczby nie wysz³y poza zakres
	ljmp	_przelicz
	.area CSEG    (CODE)
	.area CONST   (CODE)
_WZOR:
	.db #0x3F
	.db #0x06
	.db #0x5B
	.db #0x4F
	.db #0x66
	.db #0x6D
	.db #0x7D
	.db #0x07
	.db #0x7F
	.db #0x6F
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
