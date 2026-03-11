#!/data/data/com.termux/files/usr/bin/bash

clear

# Cores
green='\033[1;32m'
purple='\033[1;35m'
yellow='\033[1;33m'
red='\033[1;31m'
cyan='\033[1;36m'
blue='\033[1;34m'
pink='\033[1;35m'  # Rosa
white='\033[1;37m'
reset='\033[0m'

# FUNÇÃO PARA VOLTAR AO MENU
voltar_menu() {
    echo ""
    echo -e "${yellow}──────────────────────────────${reset}"
    read -p "$(echo -e "${green}[•] Pressione ENTER para voltar ao menu principal${reset}")"
    clear
    exec "$0"
    exit
}

# ===== BARRA DE PROGRESSO DO SCRIPT ANTIGO =====
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
            color="\033[1;32m"  # Verde
        elif ((progress % 3 == 1)); then
            color="\033[1;36m"  # Ciano
        else
            color="\033[1;35m"  # Roxo
        fi
        
        printf "\r${color}["
        printf "%0.s█" $(seq 1 $filled)
        printf "%0.s░" $(seq 1 $empty)
        printf "] %3d%%\033[0m" "$progress"
        sleep 0.1
    done
}

# ========== TÍTULO PRINCIPAL ==========
echo -e "${white}┌─────────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│  ${white}███╗   ███╗███████╗███╗   ██╗██╗   ██╗    ${red}██████╗  ██████╗  ██████╗██████╗ ██╗   ██╗  ${white}│${reset}"
echo -e "${white}│  ${white}████╗ ████║██╔════╝████╗  ██║██║   ██║    ${red}██╔══██╗██╔═══██╗██╔════╝██╔══██╗╚██╗ ██╔╝  ${white}│${reset}"
echo -e "${white}│  ${white}██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ${red}██████╔╝██║   ██║██║     ██████╔╝ ╚████╔╝   ${white}│${reset}"
echo -e "${white}│  ${white}██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ${red}██╔══██╗██║   ██║██║     ██╔══██╗  ╚██╔╝    ${white}│${reset}"
echo -e "${white}│  ${white}██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ${red}██║  ██║╚██████╔╝╚██████╗██║  ██║   ██║     ${white}│${reset}"
echo -e "${white}│  ${white}╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝     ${red}╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝     ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────────┘${reset}"

# PAUSA DE 1 SEGUNDO
sleep 1

# ========== CRÉDITOS ==========
echo -e "${white}│  ${red}⚡${white} SISTEMA DE BYPASS ${red}⚡${cyan} // ${purple}DEVELOPED BY AUCEROLA NOCRY${cyan} // ${red}EQP NOCRY${red} ⚡${white}  │${reset}"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# ========== DESENHO DO HACKER COM GRADIENTE BRANCO → ROSA → VERMELHO ==========
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠉⠉⠉⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${pink}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${pink}⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${pink}⣿⣿⣿⣿⣿⢽⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠙⠻⣿⣿⣿⣿⣿⡃⠀⠀⢀⣴⣶⣿⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${pink}⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣦⣤⣾⣿⣿⣿⡿⠃⣠⣴⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${pink}⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠈⠉⠻⣿⣿⣿⣿⣇⣼⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${pink}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣄⣀⠀⠀⠀⣀⣠⣴⣶⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣾⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠘⠻⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⡛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣾⣿⣿⣏⠛⠿⣿⣿⡿⠋⢉⣿⣿⣿⣿⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠘⣆⠀⠈⠛⠿⠿⠿⠃⠀⠀⠀⠀⠀⠙⠿⠛⠛⠁⠀⢠⡿⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠘⣧⠀⢀⣀⣀⣀⠀⠀⠸⠿⠆⠀⣀⣀⣠⣤⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⢧⡀⢉⡛⠿⠿⠿⠶⠶⠾⠿⠿⠟⠋⠁⢠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⣾⣿⣿⣷⣄⠀⠀⠀⢠⣤⣶⡆⣠⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿${reset}"
echo -e "${red}⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⠀⠀⠀⢸⣿⣿⣷⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛${reset}"
echo -e "${red}⡿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡄⠀⠀⢸⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠇⠀⠀⠘⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"

echo -e "$reset"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# ========== MENU PRINCIPAL ==========
echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│${white}                     MENU PRINCIPAL                    ${white}│${reset}"
echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${white}│  ${pink}[1] INSTALAR OBBS                                 ${white}│${reset}"
echo -e "${white}│  ${blue}[2] ANT SCANNER                                   ${white}│${reset}"
echo -e "${white}│  ${red}[3] SAIR                                          ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
echo ""

echo -e -n "${white}┌─[${red}NOCRY${white}@${cyan}TERMUX${white}]${reset}\n${white}└──╼ ${yellow}"
read menu

if [ "$menu" = "1" ]; then

clear

# ========== SUBMENU INSTALAR OBBS ==========
echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│${pink}                   INSTALAR OBBS                      ${white}│${reset}"
echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${white}│  ${white}[1] FREE FIRE NORMAL                              ${white}│${reset}"
echo -e "${white}│  ${pink}[2] FREE FIRE MAX                                ${white}│${reset}"
echo -e "${white}│  ${red}[0] VOLTAR AO MENU                               ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
echo ""

echo -e -n "${white}┌─[NOCRY | OBBS]${reset}\n${red}└──╼ "
read obb

if [ "$obb" = "1" ]; then

echo ""
echo -e "$pink [•] Iniciando instalação...$reset"
echo ""

# Instala o curl se não tiver
pkg install curl -y > /dev/null 2>&1

OBB_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v1/main.2019116013.com.dts.freefireth.obb"
ARQUIVO="main.2019116013.com.dts.freefireth.obb"
DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"

echo -e "$cyan [↓] Baixando OBB...$reset"
echo ""

# Download com a BARRA DO SCRIPT ANTIGO
curl -L -s -o "$ARQUIVO" "$OBB_URL" &
pid=$!

progress_bar
wait $pid

printf "\r\033[1;32m[██████████████████████████████████████████████████] 100%%\033[0m\n"

echo ""
echo -e "$pink [✓] Download concluído!$reset"
echo ""

# Move o arquivo silenciosamente
mv "$ARQUIVO" "$DESTINO" 2>/dev/null

echo ""
voltar_menu

elif [ "$obb" = "2" ]; then

echo ""
echo -e "$pink ⚠️  FREE FIRE MAX EM DESENVOLVIMENTO ⚠️$reset"
echo ""
voltar_menu

elif [ "$obb" = "0" ]; then

voltar_menu

else

echo ""
echo -e "$red [✘] Opção inválida!$reset"
echo ""
voltar_menu

fi

elif [ "$menu" = "2" ]; then

echo ""
echo -e "$blue ⚠️  ANT SCANNER EM BREVE ⚠️$reset"
echo ""
voltar_menu

elif [ "$menu" = "3" ]; then

echo ""
echo -e "$red [✘] Saindo do sistema...$reset"
echo ""
exit

else

echo ""
echo -e "$red [✘] Opção inválida!$reset"
echo ""
voltar_menu

fi
