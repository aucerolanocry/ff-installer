#!/data/data/com.termux/files/usr/bin/bash

# ===== VERIFICAÇÃO DE ARMAZENAMENTO INTELIGENTE =====
clear
STORAGE="$HOME/storage/shared"

if [ -d "$STORAGE" ]; then
    # Permissão já concedida
    echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
    echo -e "\033[1;37m│\033[1;37m           ⛥  ARMAZENAMENTO JÁ CONFIGURADO             \033[1;37m│\033[0m"
    echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
    echo -e "\033[1;37m│  \033[1;37m⛥  Permissão já concedida                           \033[1;37m│\033[0m"
    echo -e "\033[1;37m│  \033[1;37m⛥  Continuando...                                   \033[1;37m│\033[0m"
    echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
    sleep 1.5
else
    # Tela de configuração original
    clear
    echo -e "\033[1;37m┌─────────────────────────────────────────────────────────┐\033[0m"
    echo -e "\033[1;37m│\033[1;37m              CONFIGURANDO ARMAZENAMENTO               \033[1;37m│\033[0m"
    echo -e "\033[1;37m├─────────────────────────────────────────────────────────┤\033[0m"
    echo -e "\033[1;37m│  \033[1;37m⛥  VERIFICANDO PERMISSÕES...                        \033[1;37m│\033[0m"
    echo -e "\033[1;37m│  \033[0;37m˙⋆✮  SOLICITANDO ACESSO AOS ARQUIVOS...              \033[0;37m│\033[0m"
    echo -e "\033[1;37m│  \033[1;31m⛥  AGUARDE...                                        \033[1;31m│\033[0m"
    echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
    echo ""
    
    # Solicitar permissão
    termux-setup-storage > /dev/null 2>&1
    sleep 2
    
    # Mostrar aviso
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
    echo -e "\033[1;37m│  \033[1;31m⛥  Continuando em 2 segundos...                      \033[1;37m│\033[0m"
    echo -e "\033[1;37m└─────────────────────────────────────────────────────────┘\033[0m"
    sleep 2
fi
clear

# Cores (apenas BRANCO, CINZA e VERMELHO)
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

# ===== FUNÇÃO DE PAREAMENTO ADB (adaptada do KellerSS) =====
conectar_adb() {
    clear
    
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${white}               CONECTAR ADB VIA WI-FI                   ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    echo -e "${white}│                                                         │${reset}"
    echo -e "${white}│  ${silver}Verificando se o ADB está instalado...               ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
    
    # Verificar se android-tools está instalado
    if ! command -v adb &> /dev/null; then
        echo -e "${silver}[•] ADB não encontrado. Instalando android-tools...${reset}"
        pkg install android-tools -y > /dev/null 2>&1
        echo -e "${white}[⛥] Android-tools instalado com sucesso!${reset}"
    else
        echo -e "${white}[⛥] ADB já está instalado.${reset}"
    fi
    
    echo ""
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${red}              ⚠︎  INSTRUÇÕES NECESSÁRIAS  ⚠︎              ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    echo -e "${white}│  ${silver}No seu celular, ative:                              ${white}│${reset}"
    echo -e "${white}│  ${white}  1. Opções do Desenvolvedor                         ${white}│${reset}"
    echo -e "${white}│  ${white}  2. Depuração USB                                   ${white}│${reset}"
    echo -e "${white}│  ${white}  3. Depuração por Wi-Fi                             ${white}│${reset}"
    echo -e "${white}│  ${white}  4. Toque em 'Pair device with pairing code'        ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
    
    # Solicitar porta de pareamento
    echo -e -n "${white}📌  PORTA DE PAREAMENTO (ex: 37123): ${reset}"
    read pairing_port
    
    if [ -z "$pairing_port" ] || ! [[ "$pairing_port" =~ ^[0-9]+$ ]]; then
        echo ""
        echo -e "$red [☠︎] Porta inválida! Retornando ao menu.$reset"
        sleep 2
        return
    fi
    
    echo ""
    echo -e "${white}[•] Executando: adb pair localhost:$pairing_port${reset}"
    echo -e "${silver}   Digite o código de pareamento quando solicitado${reset}"
    echo ""
    
    # Executar adb pair
    adb pair localhost:$pairing_port
    
    if [ $? -ne 0 ]; then
        echo ""
        echo -e "$red [☠︎] Erro no pareamento. Verifique as informações.$reset"
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    echo ""
    echo -e "${white}[⛥] Pareamento realizado com sucesso!${reset}"
    echo ""
    
    # Solicitar porta de conexão
    echo -e -n "${white}📌  PORTA DE CONEXÃO (ex: 43709): ${reset}"
    read connect_port
    
    if [ -z "$connect_port" ] || ! [[ "$connect_port" =~ ^[0-9]+$ ]]; then
        echo ""
        echo -e "$red [☠︎] Porta inválida! Retornando ao menu.$reset"
        sleep 2
        return
    fi
    
    echo ""
    echo -e "${white}[•] Executando: adb connect localhost:$connect_port${reset}"
    adb connect localhost:$connect_port
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${white}[⛥] Conectado ao dispositivo com sucesso!${reset}"
    else
        echo ""
        echo -e "$red [☠︎] Erro na conexão.$reset"
    fi
    
    echo ""
    echo -e -n "${silver}Pressione ENTER para voltar ao menu${reset}"
    read
}

