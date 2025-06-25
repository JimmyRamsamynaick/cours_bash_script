#!/bin/bash
# Script : log.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#lire un fichier de log (créer un fichier de test)
#compter les erreurs avec grep et wc
#extraires les 10 dernieres connexions
#sauvegarder le rapport avec timestamp
#rediger les erreurs vers un fichier séparé

# Fonction pour lire le fichier de log et générer un rapport
#chercher les erreurs en 400 et 500 (et tout les autres codes d'erreur entre 400 et 500 et plus)
#chercher les erreurs serveurs
lire_log() {
    local fichier_log="$1"
    local rapport="rapport_log_$(date +%Y%m%d_%H%M%S).txt"
    local erreurs="erreurs_log_$(date +%Y%m%d_%H%M%S).txt"

    if [[ ! -f "$fichier_log" ]]; then
        echo "Le fichier de log $fichier_log n'existe pas."
        return 1
    fi

    echo "Analyse du fichier de log : $fichier_log" > "$rapport"
    echo "Rapport généré le : $(date)" >> "$rapport"
    echo "----------------------------------------" >> "$rapport"

    # Compter les erreurs
    local erreurs_count=$(grep -E "HTTP/[0-9\.]+\" [4-5][0-9]{2}" "$fichier_log" | wc -l)
    echo "Nombre d'erreurs (codes 400-599) : $erreurs_count" >> "$rapport"
    if [[ $erreurs_count -gt 0 ]]; then
        echo "Erreurs trouvées :" >> "$rapport"
        grep -E "HTTP/[0-9\.]+\" [4-5][0-9]{2}" "$fichier_log" >> "$rapport"
    else
        echo "Aucune erreur trouvée." >> "$rapport"
    fi
    echo "----------------------------------------" >> "$rapport"
    # Compter les erreurs serveur (codes 500-599)
    local erreurs_serveur_count=$(grep -E "HTTP/[0-9\.]+\" 5[0-9]{2}" "$fichier_log" | wc -l)
    echo "Nombre d'erreurs serveur (codes 500-599) : $erreurs_serveur_count" >> "$rapport"
    if [[ $erreurs_serveur_count -gt 0 ]]; then
        echo "Erreurs serveur trouvées :" >> "$rapport"
        grep -E "HTTP/[0-9\.]+\" 5[0-9]{2}" "$fichier_log" >> "$rapport"
    else
        echo "Aucune erreur serveur trouvée." >> "$rapport"
    fi
    echo "----------------------------------------" >> "$rapport"

    # Extraire les 10 dernières connexions
    echo -e "\nDernières 10 connexions :" >> "$rapport"
    tail -n 10 "$fichier_log" >> "$rapport"

    # Sauvegarder les erreurs dans un fichier séparé
    grep -i "error" "$fichier_log" > "$erreurs"

    echo "Rapport sauvegardé dans $rapport"
    echo "Erreurs sauvegardées dans $erreurs"
}

# Fonction pour afficher le menu
afficher_menu() {
    echo -e "\n=== Analyseur de Logs ==="
    echo "1. Lire un fichier de log"
    echo "2. Quitter"
}

# Boucle principale du menu
while true; do
    afficher_menu
    read -p "Choisissez une option : " choix

    case $choix in
        1)
            read -p "Entrez le chemin du fichier de log à analyser : " chemin_log
            lire_log "$chemin_log"
            ;;
        2)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Option invalide, veuillez réessayer."
            ;;
    esac
done

# Exécution de la fonction principale
lire_log "/home/jimmy/cours_expernet/cours_bash_script/mercredi/exercices_data/seance3/apache_access.log"