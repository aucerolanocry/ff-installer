#!/data/data/com.termux/files/usr/bin/bash

# ===== CONFIGURAÇÃO INICIAL =====
clear
echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;37m│\033[1;37m              CONFIGURANDO ARMAZENAMENTO               \033[1;37m│\033[0m"
echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
echo -e "\033[1;37m│  \033[1;37m⚝  VERIFICANDO PERMISSÕES...                        \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[0;37m˙⋆✮  SOLICITANDO ACESSO AOS ARQUIVOS...              \033[0;37m│\033[0m"
echo -e "\033[1;37m│  \033[1;31m⚝  AGUARDE...                                        \033[1;31m│\033[0m"
echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
echo ""

# Solicitar permissão
termux-setup-storage > /dev/null 2>&1
sleep 2

# Verificar permissão
if [ ! -d "/storage/emulated/0" ]; then
    clear
    echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
    echo -e "\033[1;37m│\033[1;31m                     ⚠︎  ERRO  ⚠︎                        \033[1;37m│\033[0m"
    echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
    echo -e "\033[1;37m│                                                         │\033[0m"
    echo -e "\033[1;37m│  \033[1;31m𓏵  PERMISSÃO NEGADA!                                \033[1;37m│\033[0m"
    echo -e "\033[1;37m│                                                         │\033[0m"
    echo -e "\033[1;37m│  \033[0;37mPara usar este script, você precisa permitir       \033[1;37m│\033[0m"
    echo -e "\033[1;37m│  \033[0;37mo acesso do Termux aos arquivos do dispositivo.    \033[1;37m│\033[0m"
    echo -e "\033[1;37m│                                                         │\033[0m"
    echo -e "\033[1;37m│  \033[1;37m📱  Quando a janela de permissão aparecer:          \033[1;37m│\033[0m"
    echo -e "\033[1;37m│  \033[1;37m    1. Clique em PERMITIR                           \033[1;37m│\033[0m"
    echo -e "\033[1;37m│  \033[1;37m    2. Aguarde a confirmação                        \033[1;37m│\033[0m"
    echo -e "\033[1;37m│                                                         │\033[0m"
    echo -e "\033[1;37m│  \033[1;31m⚝  Execute o script novamente após permitir!        \033[1;37m│\033[0m"
    echo -e "\033[1;37m│                                                         │\033[0m"
    echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
    echo ""
    echo -e -n "\033[1;37m[•] Pressione ENTER para sair\033[0m"
    read
    exit 1
fi

# Sucesso
clear
echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;37m│\033[1;37m                   ˙⋆✮  SUCESSO  ˙⋆✮                      \033[1;37m│\033[0m"
echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
echo -e "\033[1;37m│  \033[1;37m⛥  Permissão concedida!                              \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[1;37m⛥  Armazenamento configurado                        \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[1;37m⛥  Pronto para continuar                            \033[1;37m│\033[0m"
echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
sleep 2
clear

# Cores (apenas branco, cinza e vermelho)
white='\033[1;37m'    # BRANCO
silver='\033[0;37m'   # CINZA
red='\033[1;31m'      # VERMELHO
reset='\033[0m'

# FUNÇÃO PARA VOLTAR AO MENU
voltar_menu() {
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

# ========== TÍTULO PRINCIPAL ==========
echo -e "${white}┌─────────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│  ${white}███╗   ███╗███████╗███╗   ██╗██╗   ██╗    ${red}██████╗  ██████╗  ██████╗██████╗ ██╗   ██╗  ${white}│${reset}"
echo -e "${white}│  ${white}████╗ ████║██╔════╝████╗  ██║██║   ██║    ${red}██╔══██╗██╔═══██╗██╔════╝██╔══██╗╚██╗ ██╔╝  ${white}│${reset}"
echo -e "${white}│  ${white}██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ${red}██████╔╝██║   ██║██║     ██████╔╝ ╚████╔╝   ${white}│${reset}"
echo -e "${white}│  ${white}██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ${red}██╔══██╗██║   ██║██║     ██╔══██╗  ╚██╔╝    ${white}│${reset}"
echo -e "${white}│  ${white}██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ${red}██║  ██║╚██████╔╝╚██████╗██║  ██║   ██║     ${white}│${reset}"
echo -e "${white}│  ${white}╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝     ${red}╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝     ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────────┘${reset}"

sleep 1

# ========== CRÉDITOS ==========
echo -e "${white}│  ${red}𓆩♱𓆪${white} SISTEMA DE BYPASS ${red}˙⋆✮${silver} // ${silver} 𓅃 DEVELOPED BY AUCEROLA NOCRY 𓅃 ${silver} // ${red}EQP NOCRY${red} ${red}𓆩♱𓆪${white}  │${reset}"
echo ""

sleep 2

# ========== DESENHO DO HACKER PRINCIPAL ==========
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

# PROMPT PRINCIPAL
echo -e -n "${white}NOCRY${silver} | ${red}TERMUX${reset}\n${white}└──╼ ${silver}"
read menu

if [ "$menu" = "1" ]; then

clear

# ========== DESENHO DE CIMA ==========
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

echo -e -n "${white}NOCRY${silver} | ${red}OBBS${reset}\n${red}└──╼ ${silver}"
read obb

if [ "$obb" = "1" ]; then

echo ""
echo -e "$red [↓] Baixando OBB do FF NORMAL...$reset"
echo ""

pkg install curl -y > /dev/null 2>&1

OBB_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v1/main.2019116013.com.dts.freefireth.obb"
ARQUIVO="main.2019116013.com.dts.freefireth.obb"
DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"

curl -L -s -o "$ARQUIVO" "$OBB_URL" &
pid=$!

progress_bar
wait $pid

printf "\r\033[1;31m[██████████████████████████████████████████████████] 100%%\033[0m\n"

echo ""
echo -e "$silver [⛥] Download concluído!$reset"
echo ""

mv "$ARQUIVO" "$DESTINO" 2>/dev/null

# ========== DESENHO DE BAIXO ==========
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

echo ""
echo -e "${white}[⛥] Download concluído! Pressione ENTER para voltar ao menu principal${reset}"
read
voltar_menu

elif [ "$obb" = "2" ]; then

echo ""
echo -e "$silver [↓] Baixando OBB do FF MAX...$reset"
echo ""

pkg install curl -y > /dev/null 2>&1

OBB_MAX_URL="https://github.com/aucerolanocry/ff-installer/releases/download/v2/main.2019116013.com.dts.freefiremax.obb"
ARQUIVO="main.2019116013.com.dts.freefiremax.obb"
DESTINO="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"

curl -L -s -o "$ARQUIVO" "$OBB_MAX_URL" &
pid=$!

progress_bar
wait $pid

printf "\r\033[1;31m[██████████████████████████████████████████████████] 100%%\033[0m\n"

echo ""
echo -e "$silver [⛥] Download concluído!$reset"
echo ""

mv "$ARQUIVO" "$DESTINO" 2>/dev/null

# ========== DESENHO DE BAIXO ==========
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

echo ""
echo -e "${white}[•] Download concluído! Pressione ENTER para voltar ao menu principal${reset}"
read
voltar_menu

elif [ "$obb" = "0" ]; then

voltar_menu

else

echo ""
echo -e "$red [𓏵] Opção inválida! Pressione ENTER para voltar${reset}"
read
voltar_menu

fi

elif [ "$menu" = "2" ]; then

clear

echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${white}│${silver}                   ANT SCANNER                       ${white}│${reset}"
echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${white}│  ${silver} 𓅃  EM BREVE..                                      ${white}│${reset}"
echo -e "${white}│  ${red}[0] VOLTAR AO MENU                               ${white}│${reset}"
echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
echo ""

echo -e -n "${white}NOCRY${silver} | ${red}SCANNER${reset}\n${red}└──╼ ${silver}"
read scanner

if [ "$scanner" = "0" ]; then
    voltar_menu
else
    echo ""
    echo -e "$red [𓏵] Opção inválida! Pressione ENTER para voltar${reset}"
    read
    voltar_menu
fi

elif [ "$menu" = "3" ]; then

echo ""
echo -e "$red [𓏵] Saindo do sistema...$reset"
echo ""
exit

else

echo ""
echo -e "$red [𓏵] Opção inválida! Pressione ENTER para voltar${reset}"
read
voltar_menu

fi
