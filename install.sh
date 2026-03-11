#!/data/data/com.termux/files/usr/bin/bash

clear

cyan='\033[1;36m'
green='\033[1;32m'
yellow='\033[1;33m'
red='\033[1;31m'
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
⡿⠟⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⡀⠀⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

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

read -p "Escolha uma opção: " menu

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

pkg install curl -y > /dev/null

OBB_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v1/main.2019116013.com.dts.freefireth.obb"

DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec"

mkdir -p "$DESTINO"

echo ""
echo "Baixando OBB (258MB)..."
curl -L -o main.2019116013.com.dts.freefireth.obb "$OBB_URL"

echo ""
echo "Movendo arquivo..."
mv main.2019116013.com.dts.freefireth.obb "$DESTINO/"

echo ""
echo -e "$green ✔ OBB instalada com sucesso!"
echo "Local:"
echo "$DESTINO"

elif [ "$obb" = "2" ]; then

echo ""
echo -e "$yellow FREE FIRE MAX$reset"
echo ""
echo "Status: INDISPONÍVEL"
echo "Atualização em andamento..."
echo "Equipe Nocry está preparando suporte."

fi

elif [ "$menu" = "2" ]; then

echo ""
echo -e "$yellow ANT SCANNER$reset"
echo ""
echo "Função em desenvolvimento."
echo "Atualização em breve."

elif [ "$menu" = "3" ]; then

echo "Saindo..."
exit

else

echo -e "$red Opção inválida.$reset"

fi
