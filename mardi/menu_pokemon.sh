#!/bin/bash
# Script : pokemon_menu.sh
# Auteur : Jimmy RAMSAMYNAÏCK - Dresseur de Pokémon
# Date : $(date)
# Style : Pokémon Adventure

# Couleurs ANSI - Palette Pokémon
RED='\033[0;31m'          # Feu/Pokéball
GREEN='\033[0;32m'        # Plante
YELLOW='\033[1;33m'       # Électrik/Pikachu
BLUE='\033[0;34m'         # Eau
MAGENTA='\033[0;35m'      # Psy
CYAN='\033[0;36m'         # Glace
WHITE='\033[1;37m'        # Normal
BROWN='\033[0;33m'        # Sol
GRAY='\033[0;37m'         # Roche
DARK_GREEN='\033[2;32m'   # Poison
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m' # No Color

# Array des cris de Pokémon
declare -a pokemon_cries=("Pika pika!" "Char char!" "Bulba bulba!" "Squir squirtle!" "Meow meow!" "Psy psyduck!" "Jiggly jiggly!" "Eevee vee!")

# Fonction pour simuler un cri de Pokémon
pokemon_cry() {
    local cry=${pokemon_cries[$((RANDOM % ${#pokemon_cries[@]}))]}
    echo -e "${YELLOW}♪ $cry ♪${NC}"
}

# Fonction pour afficher le titre Pokémon
afficher_titre() {
    clear
    echo -e "${YELLOW}${BOLD}"
    echo "    ██████   ██████  ██   ██ ███████ ███    ███  ██████  ███    ██"
    echo "    ██   ██ ██    ██ ██  ██  ██      ████  ████ ██    ██ ████   ██"
    echo -e "${RED}    ██████  ██    ██ █████   █████   ██ ████ ██ ██    ██ ██ ██  ██${NC}"
    echo -e "${BLUE}    ██      ██    ██ ██  ██  ██      ██  ██  ██ ██    ██ ██  ██ ██${NC}"
    echo -e "${GREEN}    ██       ██████  ██   ██ ███████ ██      ██  ██████  ██   ████${NC}"
    echo ""
    echo -e "${RED}                    ⚪ ${WHITE}CENTER${RED} ⚪${NC}"
    echo ""
    echo -e "${WHITE}    ╔═══════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}    ║  ${RED}●${WHITE}     ${YELLOW}◉ POKÉDEX SYSTÈME ◉${WHITE}     ${BLUE}●${WHITE}      ║${NC}"
    echo -e "${WHITE}    ╚═══════════════════════════════════════════════════════╝${NC}"
    echo ""
    # Pokémon ASCII art
    echo -e "${YELLOW}           (\\   /)     ${RED}  ___      ${BLUE}   ~~~${NC}"
    echo -e "${YELLOW}          ( ^.^ )     ${RED} /   \\     ${BLUE}  (o o)${NC}"
    echo -e "${YELLOW}         O_(\")(\")     ${RED}(  o  )    ${BLUE}  \\_-_/${NC}"
    echo -e "${GRAY}          Pikachu      ${RED} Pokéball   ${BLUE} Psyduck${NC}"
    echo ""
}

# Fonction pour afficher le menu avec style Pokémon
afficher_menu() {
    afficher_titre
    local trainer_name="Dresseur $(whoami)"
    echo -e "${WHITE}${BOLD}    Bienvenue ${GREEN}$trainer_name${WHITE} !${NC}"
    echo ""
    echo -e "${RED}${BOLD}    ╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}    ║${YELLOW}                    POKÉDEX MENU                     ${RED}║${NC}"
    echo -e "${RED}${BOLD}    ╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${RED}    ║                                                      ║${NC}"
    echo -e "${RED}    ║  ${CYAN}[1]${RED} ► ${YELLOW}⏰ Horloge Pokémon${RED}                              ║${NC}"
    echo -e "${RED}    ║      ${GRAY}Consulter l'heure de votre aventure${RED}              ║${NC}"
    echo -e "${RED}    ║                                                      ║${NC}"
    echo -e "${RED}    ║  ${CYAN}[2]${RED} ► ${GREEN}💾 PC de Stockage${RED}                               ║${NC}"
    echo -e "${RED}    ║      ${GRAY}Vérifier l'espace dans vos boîtes${RED}                ║${NC}"
    echo -e "${RED}    ║                                                      ║${NC}"
    echo -e "${RED}    ║  ${CYAN}[3]${RED} ► ${BLUE}👥 Dresseurs Connectés${RED}                          ║${NC}"
    echo -e "${RED}    ║      ${GRAY}Voir qui est au Centre Pokémon${RED}                   ║${NC}"
    echo -e "${RED}    ║                                                      ║${NC}"
    echo -e "${RED}    ║  ${CYAN}[4]${RED} ► ${MAGENTA}⚡ Pokémon Actifs${RED}                               ║${NC}"
    echo -e "${RED}    ║      ${GRAY}Scanner les processus système${RED}                     ║${NC}"
    echo -e "${RED}    ║                                                      ║${NC}"
    echo -e "${RED}    ║  ${YELLOW}[5]${RED} ► ${RED}${BLINK}🚪 Quitter le Centre${NC}${RED}                          ║${NC}"
    echo -e "${RED}    ║      ${GRAY}Terminer votre visite${RED}                            ║${NC}"
    echo -e "${RED}    ║                                                      ║${NC}"
    echo -e "${RED}${BOLD}    ╚══════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${GREEN}    🎒 Objets : ${YELLOW}[Pokédex]${GREEN} [Potion]${GREEN} [Pokéball]${NC}"
    echo -e "${BLUE}    🏆 Badges : ${YELLOW}██${BLUE} ${GRAY}░░░░░░░${NC}"
    echo ""
}

# Animation de capture Pokémon
animation_capture() {
    echo -e "${RED}${BOLD}    🎯 Lancement de Pokéball...${NC}"
    echo ""
    for i in {1..3}; do
        echo -ne "${RED}    ● "
        sleep 0.3
        echo -ne "○ "
        sleep 0.3
        echo -ne "● "
        sleep 0.3
        echo -e "${GREEN}✨${NC}"
        sleep 0.2
    done
    pokemon_cry
    echo -e "${GREEN}${BOLD}    🎉 Données capturées avec succès !${NC}"
    echo ""
}

# Animation d'évolution
animation_evolution() {
    echo -e "${YELLOW}${BOLD}    ✨ Votre commande évolue...${NC}"
    echo ""
    echo -e "${WHITE}    ╔═══════════════╗${NC}"
    echo -e "${WHITE}    ║ ${YELLOW}⚡${WHITE} ${CYAN}⭐${WHITE} ${GREEN}🌟${WHITE} ${RED}✨${WHITE} ${BLUE}💫${WHITE} ║${NC}"
    echo -e "${WHITE}    ╚═══════════════╝${NC}"
    echo ""
    for dot in "." ".." "..."; do
        echo -ne "${CYAN}    Évolution en cours$dot${NC}\r"
        sleep 0.5
    done
    echo -e "${GREEN}${BOLD}    ✅ Évolution terminée !              ${NC}"
    echo ""
}

# Fonction pour afficher la date et l'heure
afficher_date_heure() {
    animation_evolution
    animation_capture
    echo -e "${YELLOW}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${YELLOW}${BOLD}    ║              ⏰ HORLOGE POKÉMON                ║${NC}"
    echo -e "${YELLOW}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""

    local current_hour=$(date '+%H')
    local time_period=""
    local pokemon_activity=""

    # Déterminer la période et l'activité Pokémon
    if [ $current_hour -ge 6 ] && [ $current_hour -lt 12 ]; then
        time_period="🌅 Matin"
        pokemon_activity="Les Pokémon Plante sont actifs !"
    elif [ $current_hour -ge 12 ] && [ $current_hour -lt 18 ]; then
        time_period="☀️ Après-midi"
        pokemon_activity="Les Pokémon Feu sont énergiques !"
    elif [ $current_hour -ge 18 ] && [ $current_hour -lt 22 ]; then
        time_period="🌆 Soirée"
        pokemon_activity="Les Pokémon Eau sortent !"
    else
        time_period="🌙 Nuit"
        pokemon_activity="Les Pokémon Spectre apparaissent !"
    fi

    echo -e "${WHITE}    📅 Date du jour    : ${GREEN}$(date '+%d/%m/%Y')${NC}"
    echo -e "${WHITE}    🕐 Heure actuelle  : ${GREEN}$(date '+%H:%M:%S')${NC}"
    echo -e "${WHITE}    🌍 Région temporelle: ${GREEN}$(date '+%Z')${NC}"
    echo -e "${CYAN}    $time_period${NC}"
    echo -e "${YELLOW}    🐾 $pokemon_activity${NC}"
    echo ""

    # Simulation du temps de jeu
    local play_time=$(( $(date +%s) % 86400 / 3600 ))
    echo -e "${MAGENTA}    🎮 Temps de jeu aujourd'hui : ${GREEN}${play_time}h${NC}"

    # Phase lunaire pour les Pokémon nocturnes
    local moon_phase=$(($(date +%d) % 8))
    case $moon_phase in
        0|7) echo -e "${WHITE}    🌑 Nouvelle Lune - Pokémon Spectre rares !${NC}" ;;
        1|6) echo -e "${GRAY}    🌘 Croissant - Pokémon Ténèbres actifs${NC}" ;;
        2|5) echo -e "${YELLOW}    🌗 Quartier - Équilibre des types${NC}" ;;
        3|4) echo -e "${WHITE}    🌕 Pleine Lune - Pokémon Fée dansent !${NC}" ;;
    esac
}

# Fonction pour afficher l'espace disque
afficher_espace_disque() {
    animation_evolution
    animation_capture
    echo -e "${GREEN}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}${BOLD}    ║              💾 PC DE STOCKAGE                 ║${NC}"
    echo -e "${GREEN}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}    État de vos boîtes de stockage Pokémon :${NC}"
    echo ""

    # En-tête stylisé
    echo -e "${BLUE}    🏠 $(printf '%-15s' 'BOÎTE') $(printf '%8s' 'TAILLE') $(printf '%8s' 'UTILISÉ') $(printf '%8s' 'LIBRE') $(printf '%8s' 'USAGE') LOCALISATION${NC}"
    echo -e "${GRAY}    ────────────────────────────────────────────────────────────────────${NC}"

    df -h | while read filesystem size used avail use mountpoint; do
        if [[ "$filesystem" != "Filesystem" ]] && [[ "$use" != "" ]]; then
            # Déterminer le type de boîte selon l'usage
            usage_num=$(echo $use | sed 's/%//')
            if [ "$usage_num" -gt 90 ]; then
                color="${RED}"
                icon="🔴"
                box_type="CRITIQUE"
            elif [ "$usage_num" -gt 75 ]; then
                color="${YELLOW}"
                icon="🟡"
                box_type="PLEINE"
            elif [ "$usage_num" -gt 50 ]; then
                color="${BLUE}"
                icon="🔵"
                box_type="OCCUPÉE"
            else
                color="${GREEN}"
                icon="🟢"
                box_type="LIBRE"
            fi

            # Raccourcir le nom du système de fichiers
            short_fs=$(echo $filesystem | cut -c1-12)

            echo -e "${WHITE}    $icon $(printf '%-15s' "$short_fs") $(printf '%8s' "$size") $(printf '%8s' "$used") $(printf '%8s' "$avail") ${color}$(printf '%7s' "$use")${WHITE} $mountpoint${NC}"
            echo -e "${GRAY}         └─ Boîte $box_type${NC}"
        fi
    done
    echo ""
    echo -e "${CYAN}    💡 Astuce : Libérez de l'espace en transférant vos Pokémon !${NC}"
}

# Fonction pour afficher les utilisateurs connectés
afficher_utilisateurs_connectes() {
    animation_evolution
    animation_capture
    echo -e "${BLUE}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}${BOLD}    ║            👥 DRESSEURS CONNECTÉS              ║${NC}"
    echo -e "${BLUE}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""

    local trainer_count=$(who | wc -l)
    echo -e "${WHITE}    🏢 Centre Pokémon - Dresseurs présents : ${GREEN}$trainer_count${NC}"
    echo ""

    if [ $trainer_count -eq 0 ]; then
        echo -e "${GRAY}    😴 Le Centre Pokémon est vide...${NC}"
        echo -e "${YELLOW}    🌙 Même l'Infirmière Joëlle fait une pause !${NC}"
        echo -e "${MAGENTA}    ✨ Seuls quelques Pokémon sauvages rôdent${NC}"
    else
        echo -e "${WHITE}    Liste des dresseurs au Centre :${NC}"
        echo ""

        # Types de Pokémon pour simulation
        local pokemon_types=("Pikachu" "Évoli" "Salamèche" "Carapuce" "Bulbizarre" "Ronflex" "Magicarpe" "Métamorph" "Miaouss" "Psykokwak")

        who | while read line; do
            username=$(echo $line | awk '{print $1}')
            terminal=$(echo $line | awk '{print $2}')
            time=$(echo $line | awk '{print $3" "$4}')

            # Simuler un niveau et un Pokémon favori
            level=$((RANDOM % 100 + 1))
            favorite_pokemon=${pokemon_types[$((RANDOM % ${#pokemon_types[@]}))]}
            badges=$((RANDOM % 9))

            # Déterminer le rang selon le niveau
            if [ $level -ge 80 ]; then
                rank="🏆 Maître"
                rank_color="${YELLOW}"
            elif [ $level -ge 60 ]; then
                rank="⭐ Expert"
                rank_color="${CYAN}"
            elif [ $level -ge 40 ]; then
                rank="🎯 Confirmé"
                rank_color="${GREEN}"
            elif [ $level -ge 20 ]; then
                rank="📚 Novice"
                rank_color="${BLUE}"
            else
                rank="🐣 Débutant"
                rank_color="${WHITE}"
            fi

            echo -e "${WHITE}    👤 ${CYAN}$username${NC}"
            echo -e "${GRAY}       ├─ Terminal: ${YELLOW}$terminal${NC}"
            echo -e "${GRAY}       ├─ Connecté: ${WHITE}$time${NC}"
            echo -e "${GRAY}       ├─ ${rank_color}$rank${GRAY} (Niv. ${GREEN}$level${GRAY})${NC}"
            echo -e "${GRAY}       ├─ Badges: ${YELLOW}$badges${GRAY}/8${NC}"
            echo -e "${GRAY}       └─ Pokémon favori: ${RED}$favorite_pokemon${NC}"
            echo ""
        done

        echo -e "${MAGENTA}    💫 L'Infirmière Joëlle: \"Prenez soin de vos Pokémon !\"${NC}"
    fi
}

# Fonction pour afficher les processus en cours
afficher_processus_en_cours() {
    animation_evolution
    animation_capture
    echo -e "${MAGENTA}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}${BOLD}    ║              ⚡ POKÉMON ACTIFS                 ║${NC}"
    echo -e "${MAGENTA}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${WHITE}    🔍 Scan des Pokémon système en cours...${NC}"
    echo ""

    # En-tête du Pokédex
    echo -e "${CYAN}    $(printf '%-15s' 'DRESSEUR') $(printf '%-8s' 'ID#') $(printf '%-6s' 'CP') $(printf '%-6s' 'PV') $(printf '%-20s' 'POKÉMON') TYPE${NC}"
    echo -e "${GRAY}    ──────────────────────────────────────────────────────────────────${NC}"

    # Types de Pokémon selon les processus
    ps aux | head -15 | tail -n +2 | while read line; do
        user=$(echo $line | awk '{print $1}')
        pid=$(echo $line | awk '{print $2}')
        cpu=$(echo $line | awk '{print $3}')
        mem=$(echo $line | awk '{print $4}')
        command=$(echo $line | awk '{for(i=11;i<=NF;i++) printf "%s ", $i; print ""}' | cut -c1-18)

        # Assigner un Pokémon selon le type de processus
        if [[ $command == *"bash"* ]] || [[ $command == *"sh"* ]]; then
            pokemon="Magicarpe"
            type="💧 Eau"
            icon="🐟"
        elif [[ $command == *"python"* ]]; then
            pokemon="Arbok"
            type="☠️  Poison"
            icon="🐍"
        elif [[ $command == *"java"* ]]; then
            pokemon="Salamèche"
            type="🔥 Feu"
            icon="🦎"
        elif [[ $command == *"nginx"* ]] || [[ $command == *"apache"* ]]; then
            pokemon="Électrode"
            type="⚡ Électrik"
            icon="⚡"
        elif [[ $command == *"mysql"* ]] || [[ $command == *"postgres"* ]]; then
            pokemon="Métamorph"
            type="🔄 Normal"
            icon="🔮"
        elif [[ $command == *"ssh"* ]]; then
            pokemon="Alakazam"
            type="🔮 Psy"
            icon="🧠"
        elif [[ $command == *"cron"* ]]; then
            pokemon="Kadabra"
            type="🔮 Psy"
            icon="🕐"
        elif [[ $command == *"systemd"* ]]; then
            pokemon="Ronflex"
            type="😴 Normal"
            icon="💤"
        else
            pokemon="Évoli"
            type="✨ Normal"
            icon="🦊"
        fi

        # Calculer CP et PV basés sur CPU et MEM
        cp=$(( (${cpu%.*} * 10) + (${mem%.*} * 5) ))
        pv=$(( 100 - ${mem%.*} ))

        # Couleur selon la performance
        if (( $(echo "$cpu > 50" | bc -l 2>/dev/null || echo "0") )); then
            perf_color="${RED}"
        elif (( $(echo "$cpu > 20" | bc -l 2>/dev/null || echo "0") )); then
            perf_color="${YELLOW}"
        else
            perf_color="${GREEN}"
        fi

        echo -e "${WHITE}    $icon $(printf '%-13s' "${user:0:13}") $(printf '%-8s' "$pid") ${perf_color}$(printf '%4s' "${cpu%.*}")${WHITE} $(printf '%4s' "${mem%.*}") $(printf '%-18s' "$pokemon") $type${NC}"
    done

    echo ""
    echo -e "${CYAN}    🔬 Professeur Chen: \"Fascinant ! $(ps aux | wc -l) Pokémon détectés !\"${NC}"
    pokemon_cry
}

# Animation de fin d'aventure
animation_fin_aventure() {
    clear
    echo -e "${RED}${BOLD}    ╔════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}    ║               🚪 FIN D'AVENTURE                ║${NC}"
    echo -e "${RED}${BOLD}    ╚════════════════════════════════════════════════╝${NC}"
    echo ""

    echo -e "${YELLOW}    💾 Sauvegarde de votre progression...${NC}"
    for i in {1..3}; do
        echo -ne "${GREEN}    ▓▓▓"
        sleep 0.4
        echo -ne "▓▓▓"
        sleep 0.4
        echo -e "▓▓▓${NC}"
        sleep 0.3
    done

    echo ""
    echo -e "${GREEN}    ✅ Progression sauvegardée !${NC}"
    echo -e "${BLUE}    🏥 Vos Pokémon sont soignés automatiquement${NC}"

    # Messages aléatoires de fin
    local end_messages=(
        "🌟 \"Bonne chance pour la suite de votre aventure !\" - Professeur Chen"
        "💫 \"Revenez nous voir au Centre Pokémon !\" - Infirmière Joëlle"
        "⚡ \"Pika pika !\" - Un Pikachu sauvage vous salue"
        "🎯 \"Attrapez-les tous !\" - Un Dresseur mystérieux"
        "🏆 \"Votre Pokédex n'attend que d'être complété !\" - Professeur Chen"
    )

    local random_message=${end_messages[$((RANDOM % ${#end_messages[@]}))]}

    sleep 1
    echo ""
    echo -e "${CYAN}$random_message${NC}"
    echo ""

    # Art ASCII final
    echo -e "${YELLOW}                    (\\   /)${NC}"
    echo -e "${YELLOW}                   ( ^o^ )${NC}"
    echo -e "${YELLOW}                  O_(\")(\")${NC}"
    echo -e "${RED}               ●━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━●${NC}"
    echo -e "${WHITE}               À bientôt, Dresseur !${NC}"
    echo ""

    pokemon_cry
}

# Fonction pour pause stylisée
pause_stylisee() {
    echo ""
    echo -e "${RED}${BOLD}    ╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}    ║  ${YELLOW}Appuyez sur ${GREEN}[ENTRÉE]${YELLOW} pour retourner au Pokédex        ${RED}║${NC}"
    echo -e "${RED}${BOLD}    ╚══════════════════════════════════════════════════════╝${NC}"
    read
}

# Message de bienvenue initial
echo -e "${CYAN}${BOLD}Initialisation du Pokédex...${NC}"
sleep 1
pokemon_cry

# Boucle principale du menu
while true; do
    afficher_menu
    echo -e "${WHITE}${BOLD}    Choisissez votre action, Dresseur ${GREEN}[1-5]${WHITE} : ${NC}"
    echo -ne "${RED}    ⚡ Choix → ${NC}"
    read choix

    case $choix in
        1)
            echo -e "${YELLOW}♪ Tic-tac ! ♪${NC}"
            clear
            afficher_date_heure
            pause_stylisee
            ;;
        2)
            echo -e "${GREEN}♪ Bip bip ! ♪${NC}"
            clear
            afficher_espace_disque
            pause_stylisee
            ;;
        3)
            echo -e "${BLUE}♪ Ding dong ! ♪${NC}"
            clear
            afficher_utilisateurs_connectes
            pause_stylisee
            ;;
        4)
            echo -e "${MAGENTA}♪ Bzzzzt ! ♪${NC}"
            clear
            afficher_processus_en_cours
            pause_stylisee
            ;;
        5)
            echo -e "${RED}♪ Pip pip ! ♪${NC}"
            animation_fin_aventure
            exit 0
            ;;
        *)
            clear
            echo -e "${RED}${BOLD}${BLINK}    ⚠️  ERREUR : ACTION INCONNUE  ⚠️${NC}"
            echo -e "${YELLOW}    🎯 Utilisez les numéros de 1 à 5 seulement${NC}"
            echo -e "${GRAY}    💡 Votre Pokédex ne reconnaît pas cette commande !${NC}"
            echo ""
            echo -e "${RED}♪ Erreur erreur ! ♪${NC}"
            pause_stylisee
            ;;
    esac
done