#!/bin/bash
# Script : minecraft_menu.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)
# Style : Minecraft Adventure

# Couleurs ANSI - Palette Minecraft
RED='\033[0;31m'          # Redstone
GREEN='\033[0;32m'        # Emerald
YELLOW='\033[1;33m'       # Gold
BLUE='\033[0;34m'         # Lapis
MAGENTA='\033[0;35m'      # Purple
CYAN='\033[0;36m'         # Diamond
WHITE='\033[1;37m'        # Quartz
BROWN='\033[0;33m'        # Wood
GRAY='\033[0;37m'         # Stone
DARK_GREEN='\033[2;32m'   # Moss
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m' # No Color

# Fonction pour jouer un "son" Minecraft
play_sound() {
    case $1 in
        "click") echo -e "${YELLOW}*click*${NC}" ;;
        "ding") echo -e "${GREEN}*ding!*${NC}" ;;
        "error") echo -e "${RED}*buzz*${NC}" ;;
        "break") echo -e "${GRAY}*crack*${NC}" ;;
    esac
}

# Fonction pour afficher le titre Minecraft
afficher_titre() {
    clear
    echo -e "${GREEN}${BOLD}"
    echo "    ███    ███ ██ ███    ██ ███████  ██████ ██████   █████  ███████ ████████"
    echo "    ████  ████ ██ ████   ██ ██      ██      ██   ██ ██   ██ ██         ██   "
    echo "    ██ ████ ██ ██ ██ ██  ██ █████   ██      ██████  ███████ █████      ██   "
    echo "    ██  ██  ██ ██ ██  ██ ██ ██      ██      ██   ██ ██   ██ ██         ██   "
    echo "    ██      ██ ██ ██   ████ ███████  ██████ ██   ██ ██   ██ ██         ██   "
    echo -e "${NC}"
    echo ""
    echo -e "${BROWN}    ████████████████████████████████████████████████████████${NC}"
    echo -e "${BROWN}    █${GREEN}🌿${BROWN}█${BLUE}🌊${BROWN}█${YELLOW}🌾${BROWN}█${RED}🔥${BROWN}█${GRAY}⛰️${BROWN}█${GREEN}🌿${BROWN}█${BLUE}🌊${BROWN}█${YELLOW}🌾${BROWN}█${RED}🔥${BROWN}█${GRAY}⛰️${BROWN}█${GREEN}🌿${BROWN}█${BLUE}🌊${BROWN}█${YELLOW}🌾${BROWN}█${RED}🔥${BROWN}█${GRAY}⛰️${BROWN}█${GREEN}🌿${BROWN}█${BLUE}🌊${BROWN}█${YELLOW}🌾${BROWN}█${RED}🔥${BROWN}█${GRAY}⛰️${BROWN}█${NC}"
    echo -e "${BROWN}    ████████████████████████████████████████████████████████${NC}"
    echo ""
    echo -e "${CYAN}                        ⛏️  Serveur de Commandes  ⛏️${NC}"
    echo ""
}

