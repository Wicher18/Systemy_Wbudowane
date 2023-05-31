# Systemy wbudowane

Projekt zegara na DSM-51 na zajęcia z systemów wbudowanych.<br/>
Napisany w C, skompilowany za pomocą sdcc

## Działanie programu

Po uruchomieniu programu czas jest odliczany i wyświetlany na wyświetlaczu siedmio-segmentowym.<br/>
Wciśnięcie przycisku ENTER na klawiaturze sekwencyjnej przełącza zegar w tryb ustawiania. Czas przestaje być odliczany, a wszystkie wyświetlacze poza dwoma najmłodszymi (odpowiedzialnymi za sekundy) są uruchamiane z mniejszą częstotliwością, więc są ciemniejsze. <br/>
Strzałki w górę i w dół zmieniają wartość aktywnego segmentu, a strzałki na bok zmieniają aktywny segment<br/>
Przycisk ESC na klawiaturze sekwencyjnej wychodzi z trybu ustawiania i wznawia odliczanie czasu