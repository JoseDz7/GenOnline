#!/bin/bash

#Generador online -- No Open Source!! (LocalHost:8080-4040)

trap 'printf "\n";stop;exit 1' 2
# ===============================================
#               COLORES RESALTADOS :D
# ===============================================
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
# ===============================================
#                 COLORES BAJOS
# ===============================================
black="\e[0;30m"
blue="\e[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;35m"
yellow="\e[0;33m"
white="\e[0;37m"
#rnd=`shuf -i 3000-10000 -n 1`
crnd=`shuf -i 1-9 -n 1`
DIA=`date +"%d/%m/%Y"`
HORA=`date +"%H:%M"`
link="localhost:3333"
#brnd=`shuf -i 2-7 -n 1`
s="m"
bcolor="\e[1;3$crnd$s"
defaultport=8000

error() { echo -e "${negro}[${verde} !! ${negro}] >>>${verde} Proceso interrupido por el usuario  $*"; exit 1
}

stop() {
checkng=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkng == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
cd sites/pagina
sed -i "/<meta property='og:.*' content='.*'/d" ./index.html &> /dev/null
}

trap 'printf "\n";stop;error;exit 1' 2

depen() {
printf "\e[1;92m"
command -v php > /dev/null 2>&1 || { echo -e >&2 "Requiero php. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v curl > /dev/null 2>&1 || { echo -e >&2 "Requiero curl. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v ngrok > /dev/null 2>&1 || { echo -e >&2 "Requiero ngrok. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo -e >&2 "Requiero openssh. Por favor instalalo. Abortando... \e[0m"; sleep 2; exit 1; }
}

banner(){
	clear
	sleep 0.5
echo -e "
 ██████╗ ██████╗ ██████╗ ███████╗███╗   ██╗ • ╔═╗╔╗╔╦  ╦╔╗╔╔═╗ •
██╔════╝██╔════╝██╔════╝ ██╔════╝████╗  ██║ • ║ ║║║║║  ║║║║║╣  •
██║     ██║     ██║  ███╗█████╗  ██╔██╗ ██║ • ╚═╝╝╚╝╩═╝╩╝╚╝╚═╝ •
██║     ██║     ██║   ██║██╔══╝  ██║╚██╗██║ • G ╔═╗╔═╗╔╦╗╔═╗ G •
╚██████╗╚██████╗╚██████╔╝███████╗██║ ╚████║ • E ║  ║ ║ ║║║╣  E •
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝ • N ╚═╝╚═╝═╩╝╚═╝ N •
  .:.:.:.:.Generador Online Lives.:.:.:.:.      !!The best!!" | lolcat -S 99
}
local(){
	banner
echo ""
echo -e "${negro}[${verde} !! ${negro}] >>>${verde} Verificando internet${negro} :)"
sleep 4
echo ""
echo -e "${negro}[${verde} :D ${negro}] >>>${verde} Abriendo servidores php${negro} :)"
sleep 3
cd sites/pagina && php -S 127.0.0.1:8080 > /dev/null 2>&1 &
sleep 2
echo ""
echo -e "${negro}[${verde} !! ${negro}] >>>${verde} LINK : localhost:8080"
sleep 3
echo ""
echo -e "${negro} ctrl + c pasa salir!!${negro} :)"
echo ""
sleep 10000000000000000000000000000000
}
local