# Fonction pour afficher le menu avec style Minecraft
afficher_menu() {
    afficher_titre
    echo -e "${BROWN}${BOLD}    ╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BROWN}${BOLD}    ║${YELLOW}                   TABLE DE CRAFT                   ${BROWN}║${NC}"
    echo -e "${BROWN}${BOLD}    ╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${BROWN}    ║                                                      ║${NC}"
    echo -e "${BROWN}    ║  ${CYAN}[1]${BROWN} ► ${GREEN}🕐 Horloge Temporelle${BROWN}                           ║${NC}"
    echo -e "${BROWN}    ║        ${GRAY}Consulter l'heure du serveur${BROWN}                    ║${NC}"
    echo -e "${BROWN}    ║                                                      ║${NC}"
    echo -e "${BROWN}    ║  ${CYAN}[2]${BROWN} ► ${YELLOW}📦 Inventaire de Stockage${BROWN}                      ║${NC}"
    echo -e "${BROWN}    ║        ${GRAY}Vérifier l'espace disponible${BROWN}                    ║${NC}"
    echo -e "${BROWN}    ║                                                      ║${NC}"
    echo -e "${BROWN}    ║  ${CYAN}[3]${BROWN} ► ${GREEN}👤 Joueurs Connectés${BROWN}                           ║${NC}"
    echo -e "${BROWN}    ║        ${GRAY}Voir qui est en ligne${BROWN}                           ║${NC}"
    echo -e "${BROWN}    ║                                                      ║${NC}"
    echo -e "${BROWN}    ║  ${CYAN}[4]${BROWN} ► ${RED}⚙️  Processus Système${BROWN}                           ║${NC}"
    echo -e "${BROWN}    ║        ${GRAY}Monitor des tâches actives${BROWN}                      ║${NC}"
    echo -e "${BROWN}    ║                                                      ║${NC}"
    echo -e "${BROWN}    ║  ${RED}[5]${BROWN} ► ${RED}${BLINK}🚪 Quitter le Serveur${NC}${BROWN}                         ║${NC}"
    echo -e "${BROWN}    ║        ${GRAY}Déconnexion sécurisée${BROWN}                           ║${NC}"
    echo -e "${BROWN}    ║                                                      ║${NC}"
    echo -e "${BROWN}${BOLD}    ╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}    ⛏️  Votre inventaire : ${YELLOW}[Pioche de Commandes]${NC}"
    echo ""
}

# Animation de minage
animation_minage() {
    echo -e "${YELLOW}${BOLD}    ⛏️  Extraction des données en cours...${NC}"
    echo ""
    for i in {1..3}; do
        echo -ne "${GRAY}    ▓"
        sleep 0.2
        echo -ne "▓"
        sleep 0.2
        echo -ne "▓"
        sleep 0.2
        echo -e " 💎${NC}"
        sleep 0.1
    done
    play_sound "ding"
    echo -e "${GREEN}${BOLD}    ✅ Données extraites avec succès !${NC}"
    echo ""
}

# Animation de craft
animation_craft() {
    echo -e "${BROWN}    ╔═══╦═══╦═══╗${NC}"
    echo -e "${BROWN}    ║ ${YELLOW}⚙️${BROWN} ║ ${CYAN}💎${BROWN} ║ ${YELLOW}⚙️${BROWN} ║${NC}"
    echo -e "${BROWN}    ╠═══╬═══╬═══╣${NC}"
    echo -e "${BROWN}    ║ ${CYAN}💎${BROWN} ║ ${RED}🔥${BROWN} ║ ${CYAN}💎${BROWN} ║${NC}  →  ${GREEN}✨ Commande Craftée !${NC}"
    echo -e "${BROWN}    ╠═══╬═══╬═══╣${NC}"
    echo -e "${BROWN}    ║ ${YELLOW}⚙️${BROWN} ║ ${CYAN}💎${BROWN} ║ ${YELLOW}⚙️${BROWN} ║${NC}"
    echo -e "${BROWN}    ╚═══╩═══╩═══╝${NC}"
    echo ""
}

# Fonction pour afficher la date et l'heure
afficher_date_heure() {
    animation_craft
    animation_minage
    echo -e "${CYAN}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}    ║              🕐 HORLOGE TEMPORELLE             ║${NC}"
    echo -e "${CYAN}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}    🌅 Heure du serveur : ${GREEN}$(date '+%H:%M:%S')${NC}"
    echo -e "${WHITE}    📅 Date actuelle    : ${GREEN}$(date '+%d/%m/%Y')${NC}"
    echo -e "${WHITE}    🌍 Fuseau horaire   : ${GREEN}$(date '+%Z')${NC}"
    echo -e "${YELLOW}    ⏰ Temps Unix       : ${GREEN}$(date +%s)${NC}"
    echo ""
    # Simulation de l'heure Minecraft (plus rapide)
    MC_TIME=$(( ($(date +%s) * 72) % 24000 ))
    if [ $MC_TIME -lt 6000 ]; then
        echo -e "${YELLOW}    🌅 Temps Minecraft  : ${GREEN}Jour (Tick: $MC_TIME)${NC}"
    elif [ $MC_TIME -lt 18000 ]; then
        echo -e "${YELLOW}    ☀️  Temps Minecraft  : ${GREEN}Midi (Tick: $MC_TIME)${NC}"
    else
        echo -e "${YELLOW}    🌙 Temps Minecraft  : ${GREEN}Nuit (Tick: $MC_TIME)${NC}"
    fi
}

