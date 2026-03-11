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

# FUNÇÃO PARA VOLTAR AO MENU (CORRIGIDA)
voltar_menu() {
    echo ""
    echo -e "${yellow}──────────────────────────────${reset}"
    read -p "$(echo -e "${green}[•] Pressione ENTER para voltar ao menu principal${reset}")"
    clear
    exec bash "$0"
    exit
}

# FUNÇÃO DA BARRA DE PROGRESSO COLORIDA PISCANTE
progress_bar() {
    local -a cores=($green $cyan $purple $red $yellow)
    local cor_index=0
    
    while read -r line; do
        if [[ $line =~ [0-9]+% ]]; then
            percent=${BASH_REMATCH[0]%\%}
            
            # Alterna as cores a cada atualização (efeito piscante)
            cor_index=$(( (cor_index + 1) % 5 ))
            color=${cores[$cor_index]}
            
            # Desenha a barra
            filled=$((percent/2))
            empty=$((50-filled))
            
            printf "\r${color}["
            printf "%0.s█" $(seq 1 $filled)
            printf "%0.s░" $(seq 1 $empty)
            printf "] %3d%%${reset}" "$percent"
        fi
    done
}

# TÍTULO PRINCIPAL + CRÉDITOS
echo -e "${green}┌─────────────────────────────────────────────────────────┐${reset}"
echo -e "${green}│  ${yellow}███╗   ███╗███████╗███╗   ██╗██╗   ██╗    ${cyan}██████╗  ██████╗  ██████╗██████╗ ██╗   ██╗  ${green}│${reset}"
echo -e "${green}│  ${yellow}████╗ ████║██╔════╝████╗  ██║██║   ██║    ${cyan}██╔══██╗██╔═══██╗██╔════╝██╔══██╗╚██╗ ██╔╝  ${green}│${reset}"
echo -e "${green}│  ${yellow}██╔████╔██║█████╗  ██╔██╗ ██║██║   ██║    ${cyan}██████╔╝██║   ██║██║     ██████╔╝ ╚████╔╝   ${green}│${reset}"
echo -e "${green}│  ${yellow}██║╚██╔╝██║██╔══╝  ██║╚██╗██║██║   ██║    ${cyan}██╔══██╗██║   ██║██║     ██╔══██╗  ╚██╔╝    ${green}│${reset}"
echo -e "${green}│  ${yellow}██║ ╚═╝ ██║███████╗██║ ╚████║╚██████╔╝    ${cyan}██║  ██║╚██████╔╝╚██████╗██║  ██║   ██║     ${green}│${reset}"
echo -e "${green}│  ${yellow}╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝     ${cyan}╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝   ╚═╝     ${green}│${reset}"
echo -e "${green}├─────────────────────────────────────────────────────────┤${reset}"
echo -e "${green}│  ${red}⚡${yellow} SISTEMA DE BYPASS ${red}⚡${cyan} // ${purple}DEVELOPED BY AUCEROLA NOCRY${cyan} // ${green}EQP NOCRY${red} ⚡${green}  │${reset}"
echo -e "${green}└─────────────────────────────────────────────────────────┘${reset}"
echo ""

# PAUSA DE 2 SEGUNDOS
sleep 2

# DESENHO DO HACKER COMPLETO
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
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣾⣿⣿⣷⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿
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

# MENU PRINCIPAL - TUDO COLORIDO
echo -e "${cyan}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${cyan}│${green}                     MENU PRINCIPAL                    ${cyan}│${reset}"
echo -e "${cyan}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${cyan}│  ${pink}[1] INSTALAR OBBS                                 ${cyan}│${reset}"
echo -e "${cyan}│  ${blue}[2] ANT SCANNER                                   ${cyan}│${reset}"
echo -e "${cyan}│  ${red}[3] SAIR                                          ${cyan}│${reset}"
echo -e "${cyan}└─────────────────────────────────────────────────────┘${reset}"
echo ""

read -p "$(echo -e "${green}┌─[${red}NOCRY${green}@${cyan}TERMUX${green}]${reset}\n${green}└──╼ ${yellow}$ ")" menu

if [ "$menu" = "1" ]; then

clear

echo -e "${cyan}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${cyan}│${pink}                   INSTALAR OBBS                      ${cyan}│${reset}"
echo -e "${cyan}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${cyan}│  ${pink}[1] FREE FIRE NORMAL                              ${cyan}│${reset}"
echo -e "${cyan}│  ${pink}[2] FREE FIRE MAX                                ${cyan}│${reset}"
echo -e "${cyan}│  ${yellow}[0] VOLTAR AO MENU                               ${cyan}│${reset}"
echo -e "${cyan}└─────────────────────────────────────────────────────┘${reset}"
echo ""

read -p "$(echo -e "${pink}┌─[NOCRY@OBBS]${reset}\n${pink}└──╼ $ ")" obb

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

# Download com barra de progresso COLORIDA PISCANTE
curl -L -o "$ARQUIVO" "$OBB_URL" --progress-bar 2>&1 | progress_bar

echo ""
echo ""
echo -e "$pink [✔] Download concluído!$reset"
echo ""

# Verificar se a pasta de destino existe
if [ -d "$DESTINO" ]; then
    echo -e "$yellow [➜] Movendo arquivo para: $DESTINO$reset"
    mv "$ARQUIVO" "$DESTINO"
    
    # Verificar se moveu corretamente
    if [ -f "${DESTINO}${ARQUIVO}" ]; then
        echo -e "$pink [✔] Arquivo movido com sucesso!$reset"
        echo -e "$yellow [✓] Local: ${DESTINO}${ARQUIVO}$reset"
    else
        echo -e "$red [✘] Erro ao mover arquivo!$reset"
    fi
else
    echo -e "$red [✘] Pasta de destino não encontrada: $DESTINO$reset"
    echo -e "$yellow [➜] Arquivo permanece em: $(pwd)/$ARQUIVO$reset"
fi

echo ""
voltar_menu

elif [ "$obb" = "2" ]; then

echo ""
echo -e "$yellow ⚠️  FREE FIRE MAX EM DESENVOLVIMENTO ⚠️$reset"
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
echo -e "${cyan}┌─────────────────────────────────────────────────────┐${reset}"
echo -e "${cyan}│${blue}                   ANT SCANNER                       ${cyan}│${reset}"
echo -e "${cyan}├─────────────────────────────────────────────────────┤${reset}"
echo -e "${cyan}│  ${yellow}[0] VOLTAR AO MENU                               ${cyan}│${reset}"
echo -e "${cyan}└─────────────────────────────────────────────────────┘${reset}"
echo ""

read -p "$(echo -e "${blue}┌─[NOCRY@SCANNER]${reset}\n${blue}└──╼ $ ")" scanner

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
