#!/bin/bash
# Script : space_invaders_menu.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)
# Style : Space Invaders Retro

# Couleurs ANSI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m' # No Color

# Fonction pour afficher le titre Space Invaders
afficher_titre() {
    clear
    echo -e "${GREEN}${BOLD}"
    echo "    ███████ ██████   █████   ██████ ███████     ██ ███    ██ ██    ██  █████  ██████  ███████ ██████  ███████"
    echo "    ██      ██   ██ ██   ██ ██      ██          ██ ████   ██ ██    ██ ██   ██ ██   ██ ██      ██   ██ ██     "
    echo "    ███████ ██████  ███████ ██      █████       ██ ██ ██  ██ ██    ██ ███████ ██   ██ █████   ██████  ███████"
    echo "         ██ ██      ██   ██ ██      ██          ██ ██  ██ ██  ██  ██  ██   ██ ██   ██ ██      ██   ██      ██"
    echo "    ███████ ██      ██   ██  ██████ ███████     ██ ██   ████   ████   ██   ██ ██████  ███████ ██   ██ ███████"
    echo -e "${NC}"
    echo ""
    echo -e "${CYAN}                                    ▲${NC}"
    echo -e "${CYAN}                                   ▲▲▲${NC}"
    echo -e "${CYAN}                                  ▲▲▲▲▲${NC}"
    echo -e "${RED}                 ◄█████►         ◄█████►         ◄█████►${NC}"
    echo -e "${RED}                   ███             ███             ███${NC}"
    echo -e "${YELLOW}                    █               █               █${NC}"
    echo ""
}

