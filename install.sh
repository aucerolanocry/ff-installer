#!/data/data/com.termux/files/usr/bin/bash

# ===== CONFIGURAÇÃO INICIAL SIMPLIFICADA =====
clear
echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;37m│\033[1;37m              CONFIGURANDO ARMAZENAMENTO               \033[1;37m│\033[0m"
echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
echo -e "\033[1;37m│  \033[1;37m⚝  SOLICITANDO PERMISSÃO...                          \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[0;37m˙⋆✮  AGUARDE...                                      \033[0;37m│\033[0m"
echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
echo ""

# Solicitar permissão
termux-setup-storage > /dev/null 2>&1
sleep 2

# Mostrar aviso (sem verificar)
clear
echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
echo -e "\033[1;37m│\033[1;31m                     ⚠︎  AVISO  ⚠︎                        \033[1;37m│\033[0m"
echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
echo -e "\033[1;37m│                                                         │\033[0m"
echo -e "\033[1;37m│  \033[1;37m⚠︎  Permissão de armazenamento necessária!            \033[1;37m│\033[0m"
echo -e "\033[1;37m│                                                         │\033[0m"
echo -e "\033[1;37m│  \033[0;37mSem essa permissão, algumas funções como:            \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[0;37m  • Download de OBBs                                 \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[0;37m  • Sincronização de dados                          \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[0;37m  • Acesso aos arquivos                             \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[0;37m  NÃO funcionarão corretamente.                     \033[1;37m│\033[0m"
echo -e "\033[1;37m│                                                         │\033[0m"
echo -e "\033[1;37m│  \033[1;37m📱  Se deseja usar todas as funções:                  \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[1;37m    1. Quando a janela aparecer, clique PERMITIR     \033[1;37m│\033[0m"
echo -e "\033[1;37m│  \033[1;37m    2. Reinicie o script                             \033[1;37m│\033[0m"
echo -e "\033[1;37m│                                                         │\033[0m"
echo -e "\033[1;37m│  \033[1;31m⚝  Continuando em 2 segundos...                      \033[1;37m│\033[0m"
echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
sleep 2
clear

# Cores
white='\033[1;37m'
silver='\033[0;37m'
red='\033[1;31m'
reset='\033[0m'

# FUNÇÃO PARA VOLTAR AO MENU
voltar_menu() {
    clear
    exec "$0"
    exit
}

# ===== FUNÇÃO PARA SINCRONIZAR DADOS =====
sincronizar_dados() {
    local tipo=$1
    local origem=""
    local destino="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"
    local nome_arquivo=""
    
    clear
    
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${silver}               SINCRONIZANDO DADOS                    ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    
    if [ "$tipo" = "normal" ]; then
        origem="/storage/emulated/0/Android/obb/com.dts.freefireth/"
        nome_arquivo="main.2019116013.com.dts.freefireth.obb"
        echo -e "${white}│  ${silver}📱  FF NORMAL                                      ${white}│${reset}"
    elif [ "$tipo" = "max" ]; then
        origem="/storage/emulated/0/Android/obb/com.dts.freefiremax/"
        nome_arquivo="main.2019116013.com.dts.freefiremax.obb"
        echo -e "${white}│  ${silver}📱  FF MAX                                         ${white}│${reset}"
    fi
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
    
    # Verificar se a pasta de origem existe
    if [ ! -d "$origem" ]; then
        echo -e "$red [☠︎] Erro: Pasta não encontrada: $origem$reset"
        echo ""
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    # Verificar se o arquivo de destino existe
    if [ ! -f "${destino}${nome_arquivo}" ]; then
        echo -e "$red [☠︎] Erro: Arquivo não encontrado: ${destino}${nome_arquivo}$reset"
        echo ""
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    echo -e "${silver}[•] Verificando data da pasta de origem...${reset}"
    
    # Pegar data da pasta (última modificação)
    if [ -d "$origem" ]; then
        data_origem=$(stat -c %Y "$origem" 2>/dev/null || stat -f %m "$origem" 2>/dev/null)
        
        if [ -n "$data_origem" ]; then
            data_formatada=$(date -d @$data_origem '+%d/%m/%Y %H:%M:%S' 2>/dev/null || date -r $data_origem '+%d/%m/%Y %H:%M:%S' 2>/dev/null)
            echo -e "${silver}[•] Data da origem: $data_formatada${reset}"
            
            # Aplicar mesma data ao arquivo de destino
            touch -d @$data_origem "${destino}${nome_arquivo}" 2>/dev/null || touch -t $(date -d @$data_origem +%Y%m%d%H%M.%S) "${destino}${nome_arquivo}" 2>/dev/null
            
            if [ $? -eq 0 ]; then
                echo -e "${white}[⛥] Data sincronizada com sucesso!${reset}"
                data_destino=$(stat -c %Y "${destino}${nome_arquivo}" 2>/dev/null || stat -f %m "${destino}${nome_arquivo}" 2>/dev/null)
                data_destino_formatada=$(date -d @$data_destino '+%d/%m/%Y %H:%M:%S' 2>/dev/null || date -r $data_destino '+%d/%m/%Y %H:%M:%S' 2>/dev/null)
                echo -e "${white}    Nova data: $data_destino_formatada${reset}"
            else
                echo -e "$red [☠︎] Erro ao sincronizar data${reset}"
            fi
        else
            echo -e "$red [☠︎] Erro ao obter data da pasta${reset}"
        fi
    fi
    
    echo ""
    echo -e -n "${silver}Pressione ENTER para voltar${reset}"
    read
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
        
        if ((progress % 2 == 0)); then
            color="\033[1;31m"
        else
            color="\033[0;31m"
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
while true; do
    clear
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${white}                     MENU PRINCIPAL                    ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    echo -e "${white}│  ${white}[1] INSTALAR OBBS                               ${white}│${reset}"
    echo -e "${white}│  ${silver}[2] ANT SCANNER                                 ${white}│${reset}"
    echo -e "${white}│  ${silver}[3] SINCRONIZAR DADOS                           ${white}│${reset}"
    echo -e "${white}│  ${red}[4] SAIR                                          ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
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
        while true; do
            clear
            echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
            echo -e "${white}│${silver}                   INSTALAR OBBS                      ${white}│${reset}"
            echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
            echo -e "${white}│  ${white}[1] FREE FIRE NORMAL                              ${white}│${reset}"
            echo -e "${white}│  ${silver}[2] FREE FIRE MAX                                ${white}│${reset}"
            echo -e "${white}│  ${red}[0] VOLTAR                                        ${white}│${reset}"
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
                echo -e "${white}   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${white} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${white}   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣶⣶⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⢿⣿⣷⣦⣤⣄⣈⣉⣹⣷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⣀⣤⣴⣶⣚⠋⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀${reset}"
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
                echo -e "${red}⠀   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "$reset"
                echo ""

                echo ""
                echo -e "${white}[⛥] Download concluído! Pressione ENTER para voltar${reset}"
                read
                break

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
                echo -e "${white}   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${white}  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${white}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣤⣶⣶⣶⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⢿⣿⣷⣦⣤⣄⣈⣉⣹⣷⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${silver}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠀⣀⣤⣴⣶⣚⠋⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀${reset}"
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
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⣺⡇⢹⣿⡷⣤⣀⣠⢿⣿⡟⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
