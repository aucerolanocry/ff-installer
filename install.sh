#!/data/data/com.termux/files/usr/bin/bash

clear

cyan='\033[1;36m'
green='\033[1;32m'
purple='\033[1;35m'
yellow='\033[1;33m'
reset='\033[0m'

echo -e "$cyan"

cat << "EOF"

⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠈⠉⠙⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣤⣄⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠾⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⣤⣶⣤⣉⣿⣿⡯⣀⣴⣿⡗⠀⠀⠀⠀⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⡈⠀⠀⠉⣿⣿⣶⡉⠀⠀⣀⡀⠀⠀⠀⢻⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡇⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⢸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠉⢉⣽⣿⠿⣿⡿⢻⣯⡍⢁⠄⠀⠀⠀⣸⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠐⡀⢉⠉⠀⠠⠀⢉⣉⠀⡜⠀⠀⠀⠀⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠘⣤⣭⣟⠛⠛⣉⣁⡜⠀⠀⠀⠀⠀⠛⠿⣿⣿⣿

        AUCEROLA NOCRY
          EQP NOCRY

EOF

echo -e "$reset"

echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "      MENU BYPASS"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "1 - INSTALAR OBBS"
echo "2 - ANT SCANNER"
echo "3 - SAIR"
echo "━━━━━━━━━━━━━━━━━━━━━━"

read -p "Escolha: " menu

if [ "$menu" = "1" ]; then

clear

echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "      INSTALAR OBBS"
echo "━━━━━━━━━━━━━━━━━━━━━━"
echo "1 - FREE FIRE NORMAL"
echo "2 - FREE FIRE MAX"
echo "━━━━━━━━━━━━━━━━━━━━━━"

read -p "Escolha: " obb

if [ "$obb" = "1" ]; then

echo ""
echo -e "$green Iniciando instalação...$reset"

pkg install curl -y > /dev/null 2>&1

OBB_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v1/main.2019116013.com.dts.freefireth.obb"

ARQUIVO="main.2019116013.com.dts.freefireth.obb"

curl -L -s -o "$ARQUIVO" "$OBB_URL" &

pid=$!

progress_bar() {

progress=0

while kill -0 $pid 2>/dev/null; do

progress=$((progress+1))

if [ $progress -gt 100 ]; then
progress=100
fi

filled=$((progress/2))
empty=$((50-filled))

if ((progress % 3 == 0)); then
color="\033[1;32m"
elif ((progress % 3 == 1)); then
color="\033[1;36m"
else
color="\033[1;35m"
fi

printf "\r${color}["
printf "%0.s█" $(seq 1 $filled)
printf "%0.s░" $(seq 1 $empty)
printf "] %3d%%\033[0m" "$progress"

sleep 0.1

done

}

progress_bar
wait $pid

printf "\r\033[1;32m[██████████████████████████████████████████████████] 100%%\033[0m\n"

echo ""
echo -e "$green ✔ Instalação concluída!$reset"

elif [ "$obb" = "2" ]; then

echo ""
echo -e "$yellow Free Fire Max em desenvolvimento...$reset"

fi

elif [ "$menu" = "2" ]; then

echo ""
echo -e "$purple ANT SCANNER EM BREVE$reset"

elif [ "$menu" = "3" ]; then

exit

fi
