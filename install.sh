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

# ===== BARRA DE PROGRESSO VERMELHA PISCANTE (mesma dos downloads) =====
progress_bar() {
    local current=$1
    local total=$2
    local percent=$((current * 100 / total))
    local filled=$((percent / 2))
    local empty=$((50 - filled))
    
    if ((current % 2 == 0)); then
        color="\033[1;31m"
    else
        color="\033[0;31m"
    fi
    
    printf "\r${color}["
    printf "%0.s█" $(seq 1 $filled)
    printf "%0.s░" $(seq 1 $empty)
    printf "] %3d%%${reset}" "$percent"
}

# ===== FUNÇÃO PARA SINCRONIZAR DADOS COM ADB INTEGRADO =====
sincronizar_dados() {
    local tipo=$1
    local origem=""
    local destino="/storage/emulated/0/MIUI/sound_recorder/fm_rec/"
    local nome_arquivo=""
    local temp_file="$HOME/adb_check.txt"
    local device_connected=""
    
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
    
    # ===== VERIFICAÇÃO/CONEXÃO ADB INTEGRADA =====
    echo -e "${silver}[•] Verificando conexão ADB...${reset}"
    
    # Instalar android-tools se necessário
    if ! command -v adb &> /dev/null; then
        echo -e "${silver}[•] Instalando android-tools...${reset}"
        pkg install android-tools -y > /dev/null 2>&1
        echo -e "${white}[⛥] Android-tools instalado!${reset}"
    fi
    
    # Verificar dispositivos conectados
    adb_devices=$(adb devices | grep -v "List" | grep "device" | wc -l)
    
    if [ "$adb_devices" -eq 0 ]; then
        # Nenhum dispositivo conectado - pedir IP:porta direto
        echo -e "$red [☠︎] Nenhum dispositivo conectado!$reset"
        echo ""
        echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
        echo -e "${white}│${red}              ⚠︎  CONEXÃO ADB NECESSÁRIA  ⚠︎              ${white}│${reset}"
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
            echo -e "$red [☠︎] Porta inválida!$reset"
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
            echo -e "$red [☠︎] Erro no pareamento.$reset"
            echo -e -n "${silver}Pressione ENTER para voltar${reset}"
            read
            return
        fi
        
        echo -e "${white}[⛥] Pareamento realizado!${reset}"
        echo ""
        
        # Solicitar porta de conexão
        echo -e -n "${white}📌  PORTA DE CONEXÃO (ex: 43709): ${reset}"
        read connect_port
        
        if [ -z "$connect_port" ] || ! [[ "$connect_port" =~ ^[0-9]+$ ]]; then
            echo ""
            echo -e "$red [☠︎] Porta inválida!$reset"
            sleep 2
            return
        fi
        
        echo ""
        echo -e "${white}[•] Executando: adb connect localhost:$connect_port${reset}"
        adb connect localhost:$connect_port
        
        if [ $? -ne 0 ]; then
            echo ""
            echo -e "$red [☠︎] Erro na conexão.$reset"
            echo -e -n "${silver}Pressione ENTER para voltar${reset}"
            read
            return
        fi
        
        echo -e "${white}[⛥] Conectado com sucesso!${reset}"
        device_connected="localhost:$connect_port"
        
    elif [ "$adb_devices" -gt 1 ]; then
        # Múltiplos dispositivos - mostrar lista
        echo -e "$red [☠︎] Múltiplos dispositivos conectados!$reset"
        echo ""
        adb devices
        echo ""
        echo -e -n "${white}📌  DIGITE O IP:PORTA DO DISPOSITIVO DESEJADO: ${reset}"
        read device_connected
        
        if [ -z "$device_connected" ]; then
            echo -e "$red [☠︎] Nenhum dispositivo selecionado.$reset"
            sleep 2
            return
        fi
        
    else
        # Um dispositivo já conectado
        device_connected=$(adb devices | grep -v "List" | grep "device" | awk '{print $1}')
        echo -e "${white}[⛥] Dispositivo detectado: $device_connected${reset}"
        echo ""
        echo -e -n "${white}❓  Usar este dispositivo? (s/N): ${reset}"
        read usar_atual
        
        if [[ "$usar_atual" != "s" && "$usar_atual" != "S" ]]; then
            echo ""
            echo -e -n "${white}📌  DIGITE OUTRO IP:PORTA (ex: 192.168.1.100:5555): ${reset}"
            read device_connected
            
            if [ -n "$device_connected" ]; then
                echo -e "${silver}[•] Conectando a $device_connected...${reset}"
                adb connect "$device_connected"
                
                if [ $? -ne 0 ]; then
                    echo -e "$red [☠︎] Erro na conexão.$reset"
                    echo ""
                    echo -e -n "${silver}Pressione ENTER para voltar${reset}"
                    read
                    return
                fi
            fi
        fi
    fi
    
    echo ""
    echo -e "${white}[⛥] Usando dispositivo: $device_connected${reset}"
    sleep 1
    
    # ===== VERIFICAÇÕES =====
    # Verificar se a pasta de origem existe
    echo -e "${silver}[•] Verificando pasta do jogo: $origem${reset}"
    adb -s "$device_connected" shell "if [ -d \"$origem\" ]; then echo 'EXISTE'; else echo 'NAO_EXISTE'; fi" > "$temp_file" 2>&1
    
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
    echo -e "${silver}[•] Verificando arquivo OBB escondido...${reset}"
    adb -s "$device_connected" shell "if [ -f \"${destino}${nome_arquivo}\" ]; then echo 'EXISTE'; else echo 'NAO_EXISTE'; fi" > "$temp_file" 2>&1
    
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
    
    # ===== SINCRONIZAÇÃO PRINCIPAL =====
    echo ""
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${silver}            INICIANDO SINCRONIZAÇÃO COMPLETA           ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    echo ""
    
    # 1. Pegar data da PASTA PRINCIPAL do jogo
    echo -e "${silver}[1/6] Obtendo data da pasta principal...${reset}"
    
    # Barra de progresso piscante para obtenção da data
    for i in {1..20}; do
        progress_bar $i 20
        sleep 0.05
    done
    echo ""
    
    data_origem=$(adb -s "$device_connected" shell "stat -c %Y \"$origem\" 2>/dev/null || echo '0'")
    
    if [ "$data_origem" = "0" ] || [ -z "$data_origem" ]; then
        echo -e "$red [☠︎] Erro ao obter data da pasta principal.$reset"
        echo ""
        echo -e -n "${silver}Pressione ENTER para voltar${reset}"
        read
        return
    fi
    
    data_formatada=$(adb -s "$device_connected" shell "date -d @$data_origem '+%d/%m/%Y %H:%M:%S' 2>/dev/null")
    echo -e "${white}    📁 PASTA PRINCIPAL: $data_formatada${reset}"
    
    # 2. Aplicar data ao arquivo OBB escondido
    echo -e "${silver}[2/6] Sincronizando arquivo OBB escondido...${reset}"
    
    # Barra de progresso piscante para OBB
    for i in {1..20}; do
        progress_bar $i 20
        sleep 0.05
    done
    echo ""
    
    adb -s "$device_connected" shell "touch -d @$data_origem \"${destino}${nome_arquivo}\" 2>/dev/null"
    
    if [ $? -eq 0 ]; then
        echo -e "${white}    ✓ OBB sincronizado${reset}"
    else
        echo -e "$red    ✗ Erro no OBB${reset}"
    fi
    
    # 3. Sincronizar TODAS as subpastas (incluindo MReplays)
    echo -e "${silver}[3/6] Sincronizando todas as subpastas...${reset}"
    
    adb -s "$device_connected" shell "find \"$origem\" -type d 2>/dev/null | tail -n +2" > "$temp_file" 2>&1
    
    if [ -f "$temp_file" ] && [ -s "$temp_file" ]; then
        subpastas=$(cat "$temp_file" | wc -l)
        
        # Barra de progresso piscante para pastas
        current=0
        while IFS= read -r subpasta; do
            if [ -n "$subpasta" ]; then
                adb -s "$device_connected" shell "touch -d @$data_origem \"$subpasta\" 2>/dev/null"
                current=$((current + 1))
                progress_bar $current $subpastas
            fi
        done < "$temp_file"
        echo ""
        
        echo -e "${white}    ✓ $subpastas subpastas sincronizadas${reset}"
        rm -f "$temp_file"
    else
        echo -e "${silver}    → Nenhuma subpasta encontrada${reset}"
    fi
    
    # 4. Sincronizar arquivos em gameassetbundles
    echo -e "${silver}[4/6] Sincronizando arquivos em gameassetbundles...${reset}"
    
    gameasset_path="${origem}files/contentcache/Optional/android/gameassetbundles/"
    adb -s "$device_connected" shell "if [ -d \"$gameasset_path\" ]; then find \"$gameasset_path\" -type f 2>/dev/null; fi" > "$temp_file" 2>&1
    
    if [ -f "$temp_file" ] && [ -s "$temp_file" ]; then
        arquivos_game=$(cat "$temp_file" | wc -l)
        
        # Barra de progresso piscante para gameassetbundles
        current=0
        while IFS= read -r arquivo; do
            if [ -n "$arquivo" ]; then
                adb -s "$device_connected" shell "touch -d @$data_origem \"$arquivo\" 2>/dev/null"
                current=$((current + 1))
                progress_bar $current $arquivos_game
            fi
        done < "$temp_file"
        echo ""
        
        echo -e "${white}    ✓ $arquivos_game arquivos em gameassetbundles sincronizados${reset}"
        rm -f "$temp_file"
    else
        echo -e "${silver}    → Nenhum arquivo em gameassetbundles encontrado${reset}"
    fi
    
    # 5. Sincronizar arquivos em optionalavatarres
    echo -e "${silver}[5/6] Sincronizando arquivos em optionalavatarres...${reset}"
    
    avatar_path="${origem}files/contentcache/Optional/android/optionalavatarres/"
    adb -s "$device_connected" shell "if [ -d \"$avatar_path\" ]; then find \"$avatar_path\" -type f 2>/dev/null; fi" > "$temp_file" 2>&1
    
    if [ -f "$temp_file" ] && [ -s "$temp_file" ]; then
        arquivos_avatar=$(cat "$temp_file" | wc -l)
        
        # Barra de progresso piscante para optionalavatarres
        current=0
        while IFS= read -r arquivo; do
            if [ -n "$arquivo" ]; then
                adb -s "$device_connected" shell "touch -d @$data_origem \"$arquivo\" 2>/dev/null"
                current=$((current + 1))
                progress_bar $current $arquivos_avatar
            fi
        done < "$temp_file"
        echo ""
        
        echo -e "${white}    ✓ $arquivos_avatar arquivos em optionalavatarres sincronizados${reset}"
        rm -f "$temp_file"
    else
        echo -e "${silver}    → Nenhum arquivo em optionalavatarres encontrado${reset}"
    fi
    
    # 6. Sincronizar arquivos em MReplays
    echo -e "${silver}[6/6] Sincronizando arquivos em MReplays...${reset}"
    
    if [ "$tipo" = "normal" ]; then
        mreplays_path="/sdcard/Android/data/com.dts.freefireth/files/MReplays/"
    else
        mreplays_path="/sdcard/Android/data/com.dts.freefiremax/files/MReplays/"
    fi
    
    adb -s "$device_connected" shell "if [ -d \"$mreplays_path\" ]; then find \"$mreplays_path\" -type f 2>/dev/null; fi" > "$temp_file" 2>&1
    
    if [ -f "$temp_file" ] && [ -s "$temp_file" ]; then
        arquivos_mreplays=$(cat "$temp_file" | wc -l)
        
        # Barra de progresso piscante para MReplays
        current=0
        while IFS= read -r arquivo; do
            if [ -n "$arquivo" ]; then
                adb -s "$device_connected" shell "touch -d @$data_origem \"$arquivo\" 2>/dev/null"
                current=$((current + 1))
                progress_bar $current $arquivos_mreplays
            fi
        done < "$temp_file"
        echo ""
        
        echo -e "${white}    ✓ $arquivos_mreplays arquivos em MReplays sincronizados${reset}"
        rm -f "$temp_file"
    else
        echo -e "${silver}    → Nenhum arquivo em MReplays encontrado${reset}"
    fi
    
    # ===== RESUMO FINAL =====
    echo ""
    echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│${white}              SINCRONIZAÇÃO CONCLUÍDA!                ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
    echo -e "${white}│  ${silver}📁  Data base: $data_formatada               ${white}│${reset}"
    echo -e "${white}│  ${silver}📦  OBB escondido sincronizado                    ${white}│${reset}"
    echo -e "${white}│  ${silver}📂  Todas as pastas sincronizadas                 ${white}│${reset}"
    echo -e "${white}│  ${silver}📄  Arquivos gameassetbundles sincronizados        ${white}│${reset}"
    echo -e "${white}│  ${silver}📄  Arquivos optionalavatarres sincronizados       ${white}│${reset}"
    echo -e "${white}│  ${silver}📄  Arquivos MReplays sincronizados                ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
    
    echo ""
    echo -e -n "${silver}Pressione ENTER para voltar${reset}"
    read
}

