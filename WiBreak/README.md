# WiBreak 

# (ESTA HERRAMIENTA SE ENCUENTRA EN MEJORAS, PROXIMAMENTE NUEVOS MODOS DE ATAQUE, ENTRE OTRAS COSAS)

[![Logo](https://github.com/Invertebr4do/WiBreak/blob/main/WiBreak.png?raw=true "Logo")](https://github.com/Invertebr4do/MM-WN722N/blob/main/img_header.png?raw=true "Logo")

Herramienta para automatizar los ataques para optención de hanshake, PKMID attack y causar caos en la red, incluso logrando causar un DOS **(USAR CON PRECAUCIÓN)**

## Testeado en los siguientes OS:
- Kali linux 2021.2
- Parrot security 4.11.2

## Instalación:
- Clonamos el repositorio
```
git clone https://github.com/Invertebr4do/WiBreak
```
- Nos metemos en el directorio, asignamos permisos de ejecución a la herramienta

```
cd WiBreak && chmod +x WiBreak.sh
```
- Y ejecutamos WiBreak.sh

```
./WiBreak.sh
```

```bash
[!] Use: ./WiBreak.sh
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

        ┃  [-a] Attack Mode
                handshake
                PKMID
                ALL
                DESTROY
        ┃  [-i] Interface in monitor mode
        ┃  [-m] MAC address
        ┃  [-t] Timeout
        ┃  [-l] List red interfaces
        ┃  [-h] Show this help panel

        Use examples:

                ./WiBreak.sh -l
                ./WiBreak.sh -a handshake -i wlan0mon
                ./WiBreak.sh -a handshake -m fc:e5:57:fc:ad:b4 -i wlan0mon
                ./WiBreak.sh -a PKMID -i wlan0mon
                ./WiBreak.sh -a ALL -i wlan0mon
                ./WiBreak.sh -a DESTROY -i wlan0mon -t 40
```