# Fonction pour afficher l'espace disque
afficher_espace_disque() {
    animation_craft
    animation_minage
    echo -e "${YELLOW}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}${BOLD}    ║            📦 INVENTAIRE DE STOCKAGE           ║${NC}"
    echo -e "${YELLOW}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}    État des coffres de stockage :${NC}"
    echo ""

    df -h | while read filesystem size used avail use mountpoint; do
        if [[ "$filesystem" == "Filesystem" ]]; then
            echo -e "${BROWN}    📁 $filesystem    $size    $used    $avail    $use    $mountpoint${NC}"
        elif [[ "$use" != "" ]]; then
            # Déterminer la couleur selon l'utilisation
            usage_num=$(echo $use | sed 's/%//')
            if [ "$usage_num" -gt 80 ]; then
                color="${RED}"
                icon="🔴"
            elif [ "$usage_num" -gt 60 ]; then
                color="${YELLOW}"
                icon="🟡"
            else
                color="${GREEN}"
                icon="🟢"
            fi
            echo -e "${WHITE}    $icon $(printf '%-15s' "$filesystem") $(printf '%8s' "$size") $(printf '%8s' "$used") $(printf '%8s' "$avail") ${color}$(printf '%6s' "$use")${WHITE} $mountpoint${NC}"
        fi
    done
}

# Fonction pour afficher les utilisateurs connectés
afficher_utilisateurs_connectes() {
    animation_craft
    animation_minage
    echo -e "${GREEN}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}    ║              👤 JOUEURS CONNECTÉS              ║${NC}"
    echo -e "${GREEN}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""

    player_count=$(who | wc -l)
    echo -e "${WHITE}    🎮 Joueurs en ligne : ${GREEN}$player_count${NC}"
    echo ""

    if [ $player_count -eq 0 ]; then
        echo -e "${GRAY}    😴 Aucun joueur connecté${NC}"
        echo -e "${GRAY}    🏠 Le serveur est vide...${NC}"
    else
        echo -e "${WHITE}    Liste des joueurs :${NC}"
        echo ""
        who | while read line; do
            username=$(echo $line | awk '{print $1}')
            terminal=$(echo $line | awk '{print $2}')
            time=$(echo $line | awk '{print $3" "$4}')

            # Simuler un niveau aléatoire
            level=$((RANDOM % 50 + 1))

            echo -e "${GREEN}    🧑‍💻 ${CYAN}$username${WHITE} - Terminal: ${YELLOW}$terminal${WHITE} - Connecté: ${GRAY}$time${WHITE} - Niveau: ${GREEN}$level${NC}"
        done
    fi
}

# Fonction pour afficher les processus en cours
afficher_processus_en_cours() {
    animation_craft
    animation_minage
    echo -e "${RED}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}    ║              ⚙️  PROCESSUS SYSTÈME             ║${NC}"
    echo -e "${RED}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}    🔧 Tâches actives sur le serveur :${NC}"
    echo ""

    # Afficher l'en-tête
    echo -e "${BROWN}    $(printf '%-12s' 'UTILISATEUR') $(printf '%-8s' 'PID') $(printf '%-6s' 'CPU%') $(printf '%-6s' 'MEM%') $(printf '%-20s' 'COMMANDE')${NC}"
    echo -e "${GRAY}    ────────────────────────────────────────────────────────${NC}"

    # Afficher les processus avec des icônes
    ps aux | head -15 | tail -n +2 | while read line; do
        user=$(echo $line | awk '{print $1}')
        pid=$(echo $line | awk '{print $2}')
        cpu=$(echo $line | awk '{print $3}')
        mem=$(echo $line | awk '{print $4}')
        command=$(echo $line | awk '{for(i=11;i<=NF;i++) printf "%s ", $i; print ""}' | cut -c1-20)

        # Choisir une icône selon le type de processus
        if [[ $command == *"bash"* ]] || [[ $command == *"sh"* ]]; then
            icon="💻"
        elif [[ $command == *"python"* ]]; then
            icon="🐍"
        elif [[ $command == *"java"* ]]; then
            icon="☕"
        elif [[ $command == *"nginx"* ]] || [[ $command == *"apache"* ]]; then
            icon="🌐"
        elif [[ $command == *"mysql"* ]] || [[ $command == *"postgres"* ]]; then
            icon="🗄️"
        else
            icon="⚙️"
        fi

        echo -e "${WHITE}    $icon $(printf '%-10s' "$user") $(printf '%-8s' "$pid") ${GREEN}$(printf '%5s' "$cpu")%${WHITE} ${YELLOW}$(printf '%5s' "$mem")%${WHITE} ${GRAY}$command${NC}"
    done
    echo ""
    echo -e "${CYAN}    📊 (Affichage des 15 premiers processus)${NC}"
}