# Fonction pour afficher le menu avec style space invaders
afficher_menu() {
    afficher_titre
    echo -e "${WHITE}${BOLD}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║${CYAN}                    CONSOLE DE COMMANDE                     ${WHITE}║${NC}"
    echo -e "${WHITE}${BOLD}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}${BOLD}║                                                              ║${NC}"
    echo -e "${WHITE}║  ${GREEN}[1]${WHITE} ► ${CYAN}Chronométrie Temporelle${WHITE} ⏰                         ║${NC}"
    echo -e "${WHITE}║  ${GREEN}[2]${WHITE} ► ${CYAN}Analyse Stockage Spatial${WHITE} 💾                       ║${NC}"
    echo -e "${WHITE}║  ${GREEN}[3]${WHITE} ► ${CYAN}Détection Entités Actives${WHITE} 👾                      ║${NC}"
    echo -e "${WHITE}║  ${GREEN}[4]${WHITE} ► ${CYAN}Scan Processus Système${WHITE} 🔍                         ║${NC}"
    echo -e "${WHITE}║  ${RED}[5]${WHITE} ► ${RED}${BLINK}Séquence d'Évacuation${NC}${WHITE} 🚀                           ║${NC}"
    echo -e "${WHITE}${BOLD}║                                                              ║${NC}"
    echo -e "${WHITE}${BOLD}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

# Animation de tir laser
animation_laser() {
    echo -e "${YELLOW}${BOLD}"
    for i in {1..3}; do
        echo -n "    ║"
        sleep 0.1
        echo -n "█"
        sleep 0.1
        echo -n "█"
        sleep 0.1
        echo "█║"
        sleep 0.1
    done
    echo -e "${NC}"
    echo -e "${GREEN}${BOLD}    ▼ COMMANDE EXÉCUTÉE ▼${NC}"
    echo ""
}

# Fonction pour afficher la date et l'heure
afficher_date_heure() {
    animation_laser
    echo -e "${CYAN}${BOLD}╔════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║        CHRONOMÉTRIE TEMPORELLE         ║${NC}"
    echo -e "${CYAN}${BOLD}╚════════════════════════════════════════╝${NC}"
    echo -e "${WHITE}Coordonnées Temporelles : ${GREEN}$(date)${NC}"
    echo -e "${YELLOW}Timestamp Unix : ${GREEN}$(date +%s)${NC}"
}

# Fonction pour afficher l'espace disque
afficher_espace_disque() {
    animation_laser
    echo -e "${MAGENTA}${BOLD}╔════════════════════════════════════════╗${NC}"
    echo -e "${MAGENTA}${BOLD}║       ANALYSE STOCKAGE SPATIAL         ║${NC}"
    echo -e "${MAGENTA}${BOLD}╚════════════════════════════════════════╝${NC}"
    echo -e "${WHITE}État des Modules de Stockage :${NC}"
    echo ""
    df -h | while read line; do
        if [[ $line == *"/"* ]]; then
            echo -e "${GREEN}💾 $line${NC}"
        else
            echo -e "${CYAN}$line${NC}"
        fi
    done
}

# Fonction pour afficher les utilisateurs connectés
afficher_utilisateurs_connectes() {
    animation_laser
    echo -e "${BLUE}${BOLD}╔════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}${BOLD}║      DÉTECTION ENTITÉS ACTIVES         ║${NC}"
    echo -e "${BLUE}${BOLD}╚════════════════════════════════════════╝${NC}"
    echo -e "${WHITE}Entités Connectées au Système :${NC}"
    echo ""
    who | while read line; do
        echo -e "${GREEN}👾 $line${NC}"
    done
    if [ $(who | wc -l) -eq 0 ]; then
        echo -e "${RED}⚠️  Aucune entité détectée${NC}"
    fi
}

# Fonction pour afficher les processus en cours
afficher_processus_en_cours() {
    animation_laser
    echo -e "${RED}${BOLD}╔════════════════════════════════════════╗${NC}"
    echo -e "${RED}${BOLD}║        SCAN PROCESSUS SYSTÈME          ║${NC}"
    echo -e "${RED}${BOLD}╚════════════════════════════════════════╝${NC}"
    echo -e "${WHITE}Processus Actifs Détectés :${NC}"
    echo ""
    ps aux | head -20 | while read line; do
        if [[ $line == *"USER"* ]]; then
            echo -e "${YELLOW}$line${NC}"
        else
            echo -e "${GREEN}🔍 $(echo $line | cut -c1-100)${NC}"
        fi
    done
    echo -e "${CYAN}... (20 premiers processus affichés)${NC}"
}

# Animation de fin
animation_evacuation() {
    clear
    echo -e "${RED}${BOLD}${BLINK}"
    echo "    ⚠️  SÉQUENCE D'ÉVACUATION INITIÉE  ⚠️"
    echo -e "${NC}"
    echo ""
    echo -e "${YELLOW}Décompte d'évacuation...${NC}"
    for i in {3..1}; do
        echo -e "${RED}${BOLD}        $i${NC}"
        sleep 1
    done
    echo ""
    echo -e "${GREEN}${BOLD}    🚀 ÉVACUATION RÉUSSIE ! 🚀${NC}"
    echo ""
    echo -e "${CYAN}Merci d'avoir utilisé le Système Space Invaders${NC}"
    echo -e "${CYAN}Commandant, à bientôt pour une nouvelle mission !${NC}"
    echo ""
    echo -e "${WHITE}                    █${NC}"
    echo -e "${WHITE}                   ███${NC}"
    echo -e "${RED}                 ◄█████►${NC}"
    echo -e "${YELLOW}                    |${NC}"
    echo -e "${YELLOW}                   /|\\${NC}"
    echo ""
}

# Fonction pour pause stylisée
pause_stylisee() {
    echo ""
    echo -e "${WHITE}${BOLD}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║  ${YELLOW}Appuyez sur ${GREEN}[ENTRÉE]${YELLOW} pour retourner au menu principal  ${WHITE}║${NC}"
    echo -e "${WHITE}${BOLD}╚══════════════════════════════════════════════════════════════╝${NC}"
    read
}

# Boucle principale du menu
while true; do
    afficher_menu
    echo -e "${WHITE}${BOLD}Entrez les coordonnées de votre mission ${GREEN}[1-5]${WHITE} : ${NC}"
    echo -n "► "
    read choix

    case $choix in
        1)
            clear
            afficher_date_heure
            pause_stylisee
            ;;
        2)
            clear
            afficher_espace_disque
            pause_stylisee
            ;;
        3)
            clear
            afficher_utilisateurs_connectes
            pause_stylisee
            ;;
        4)
            clear
            afficher_processus_en_cours
            pause_stylisee
            ;;
        5)
            animation_evacuation
            exit 0
            ;;
        *)
            clear
            echo -e "${RED}${BOLD}${BLINK}⚠️  ERREUR : COORDONNÉES INVALIDES  ⚠️${NC}"
            echo -e "${YELLOW}Veuillez entrer des coordonnées valides entre 1 et 5${NC}"
            echo ""
            pause_stylisee
            ;;
    esac
done