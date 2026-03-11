#!/data/data/com.termux/files/usr/bin/bash

clear

# Cores
green='\033[1;32m'
purple='\033[1;35m'
yellow='\033[1;33m'
red='\033[1;31m'
red_dark='\033[0;31m'
cyan='\033[1;36m'
blue='\033[1;34m'
silver='\033[0;37m'   # PRATA (cinza médio)
white='\033[1;37m'    # BRANCO (mais brilhante)
reset='\033[0m'

# FUNÇÃO PARA VOLTAR AO MENU
voltar_menu() {
    echo ""
    echo -e -n "${white}[•] Pressione ENTER para voltar ao menu principal${reset}"
    read
    clear
    exec "$0"
    exit
}

# ===== BARRA DE PROGRESSO VERMELHA PISCANTE =====
progress_bar() {
    progress=0
    while kill -0 $pid 2>/dev/null; do
        progress=$((progress+1))
        if [ $progress -gt 100 ]; then
            progress=100
        fi
        filled=$((progress/2))
        empty=$((50-filled))
        
        # Efeito piscante: alterna entre vermelho brilhante e escuro
        if ((progress % 2 == 0)); then
            color="\033[1;31m"  # Vermelho brilhante
        else
            color="\033[0;31m"  # Vermelho escuro
        fi
        
        printf "\r${color}["
        printf "%0.s█" $(seq 1 $filled)
        printf "%0.s░" $(seq 1 $empty)
        printf "] %3d%%\033[0m" "$progress"
        sleep 0.1
    done
}

# ========== TÍTULO PRINCIPAL ORIGINAL ==========
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
echo -e "${white}│  ${red}𓆩♱𓆪${white} SISTEMA DE BYPASS ${red}𓅃${silver} // ${silver}DEVELOPED BY AUCEROLA NOCRY${silver} // ${red}EQP NOCRY${red} ${red}𓆩♱𓆪${white}  │${reset}"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# ========== DESENHO DO HACKER PRINCIPAL COM GRADIENTE ==========
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠉⠉⠉⠛⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${white}⣿⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${silver}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${silver}⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢻⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${silver}⣿⣿⣿⣿⣿⢽⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠙⠻⣿⣿⣿⣿⣿⡃⠀⠀⢀⣴⣶⣿⣷⡦⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${silver}⣿⣿⣿⣿⣿⣽⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣦⣤⣾⣿⣿⣿⡿⠃⣠⣴⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${silver}⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⠈⠉⠻⣿⣿⣿⣿⣇⣼⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
echo -e "${silver}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣄⣀⠀⠀⠀⣀⣠⣴⣶⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿${reset}"
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
echo -e "${white}│  ${white}[1] INSTALAR OBBS                               ${white}│${reset}"
echo -e "${white}│  ${silver}[2] ANT SCANNER                                 ${white}│${reset}"
echo -e "${white}│  ${red}[3] SAIR                                          ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
echo ""

# PROMPT PRINCIPAL COM INPUT EM CINZA
echo -e -n "${white}NOCRY${silver} | ${red}TERMUX${reset}\n${white}└──╼ ${silver}"
read menu

if [ "$menu" = "1" ]; then

clear