# Animation de déconnexion
animation_deconnexion() {
    clear
    echo -e "${RED}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}    ║               🚪 DÉCONNEXION                   ║${NC}"
    echo -e "${RED}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${YELLOW}    📝 Sauvegarde du monde en cours...${NC}"

    for i in {1..3}; do
        echo -ne "${GREEN}    ▓▓▓"
        sleep 0.3
        echo -ne "▓▓▓"
        sleep 0.3
        echo -e "▓▓▓${NC}"
        sleep 0.2
    done

    echo ""
    echo -e "${GREEN}    ✅ Sauvegarde terminée !${NC}"
    echo -e "${YELLOW}    🔒 Fermeture sécurisée du serveur...${NC}"
    sleep 1

    echo ""
    echo -e "${CYAN}${BOLD}    Merci d'avoir joué sur notre serveur Minecraft !${NC}"
    echo -e "${GREEN}    🎮 À bientôt pour de nouvelles aventures !${NC}"
    echo ""
    echo -e "${BROWN}    ████████████████████████████████████████${NC}"
    echo -e "${BROWN}    █${GREEN}🌿${BROWN}█${BLUE}🌊${BROWN}█${YELLOW}🌾${BROWN}█${RED}🔥${BROWN}█${GRAY}⛰️${BROWN}█ ${WHITE}Au revoir !${BROWN} █${GRAY}⛰️${BROWN}█${RED}🔥${BROWN}█${YELLOW}🌾${BROWN}█${BLUE}🌊${BROWN}█${GREEN}🌿${BROWN}█${NC}"
    echo -e "${BROWN}    ████████████████████████████████████████${NC}"
    echo ""
}

# Fonction pour pause stylisée
pause_stylisee() {
    echo ""
    echo -e "${BROWN}${BOLD}    ╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BROWN}${BOLD}    ║  ${YELLOW}Appuyez sur ${GREEN}[ENTRÉE]${YELLOW} pour retourner au menu principal  ${BROWN}║${NC}"
    echo -e "${BROWN}${BOLD}    ╚══════════════════════════════════════════════════════╝${NC}"
    read
}

# Boucle principale du menu
while true; do
    afficher_menu
    echo -e "${WHITE}${BOLD}    Choisissez votre action ${GREEN}[1-5]${WHITE} : ${NC}"
    echo -ne "${CYAN}    ⛏️  → ${NC}"
    read choix

    case $choix in
        1)
            play_sound "click"
            clear
            afficher_date_heure
            pause_stylisee
            ;;
        2)
            play_sound "click"
            clear
            afficher_espace_disque
            pause_stylisee
            ;;
        3)
            play_sound "click"
            clear
            afficher_utilisateurs_connectes
            pause_stylisee
            ;;
        4)
            play_sound "click"
            clear
            afficher_processus_en_cours
            pause_stylisee
            ;;
        5)
            play_sound "break"
            animation_deconnexion
            exit 0
            ;;
        *)
            play_sound "error"
            clear
            echo -e "${RED}${BOLD}${BLINK}    ⚠️  ERREUR : COMMANDE INVALIDE  ⚠️${NC}"
            echo -e "${YELLOW}    🎯 Utilisez les chiffres de 1 à 5 uniquement${NC}"
            echo -e "${GRAY}    💡 Astuce : Vérifiez votre saisie !${NC}"
            echo ""
            pause_stylisee
            ;;
    esac
done