# ===== FUNÇÃO PARA SINCRONIZAR DADOS COM ADB =====
sincronizar_dados() {
    local tipo=$1
    local origem=""
    local destino="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"
    local nome_arquivo=""
    local temp_file="$HOME/adb_check.txt"
    
    clear
    
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${silver}               SINCRONIZANDO DADOS                    ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    
    if [ "$tipo" = "normal" ]; then
        origem="/storage/emulated/0/Android/obb/com.dts.freefireth/"
        nome_arquivo="main.2019116013.com.dts.freefireth.obb"
        echo -e "${white}│  ${silver}📱  FF NORMAL                                      ${white}│${reset}"
    else
        origem="/storage/emulated/0/Android/obb/com.dts.freefiremax/"
        nome_arquivo="main.2019116013.com.dts.freefiremax.obb"
        echo -e "${white}│  ${silver}📱  FF MAX                                         ${white}│${reset}"
    fi
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
    
    # Verificar se já está conectado via ADB
    adb_devices=$(adb devices | grep -v "List" | grep "device" | wc -l)
    
    if [ "$adb_devices" -eq 0 ]; then
        echo -e "$red [☠︎] Nenhum dispositivo conectado via ADB!$reset"
        echo -e "$silver    Use a opção 'Conectar ADB' primeiro.$reset"
        echo ""
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    # Verificar se a pasta de origem existe via ADB
    echo -e "${silver}[•] Verificando pasta: $origem${reset}"
    adb shell "if [ -d \"$origem\" ]; then echo 'EXISTE'; else echo 'NAO_EXISTE'; fi" > "$temp_file" 2>&1
    
    if [ -f "$temp_file" ]; then
        pasta_existe=$(grep "EXISTE" "$temp_file" | wc -l)
        rm -f "$temp_file"
    else
        pasta_existe=0
    fi
    
    if [ "$pasta_existe" -eq 0 ]; then
        echo -e "$red [☠︎] Erro: Pasta do jogo não encontrada!$reset"
        echo -e "$red     $origem$reset"
        echo -e "$silver     ⚠︎  Isso significa que o jogo não está instalado.$reset"
        echo ""
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    # Verificar se o arquivo de destino existe
    echo -e "${silver}[•] Verificando arquivo de destino...${reset}"
    adb shell "if [ -f \"${destino}${nome_arquivo}\" ]; then echo 'EXISTE'; else echo 'NAO_EXISTE'; fi" > "$temp_file" 2>&1
    
    if [ -f "$temp_file" ]; then
        arquivo_existe=$(grep "EXISTE" "$temp_file" | wc -l)
        rm -f "$temp_file"
    else
        arquivo_existe=0
    fi
    
    if [ "$arquivo_existe" -eq 0 ]; then
        echo -e "$red [☠︎] Erro: Arquivo OBB não encontrado!$reset"
        echo -e "$red     ${destino}${nome_arquivo}$reset"
        echo -e "$silver     ⚠︎  Baixe o OBB primeiro usando a opção 1.$reset"
        echo ""
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    # Pegar data da PASTA via ADB
    echo -e "${silver}[•] Obtendo data da pasta...${reset}"
    data_origem=$(adb shell "stat -c %Y \"$origem\" 2>/dev/null || echo '0'")
    
    if [ "$data_origem" != "0" ] && [ -n "$data_origem" ]; then
        data_formatada=$(adb shell "date -d @$data_origem '+%d/%m/%Y %H:%M:%S' 2>/dev/null")
        echo -e "${silver}[•] Data da PASTA: $data_formatada${reset}"
        
        # Pegar data atual do arquivo
        data_arquivo_antes=$(adb shell "stat -c %Y \"${destino}${nome_arquivo}\" 2>/dev/null || echo '0'")
        data_arquivo_antes_formatada=$(adb shell "date -d @$data_arquivo_antes '+%d/%m/%Y %H:%M:%S' 2>/dev/null")
        echo -e "${silver}[•] Data atual do arquivo: $data_arquivo_antes_formatada${reset}"
        
        # Aplicar mesma data ao arquivo
        echo -e "${silver}[•] Sincronizando datas...${reset}"
        adb shell "touch -d @$data_origem \"${destino}${nome_arquivo}\" 2>/dev/null"
        
        if [ $? -eq 0 ]; then
            echo -e "${white}[⛥] Data sincronizada com sucesso!${reset}"
            
            # Verificar nova data
            data_destino=$(adb shell "stat -c %Y \"${destino}${nome_arquivo}\" 2>/dev/null || echo '0'")
            data_destino_formatada=$(adb shell "date -d @$data_destino '+%d/%m/%Y %H:%M:%S' 2>/dev/null")
            
            echo -e "${white}    📁 PASTA: $data_formatada${reset}"
            echo -e "${white}    📄 ARQUIVO: $data_destino_formatada${reset}"
        else
            echo -e "$red [☠︎] Erro ao sincronizar data${reset}"
        fi
    else
        echo -e "$red [☠︎] Erro ao obter data da pasta${reset}"
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

# ========== FUNÇÃO PARA MOSTRAR TELA PRINCIPAL ==========
mostrar_tela_principal() {
    clear
    # ========== TÍTULO PRINCIPAL ==========
echo -e "${white}╔═══════════════════════════════════════════════════════════════════════════════════════════════════╗${reset}"
echo -e "${white}║                                                                                                   ║${reset}"
echo -e "${white}║   ${white}███╗  ███╗ ██████╗ ███╗  ██╗ ██╗   ██╗      ${red}███╗  ██╗  ██████╗   ██████╗  ██████╗  ██╗   ██╗    ${white}║${reset}"
echo -e "${white}║   ${white}████╗████║ ██╔═══╝ ████╗ ██║ ██║   ██║      ${red}████╗ ██║ ██╔═══██╗ ██╔════╝  ██╔══██╗ ╚██╗ ██╔╝    ${white}║${reset}"
echo -e "${white}║   ${white}██╔██╗███║ █████╗  ██╔██╗██║ ██║   ██║      ${red}██╔██╗██║ ██║   ██║ ██║       ██████╔╝  ╚████╔╝     ${white}║${reset}"
echo -e "${white}║   ${white}██║╚████║ ██╔══╝  ██║╚████║ ██║   ██║      ${red}██║╚████║ ██║   ██║ ██║       ██╔══██╗   ╚██╔╝       ${white}║${reset}"
echo -e "${white}║   ${white}██║ ╚███║ ██████╗ ██║ ╚███║ ╚██████╔╝      ${red}██║ ╚███║ ╚██████╔╝ ╚██████╗  ██║  ██║    ██║        ${white}║${reset}"
echo -e "${white}║   ${white}╚═╝  ╚══╝ ╚═════╝ ╚═╝  ╚══╝  ╚═════╝       ${red}╚═╝  ╚══╝  ╚═════╝   ╚═════╝  ╚═╝  ╚═╝     ╚═╝        ${white}║${reset}"
echo -e "${white}║                                                                                                   ║${reset}"
echo -e "${white}╚═══════════════════════════════════════════════════════════════════════════════════════════════════╝${reset}"═════════════════════════════════════════════════════════════════════════════════════╝${reset}"
    echo ""

    # CRÉDITOS
    echo -e "${white}│  ${red}𓆩♱𓆪${white} SISTEMA DE BYPASS ${red}˙⋆✮${silver} // ${silver} 𓅃 DEVELOPED BY AUCEROLA NOCRY 𓅃 ${silver} // ${red}EQP NOCRY${red} ${red}𓆩♱𓆪${white}  │${reset}"
    echo ""
    sleep 0.5

    # DESENHO DO HACKER PRINCIPAL
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

    # MENU PRINCIPAL
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${white}                     MENU PRINCIPAL                    ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    echo -e "${white}│  ${white}[1] INSTALAR OBBS                               ${white}│${reset}"
    echo -e "${white}│  ${silver}[2] ANT SCANNER                                 ${white}│${reset}"
    echo -e "${white}│  ${silver}[3] SINCRONIZAR DADOS                           ${white}│${reset}"
    echo -e "${white}│  ${silver}[4] CONECTAR ADB                                ${white}│${reset}"
    echo -e "${white}│  ${red}[5] SAIR                                          ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
    echo -e -n "${white}NOCRY${silver} | ${red}TERMUX${reset}\n${white}└──╼ ${silver}"
}

# ========== INÍCIO DO SCRIPT ==========
mostrar_tela_principal

# ========== LOOP PRINCIPAL ==========
while true; do
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
        sleep 0.5

        # ========== SUBMENU INSTALAR OBBS ==========
        while true; do
            echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
            echo -e "${white}│${silver}                   INSTALAR OBBS                      ${white}│${reset}"
            echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
            echo -e "${white}│  ${white}[1] FREE FIRE NORMAL                              ${white}│${reset}"
            echo -e "${white}│  ${silver}[2] FREE FIRE MAX                                ${white}│${reset}"
            echo -e "${white}│  ${red}[3] SAIR                                           ${white}│${reset}"
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
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⣺⡇⢹⣿⡷⣤⣀⣠⢿⣿⡟⠀⠀⠀⠈⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⢹⠀⢻⣧⣸⡏⠀⣺⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠞⠀⠀⣿⢷⡇⣠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠿⠿⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${red}⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "${red}⠀    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${reset}"
                echo -e "$reset"
                echo ""
                
                echo ""
                echo -e "${white}[•] Download concluído! Pressione ENTER para voltar${reset}"
                read
                break

            elif [ "$obb" = "3" ]; then
                echo ""
                echo -e "$red [☠︎] Saindo do sistema...$reset"
                echo ""
                exit

            elif [ "$obb" = "0" ]; then
                mostrar_tela_principal
                break
            else
                echo ""
                echo -e "$red [☠︎] Opção inválida! Digite 0, 1, 2 ou 3${reset}"
                sleep 2
            fi
        done

    elif [ "$menu" = "2" ]; then
        clear
        echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
        echo -e "${white}│${silver}                   ANT SCANNER                       ${white}│${reset}"
        echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
        echo -e "${white}│  ${silver} 𓅃  EM BREVE..                                      ${white}│${reset}"
        echo -e "${white}│  ${red}[3] SAIR                                           ${white}│${reset}"
        echo -e "${white}│  ${red}[0] VOLTAR                                        ${white}│${reset}"
        echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
        echo ""
        echo -e -n "${white}NOCRY${silver} | ${red}SCANNER${reset}\n${red}└──╼ ${silver}"
        read scanner
        
        if [ "$scanner" = "0" ]; then
            mostrar_tela_principal
        elif [ "$scanner" = "3" ]; then
            echo ""
            echo -e "$red [☠︎] Saindo do sistema...$reset"
            echo ""
            exit
        else
            echo ""
            echo -e "$red [☠︎] Opção inválida! Pressione ENTER para voltar${reset}"
            read
            mostrar_tela_principal
        fi

    elif [ "$menu" = "3" ]; then
        while true; do
            clear
            echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
            echo -e "${white}│${silver}                 SINCRONIZAR DADOS                   ${white}│${reset}"
            echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
            echo -e "${white}│  ${white}[1] SINCRONIZAR DADOS FF NORMAL                  ${white}│${reset}"
            echo -e "${white}│  ${silver}[2] SINCRONIZAR DADOS FF MAX                    ${white}│${reset}"
            echo -e "${white}│  ${red}[3] SAIR                                           ${white}│${reset}"
            echo -e "${white}│  ${red}[0] VOLTAR                                        ${white}│${reset}"
            echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
            echo ""
            echo -e -n "${white}NOCRY${silver} | ${red}SYNC${reset}\n${red}└──╼ ${silver}"
            read sync_opcao
            
            case $sync_opcao in
                1)
                    sincronizar_dados "normal"
                    ;;
                2)
                    sincronizar_dados "max"
                    ;;
                3)
                    echo ""
                    echo -e "$red [☠︎] Saindo do sistema...$reset"
                    echo ""
                    exit
                    ;;
                0)
                    mostrar_tela_principal
                    break
                    ;;
                *)
                    echo ""
                    echo -e "$red [☠︎] Opção inválida! Digite 0, 1, 2 ou 3${reset}"
                    sleep 2
                    ;;
            esac
        done

    elif [ "$menu" = "4" ]; then
        conectar_adb
        mostrar_tela_principal

    elif [ "$menu" = "5" ]; then
        echo ""
        echo -e "$red [☠︎] Saindo do sistema...$reset"
        echo ""
        exit

    else
        echo ""
        echo -e "$red [☠︎] Opção inválida! Digite 1, 2, 3, 4 ou 5${reset}"
        sleep 2
        mostrar_tela_principal
    fi
done