# ========== DESENHO DE CIMA COM GRADIENTE ==========
echo -e "${white}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${white}⠲⢶⣶⠒⠒⠿⣶⠒⠚⢿⡒⠛⣻⣿⣿⣿⡛⠛⢻⡟⠛⣻⠟⢻⣿⡿⣿⠉⠉⠛⢿⡛⠛⢻⡟⠛⢿⣿⣿⣿⣿⣹⡿⠋⣿⠟⠛⣻⠟⢻⡿⠛⠿⣿⠻⢿⡛⢿⡛⢿⣿⣿⣿⣿⣿⣿⠟⠛⣿⠟⣻⠟⢛⣿⠿⠷${reset}"
echo -e "${silver}⠀⠀⠹⣧⠀⠀⢹⡆⠀⢸⣧⡾⣻⣿⣧⠀⠙⣳⣾⡀⢰⠏⢠⡿⢸⠀⠘⢷⡀⠀⠀⢿⡀⠀⢻⣴⠟⣿⣽⣽⣿⠟⢷⣤⡇⠀⢠⡏⢠⡟⠀⠀⠀⠈⣇⠈⣧⢈⣷⣟⢻⣾⣹⣿⣼⠿⣦⣼⠃⣰⠏⢀⡾⠁⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠘⣧⠀⠀⣿⢠⡾⠛⣷⣏⣿⠹⣤⡾⠉⣩⡿⠿⣦⣿⠁⢸⠀⠀⠈⣧⠀⠀⢸⣧⡶⠛⢿⣼⠁⢹⠁⠈⣷⣠⡟⠛⢶⣼⡇⣾⠀⠀⠀⠀⠀⢸⣠⡿⢿⣄⢻⣾⡋⢻⠏⢿⣴⠟⢻⣶⡏⠀⡼⠁⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⢸⡄⢀⡿⠛⠳⣦⡟⠙⣿⠖⣿⠀⡼⠋⠀⣠⡾⠛⠓⢸⠀⠀⠀⢸⣆⣠⡾⠻⣦⡀⣸⠟⠳⣾⡶⠛⠙⢻⡄⢀⡿⠉⣻⣿⡄⠀⠀⠀⠀⠞⠛⢷⣄⢹⣶⡟⠛⢿⡾⠛⢿⣠⡟⠉⢻⣶⡇⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⣸⡿⠛⢶⣄⠀⣿⠷⢦⣿⣤⢾⣿⠃⠀⣼⠏⠀⠀⠀⢸⠀⠀⠀⣠⠿⣧⣀⠀⠈⢿⡏⠀⠀⢻⠀⠀⣀⣀⣿⣼⢃⡾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣆⣿⠛⠳⣾⣀⣤⠾⢿⣀⣴⠟⠉⠛⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠘⠃⠀⠀⠀⢹⣾⠇⠀⠀⣿⠁⠀⢻⣄⣾⠃⠀⠀⠀⠀⢸⠀⠀⠈⠁⠀⠀⠻⣦⢀⡾⠻⠶⣤⣸⣴⠞⠋⠁⠈⢻⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⠷⢶⣄⣸⠏⣠⣴⠾⣿⠁⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠟⠛⠻⣿⣴⠾⠿⣿⠃⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠘⣿⣃⣀⠀⠈⢹⠃⢀⣤⠾⠛⠛⠛⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠀⠀⠙⢾⡻⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⣿⠀⠀⠀⠘⠂⠀⠀⠀⢸⠀⢸⠀⡇⠀⠀⠀⠀⠀⠰⠏⠀⠉⠙⢷⣼⣶⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⠀⠀⠀⡀⠀⢸⡀⢸⠀⡇⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡤⠤⢽⣿⡿⢥⣜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡔⠑⡯⠻⢻⠑⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⣼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠳⠀⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "$reset"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# ========== SUBMENU INSTALAR OBBS ==========
echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│${silver}                   INSTALAR OBBS                      ${white}│${reset}"
echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${white}│  ${white}[1] FREE FIRE NORMAL                              ${white}│${reset}"
echo -e "${white}│  ${silver}[2] FREE FIRE MAX                                ${white}│${reset}"
echo -e "${white}│  ${red}[0] VOLTAR AO MENU                               ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
echo ""

# PROMPT OBBS COM INPUT EM CINZA
echo -e -n "${white}NOCRY${silver} | ${red}OBBS${reset}\n${red}└──╼ ${silver}"
read obb

if [ "$obb" = "1" ]; then

echo ""
echo -e "$red [↓] Baixando OBB do FF NORMAL...$reset"
echo ""

# Instala o curl se não tiver
pkg install curl -y > /dev/null 2>&1

