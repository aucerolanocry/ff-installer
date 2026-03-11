#!/data/data/com.termux/files/usr/bin/bash

clear

# Cores
green='\033[1;32m'
purple='\033[1;35m'
yellow='\033[1;33m'
red='\033[1;31m'
cyan='\033[1;36m'
blue='\033[1;34m'
pink='\033[1;35m'
white='\033[1;37m'
magenta='\033[1;35m'
reset='\033[0m'

# FUNÇÃO PARA VOLTAR AO MENU (CORRIGIDA)
voltar_menu() {
    echo ""
    echo -e "${yellow}──────────────────────────────${reset}"
    read -p "$(echo -e "${green}[•] Pressione ENTER para voltar ao menu principal${reset}")"
    clear
    exec "$0"
    exit
}

# ========== BARRA DE PROGRESSO COLORIDA PISCANTE ==========
progress_bar_colorido() {
    local -a cores=($red $yellow $green $cyan $blue $purple $magenta)
    local cor_index=0
    
    for ((i=0; i<=100; i+=5)); do
        # Alterna as cores
        cor_index=$(( (cor_index + 1) % 7 ))
        color=${cores[$cor_index]}
        
        # Desenha a barra com █ preenchido e ░ vazio
        barra=""
        for ((j=0; j<i; j+=5)); do barra+="█"; done
        for ((j=i; j<100; j+=5)); do barra+="░"; done
        
        # Mostra a barra piscante
        printf "\r${color}[${white}%s${color}] ${white}%3d%%${reset}" "$barra" "$i"
        sleep 0.2
    done
    
    # Final em verde
    barra=""
    for ((i=0; i<20; i++)); do barra+="█"; done
    printf "\r${green}[${white}%s${green}] ${white}100%%${reset}\n" "$barra"
}

# ========== TÍTULO PRINCIPAL (SOZINHO) ==========
echo -e "${green}┌─────────────────────────────────────────────────────────┐${reset}"
echo -e "${green}│  ${white}███╗   ███╗███████╗███╗   ██╗██╗   ██╗    ${red}██████╗  ██████╗  ██████╗██████╗ ██╗   ██╗  ${green}│${reset}"
echo -e "${green}│  ${white}████╗ ████║██╔════╝████╗  ██║██║   ██║    ${red}██╔══██╗██╔═══██╗██╔════╝██╔══██╗╚██╗ ██╔╝  ${green}│${reset}"
echo -e "${green}│  ${white}██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ${red}██████╔╝██║   ██║██║     ██████╔╝ ╚████╔╝   ${green}│${reset}"
echo -e "${green}│  ${white}██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ${red}██╔══██╗██║   ██║██║     ██╔══██╗  ╚██╔╝    ${green}│${reset}"
echo -e "${green}│  ${white}██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ${red}██║  ██║╚██████╔╝╚██████╗██║  ██║   ██║     ${green}│${reset}"
echo -e "${green}│  ${white}╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝     ${red}╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝     ${green}│${reset}"
echo -e "${green}└─────────────────────────────────────────────────────────┘${reset}"

# PAUSA DE 1 SEGUNDO
sleep 1

# ========== CRÉDITOS ==========
echo -e "${green}│  ${red}⚡${yellow} SISTEMA DE BYPASS ${red}⚡${cyan} // ${purple}DEVELOPED BY AUCEROLA NOCRY${cyan} // ${green}EQP NOCRY${red} ⚡${green}  │${reset}"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# ========== DESENHO DO HACKER ==========
echo -e "$green"
cat << "EOF"
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠉⠉⠉⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⢽⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠙⠻⣿⣿⣿⣿⣿⡃⠀⠀⢀⣴⣶⣿⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣦⣤⣾⣿⣿⣿⡿⠃⣠⣴⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠈⠉⠻⣿⣿⣿⣿⣇⣼⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣄⣀⠀⠀⠀⣀⣠⣴⣶⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣾⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿��⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠘⠻⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⡛⠛⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣾⣿⣿⣏⠛⠿⣿⣿⡿⠋⢉⣿⣿⣿⣿⠀⠀⢰⡇⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠘⣆⠀⠈⠛⠿⠿⠿⠃⠀⠀⠀⠀⠀⠙⠿⠛⠛⠁⠀⢠⡿⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠘⣧⠀⢀⣀⣀⣀⠀⠀⠸⠿⠆⠀⣀⣀⣠⣤⠀⢠⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⢧⡀⢉⡛⠿⠿⠿⠶⠶⠾⠿⠿⠟⠋⠁⢠⡾⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢳⣾⣿⣿⣷⣄⠀⠀⠀⢠⣤⣶⡆⣠⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⠀⠀⠀⢸⣿⣿⣷⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛
⡿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡄⠀⠀⢸⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⠇⠀⠀⠘⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

echo -e "$reset"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# ========== MENU PRINCIPAL ==========
echo -e "${cyan}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${cyan}│${green}                     MENU PRINCIPAL                    ${cyan}│${reset}"
echo -e "${cyan}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${cyan}│  ${pink}[1] INSTALAR OBBS                                 ${cyan}│${reset}"
echo -e "${cyan}│  ${blue}[2] ANT SCANNER                                   ${cyan}│${reset}"
echo -e "${cyan}│  ${red}[3] SAIR                                          ${cyan}│${reset}"
echo -e "${cyan}└─────────────────────────────────────────────────────┘${reset}"
echo ""

echo -e -n "${green}┌─[${red}NOCRY${green}@${cyan}TERMUX${green}]${reset}\n${green}└──╼ ${yellow}"
read menu

if [ "$menu" = "1" ]; then

clear

echo -e "${cyan}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${cyan}│${pink}                   INSTALAR OBBS                      ${cyan}│${reset}"
echo -e "${cyan}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${cyan}│  ${pink}[1] FREE FIRE NORMAL                              ${cyan}│${reset}"
echo -e "${cyan}│  ${blue}[2] FREE FIRE MAX                                ${cyan}│${reset}"
echo -e "${cyan}│  ${yellow}[0] VOLTAR AO MENU                               ${cyan}│${reset}"
echo -e "${cyan}└─────────────────────────────────────────────────────┘${reset}"
echo ""

echo -e -n "${pink}┌─[NOCRY@OBBS]${reset}\n${pink}└──╼ "
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

# Download com barra de progresso COLORIDA
curl -L -o "$ARQUIVO" "$OBB_URL" --progress-bar 2>&1 > /dev/null &
progress_bar_colorido

echo ""
echo -e "$pink [✓] Download concluído!$reset"
echo ""

# Move o arquivo silenciosamente
mkdir -p "$DESTINO" 2>/dev/null
mv "$ARQUIVO" "$DESTINO" 2>/dev/null

echo -e "$green [✓] Arquivo movido para: $DESTINO$reset"
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
