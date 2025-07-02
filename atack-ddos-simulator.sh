#!/system/bin/sh

# Funções de cores
print_color() {
    echo -e "\033[1;${1}m${2}\033[0m"
}

clear_screen() {
    echo -e "\033c"
}

# Função do menu principal
show_menu() {
    clear_screen
    print_color 35 "========================================"
    print_color 37 "|              Atack DDoS Menu           |"
    print_color 35 "========================================"
    print_color 36 " [1] Start DDoS Attack                 "
    print_color 36 " [2] Credits                           "
    print_color 36 " [3] Exit                              "
    print_color 35 "========================================"
    print_color 90 "Digite a opção desejada (1-3):"
    read option
}

# Função de créditos
show_credits() {
    clear_screen
    print_color 32 "==========================================="
    print_color 32 "|                  Creditos                        |"
    print_color 32 "==========================================="
    print_color 33 "Script desenvolvido por DentinhoJs"
    print_color 33 "Ataque DDoS para fins educacionais."
    print_color 33 "Este script é puramente visual e seguro para uso."
    print_color 32 "==========================================="
    print_color 36 "Pressione qualquer tecla para voltar ao menu."
    read -n 1 -s
}

# Função para simular ataque DDoS
simulate_ddos_attack() {
    clear_screen
    print_color 30 "========================================="
    print_color 30 "|              DDoS Attack               |"
    print_color 30 "========================================="
    print_color 31 "Digite o alvo do Ataque (exemplo: www.exemplo.com):"
    
    read website
    clear_screen
    
    # Exibe o alvo
    print_color 34 "Alvo identificado: $website"
    sleep 1
    print_color 31 "Iniciando ataque DDoS..."
    sleep 2

    attack_start_time=$(date +%s)
    for i in $(seq 1 30); do
        ip="192.168.$((RANDOM % 255)).$((RANDOM % 255))"
        status_code=$((200 + RANDOM % 50))
        latency=$((20 + RANDOM % 480))
        packets=$((1000 + RANDOM % 9000))
        error_chance=$((RANDOM % 10))

        if [ "$error_chance" -gt 7 ]; then
            print_color 31 "[ERRO] Timeout de conexão do IP: $ip | Tentando novamente..."
            sleep 0.5
            print_color 33 "[RECONEXÃO] Estabelecendo nova conexão com $website..."
            sleep 1
        else
            print_color 37 "[Requisição $i] | IP: $ip | Código HTTP: $status_code | Latência: ${latency}ms | Pacotes: $packets"
            sleep 0.3
        fi

        if [ $((i % 5)) -eq 0 ]; then
            print_color 33 "Carga no servidor aumentando... ($i requisições enviadas)"
            sleep 1
        fi

        if [ $((i % 10)) -eq 0 ]; then
            print_color 34 "[INFO] Servidor temporariamente sem resposta. Rechecando conexão..."
            sleep 1
        fi
    done

    attack_end_time=$(date +%s)
    attack_duration=$((attack_end_time - attack_start_time))

    print_color 32 "========================================"
    print_color 32 "  Ataque DDoS Finalizado com Sucesso!  "
    print_color 32 "========================================"
    print_color 35 "Duração do ataque: ${attack_duration}s"
    print_color 36 "Pressione qualquer tecla para sair."
    read -n 1 -s

    # Apaga as variáveis usadas para garantir segurança
    unset website ip status_code latency packets error_chance attack_start_time attack_end_time attack_duration
}

# Loop principal
while true; do
    show_menu
    case "$option" in
        1)
            simulate_ddos_attack
            ;;
        2)
            show_credits
            ;;
        3)
            clear_screen
            print_color 32 "Saindo... Até logo!"
            break
            ;;
        *)
            print_color 31 "Opção inválida. Tente novamente."
            sleep 1
            ;;
    esac
done

# DentinhoJs