OBB_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v1/main.2019116013.com.dts.freefireth.obb"
ARQUIVO="main.2019116013.com.dts.freefireth.obb"
DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"

# Download com barra VERMELHA PISCANTE
curl -L -s -o "$ARQUIVO" "$OBB_URL" &
pid=$!

progress_bar
wait $pid

printf "\r\033[1;31m[██████████████████████████████████████████████████] 100%%\033[0m\n"

echo ""
echo -e "$silver [✓] Download concluído!$reset"
echo ""

# Move o arquivo silenciosamente
mv "$ARQUIVO" "$DESTINO" 2>/dev/null

# ========== DESENHO DE BAIXO COM GRADIENTE ==========
echo -e "${white}⠁⢂⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${white}⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${white}⠈⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣶⣶⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⢿⣿⣷⣦⣤⣄⣈⣉⣹⣷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⣀⣤⣴⣶⣚⠋⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢠⣿⣾⠟⢫⡏⠁⠀⠉⢙⠻⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⣾⣿⣏⡿⠃⠀⠀⠀⠀⠀⠉⠙⣷⣤⡀⠀⠀⣠⣶⡷⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⡿⠋⠀⠀⠀⠀⠀⣠⣤⣄⠀⢻⣧⠀⠀⠀⢿⣘⡿⣼⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⡯⣷⣶⡄⠀⠀⠀⢺⣿⣿⣿⡇⠸⣿⠄⠀⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⡀⠀⠀⠀⠀⠀⠀⠉⠛⢓⣶⣤⣀⡄⠡⣯⡻⠿⠃⠀⠀⠀⠘⠟⠛⡏⠀⣸⠇⢀⣀⣤⣴⣛⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠸⡄⠀⠀⠄⠠⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣦⣘⠳⣤⡀⠀⠀⠀⠀⠀⢀⣡⣴⣏⣤⣾⣿⣿⣿⣿⣿⣶⣦⣤⣀⣀⣀⣀⣀⡀⠀⠄⠀${reset}"
echo -e "${red}⠀⠙⠳⠶⢶⣶⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣾⣯⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣻⠛⠟⠛⠛⠉⠉⠉⠀⠃${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠉⠁⢀⣠⡿⢿⣿⢿⣿⠿⢛⣿⣿⣿⣿⣿⡟⠋⠁⠀⣟⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣛⠛⠛⠉⠛⠙⠋⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⡴⠞⠉⡴⠋⢡⡿⠋⠀⣨⡿⣫⣿⣿⢹⠇⠀⠀⠀⢹⡸⣿⣿⣿⡛⢿⣦⠀⠈⠉⠛⠻⢤⡀⠀⠈⠑⠢⠄⠤⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⣴⢏⡄⠀⣸⠟⠈⣽⣿⡏⣼⠀⠀⠀⠀⢸⡇⢻⡀⠹⣟⠮⢿⣆⠀⠀⠀⠀⠀⠉⠓⠄⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠋⠀⣰⠋⠀⠾⢻⡟⡷⣿⠀⠀⣀⠀⢸⡗⣹⡧⠀⠹⢆⠀⠘⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⣺⡇⢹⣿⡷⣤⣀⣠⢿⣿⡟⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢹⠀⢻⣧⣸⡏⠀⣺⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠞⠀⠀⣿⢷⡇⣠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠄⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "$reset"
echo ""

# ========== VOLTAR ==========
echo ""
voltar_menu

elif [ "$obb" = "2" ]; then

echo ""
echo -e "$silver [↓] Baixando OBB do FF MAX...$reset"
echo ""

# Instala o curl se não tiver
pkg install curl -y > /dev/null 2>&1

OBB_MAX_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v2/main.2019116013.com.dts.freefiremax.obb"
ARQUIVO="main.2019116013.com.dts.freefiremax.obb"
DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"

# Download com barra VERMELHA PISCANTE
curl -L -s -o "$ARQUIVO" "$OBB_MAX_URL" &
pid=$!

progress_bar
wait $pid

