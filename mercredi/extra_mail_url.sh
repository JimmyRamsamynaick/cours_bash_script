#!/bin/bash
# Script : audit_conf.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Extraire toutes les adresses email valides
#Extraires toutes les URLs (http/https)
#Extraire les numéros de téléphone frnaçais
#Trier et dupliquer les résultats
#Sauvegarder dans des fichiers séparés

# Executer le script
extraire_emails_urls() {
    local input_file="$1"
    local email_file="emails.txt"
    local url_file="urls.txt"
    local phone_file="phones.txt"

    # Extraire les adresses email valides
    grep -Eo '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' "$input_file" | sort -u > "$email_file"

    # Extraire les URLs (http/https)
    grep -Eo 'https?://[a-zA-Z0-9./?=_-]+' "$input_file" | sort -u > "$url_file"

    # Extraire les numéros de téléphone français
    grep -Eo '\b0[1-9]([-. ]?[0-9]{2}){4}\b' "$input_file" | sort -u > "$phone_file"

    echo "Extraction terminée :"
    echo "Adresses email sauvegardées dans $email_file"
    echo "URLs sauvegardées dans $url_file"
    echo "Numéros de téléphone sauvegardés dans $phone_file"
}

# Vérifier si un fichier d'entrée est fourni
if [ $# -eq 0 ]; then
    echo "Usage: $0 <fichier_d'entrée>"
    exit 1
fi

# Appeler la fonction d'extraction avec le fichier d'entrée
extraire_emails_urls "$1"