# ===== BARRA DE PROGRESSO PARA DOWNLOAD (original) =====
progress_bar_download() {
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
    # TÍTULO PRINCIPAL
    echo -e "${white}╔═══════════════════════════════════════════════════════════════════════════════════════════════════╗${reset}"
    echo -e "${white}║                                                                                                   ║${reset}"
    echo -e "${white}║   ${white}███╗  ███╗ ██████╗ ███╗  ██╗ ██╗   ██╗      ${red}███╗  ██╗  ██████╗   ██████╗  ██████╗  ██╗   ██╗    ${white}║${reset}"
    echo -e "${white}║   ${white}████╗████║ ██╔═══╝ ████╗ ██║ ██║   ██║      ${red}████╗ ██║ ██╔═══██╗ ██╔════╝  ██╔══██╗ ╚██╗ ██╔╝    ${white}║${reset}"
    echo -e "${white}║   ${white}██╔██╗███║ █████╗  ██╔██╗██║ ██║   ██║      ${red}██╔██╗██║ ██║   ██║ ██║       ██████╔╝  ╚████╔╝     ${white}║${reset}"
    echo -e "${white}║   ${white}██║╚████║ ██╔══╝  ██║╚████║ ██║   ██║      ${red}██║╚████║ ██║   ██║ ██║       ██╔══██╗   ╚██╔╝       ${white}║${reset}"
    echo -e "${white}║   ${white}██║ ╚███║ ██████╗ ██║ ╚███║ ╚██████╔╝      ${red}██║ ╚███║ ╚██████╔╝ ╚██████╗  ██║  ██║    ██║        ${white}║${reset}"
    echo -e "${white}║   ${white}╚═╝  ╚══╝ ╚═════╝ ╚═╝  ╚══╝  ╚═════╝       ${red}╚═╝  ╚══╝  ╚═════╝   ╚═════╝  ╚═╝  ╚═╝     ╚═╝        ${white}║${reset}"
    echo -e "${white}║                                                                                                   ║${reset}"
    echo -e "${white}╚═══════════════════════════════════════════════════════════════════════════════════════════════════╝${reset}"
    echo ""

    # CRÉDITOS ESTILO DEVELOPER
    echo -e "${white}┌─────────────────────────────────────────────────────────────────────┐${reset}"
    echo -e "${white}│  ${red}☠︎${white}  SYSTEM BYPASS v2.0  ${red}☠︎    𓅃  DEVELOPER ${red}AUCEROLA NOCRY${white}  𓅃  #NOCRY  ${white}│${reset}"
    echo -e "${white}├─────────────────────────────────────────────────────────────────────┤${reset}"
    echo -e "${white}│              ${silver}ANDROID • TERMUX • SECURITY • BYPASS                   ${white}│${reset}"
    echo -e "${white}└─────────────────────────────────────────────────────────────────────┘${reset}"
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
    echo -e "${white}│  ${red}[0] SAIR                                          ${white}│${reset}"
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
            echo -e "${white}│  ${red}[3] VOLTAR                                        ${white}│${reset}"
            echo -e "${white}│  ${red}[0] SAIR                                           ${white}│${reset}"
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
                progress_bar_download
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
                progress_bar_download
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
                mostrar_tela_principal
                break

            elif [ "$obb" = "0" ]; then
                echo ""
                echo -e "$red [☠︎] Saindo do sistema...$reset"
                echo ""
                exit

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
        echo -e "${white}│  ${red}[1] VOLTAR                                        ${white}│${reset}"
        echo -e "${white}│  ${red}[0] SAIR                                           ${white}│${reset}"
        echo -e "${white}└─────────────────────────────────────────────────────┘${reset}"
        echo ""
        echo -e -n "${white}NOCRY${silver} | ${red}SCANNER${reset}\n${red}└──╼ ${silver}"
        read scanner
        
        if [ "$scanner" = "1" ]; then
            mostrar_tela_principal
        elif [ "$scanner" = "0" ]; then
            echo ""
            echo -e "$red [☠︎] Saindo do sistema...$reset"
            echo ""
            exit
        else
            echo ""
            echo -e "$red [☠︎] Opção inválida! Digite 0 ou 1${reset}"
            sleep 2
        fi

    elif [ "$menu" = "3" ]; then
        while true; do
            clear
            echo -e "${white}┌─────────────────────────────────────────────────────┐${reset}"
            echo -e "${white}│${silver}                 SINCRONIZAR DADOS                   ${white}│${reset}"
            echo -e "${white}├─────────────────────────────────────────────────────┤${reset}"
            echo -e "${white}│  ${white}[1] SINCRONIZAR DADOS FF NORMAL                  ${white}│${reset}"
            echo -e "${white}│  ${silver}[2] SINCRONIZAR DADOS FF MAX                    ${white}│${reset}"
            echo -e "${white}│  ${red}[3] VOLTAR                                        ${white}│${reset}"
            echo -e "${white}│  ${red}[0] SAIR                                           ${white}│${reset}"
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
                    mostrar_tela_principal
                    break
                    ;;
                0)
                    echo ""
                    echo -e "$red [☠︎] Saindo do sistema...$reset"
                    echo ""
                    exit
                    ;;
                *)
                    echo ""
                    echo -e "$red [☠︎] Opção inválida! Digite 0, 1, 2 ou 3${reset}"
                    sleep 2
                    ;;
            esac
        done

    elif [ "$menu" = "0" ]; then
        echo ""
        echo -e "$red [☠︎] Saindo do sistema...$reset"
        echo ""
        exit

    else
        echo ""
        echo -e "$red [☠︎] Opção inválida! Digite 0, 1, 2 ou 3${reset}"
        sleep 2
        mostrar_tela_principal
    fi
done