printf "\r\033[1;31m[██████████████████████████████████████████████████] 100%%\033[0m\n"

echo ""
echo -e "$silver [✓] Download concluído!$reset"
echo ""

# Move o arquivo silenciosamente
mv "$ARQUIVO" "$DESTINO" 2>/dev/null

# ========== DESENHO DE BAIXO COM GRADIENTE ==========
echo -e "${white}⠁⢂⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${white}⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${white}⠈⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣶⣶⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⢿⣿⣷⣦⣤⣄⣈⣉⣹⣷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⣀⣤⣴⣶⣚⠋⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⢠⣿⣾⠟⢫⡏⠁⠀⠉⢙⠻⣦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢡⣾⣿⣏⡿⠃⠀⠀⠀⠀⠀⠉⠙⣷⣤⡀⠀⠀⣠⣶⡷⢦⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⡿⡿⠋⠀⠀⠀⠀⠀⣠⣤⣄⠀⢻⣧⠀⠀⠀⢿⣘⡿⣼⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⣿⡯⣷⣶⡄⠀⠀⠀⢺⣿⣿⣿⡇⠸⣿⠄⠀⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⡀⠀⠀⠀⠀⠀⠀⠉⠛⢓⣶⣤⣀⡄⠡⣯⡻⠿⠃⠀⠀⠀⠘⠟⠛⡏⠀⣸⠇⢀⣀⣤⣴⣛⡉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠸⡄⠀⠀⠄⠠⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣦⣘⠳⣤⡀⠀⠀⠀⠀⠀⢀⣡⣴⣏⣤⣾⣿⣿⣿⣿⣿⣶⣦⣤⣀⣀⣀⣀⣀⡀⠀⠄⠀${reset}"
echo -e "${red}⠀⠙⠳⠶⢶⣶⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣾⣯⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣛⣻⠛⠟⠛⠛⠉⠉⠉⠀⠃${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠉⠁⢀⣠⡿⢿⣿⢿⣿⠿⢛⣿⣿⣿⣿⣿⡟⠋⠁⠀⣟⣿⣿⣿⣿⣿⡿⠿⢿⣿⣿⣛⠛⠛⠉⠛⠙⠋⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⡴⠞⠉⡴⠋⢡⡿⠋⠀⣨⡿⣫⣿⣿⢹⠇⠀⠀⠀⢹⡸⣿⣿⣿⡛⢿⣦⠀⠈⠉⠛⠻⢤⡀⠀⠈⠑⠢⠄⠤⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⣴⢏⡄⠀⣸⠟⠈⣽⣿⡏⣼⠀⠀⠀⠀⢸⡇⢻⡀⠹⣟⠮⢿⣆⠀⠀⠀⠀⠀⠉⠓⠄⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠋⠀⣰⠋⠀⠾⢻⡟⡷⣿⠀⠀⣀⠀⢸⡗⣹⡧⠀⠹⢆⠀⠘⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⣺⡇⢹⣿⡷⣤⣀⣠⢿⣿⡟⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢹⠀⢻⣧⣸⡏⠀⣺⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠞⠀⠀⣿⢷⡇⣠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "${red}⠀⠄⠠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
echo -e "$reset"
echo ""

# ========== VOLTAR ==========
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

clear

# ========== SUBMENU ANT SCANNER ==========
echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│${silver}                   ANT SCANNER                       ${white}│${reset}"
echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${white}│  ${silver}𓅃  EM BREVE                                      ${white}│${reset}"
echo -e "${white}│  ${red}[0] VOLTAR AO MENU                               ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
echo ""

# PROMPT SCANNER COM INPUT EM CINZA
echo -e -n "${white}NOCRY${silver} | ${red}SCANNER${reset}\n${red}└──╼ ${silver}"
read scanner

if [ "$scanner" = "0" ]; then
    voltar_menu
else
    echo ""
    echo -e "$red [✘] Opção inválida!$reset"
    echo ""
    voltar_menu
fi

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
