#!/bin/bash
# Script : audit_conf.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Rechercher les adresses IP dans les fichiers .conf
#Trouver les ports ouverts (format :port)
#Identifier les mots de passe en dur
#Lister les fichiers de log configurés
#Générer un rapport d'audit sécurisé

# Exécuter le script
audit_conf_apache() {
    local conf_files=$(find /etc/apache2/sites-available -name "*.conf")
    local report_file="/var/log/apache_audit_report.txt"

    echo "Audit des configurations Apache" > "$report_file"
    echo "Date : $(date)" >> "$report_file"
    echo "Fichiers de configuration : $conf_files" >> "$report_file"
    echo "" >> "$report_file"

    for conf_file in $conf_files; do
        echo "Analyse du fichier : $conf_file" >> "$report_file"

        # Rechercher les adresses IP
        grep -E '^\s*Listen\s+[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+:[0-9]+' "$conf_file" >> "$report_file"

        # Trouver les ports ouverts
        grep -E '^\s*Listen\s+[0-9]+' "$conf_file" >> "$report_file"

        # Identifier les mots de passe en dur
        grep -i 'password' "$conf_file" >> "$report_file"

        # Lister les fichiers de log configurés
        grep -i 'ErrorLog\|CustomLog' "$conf_file" >> "$report_file"

        echo "" >> "$report_file"
    done

    echo "Audit terminé. Rapport enregistré dans $report_file"
}

# Appel de la fonction d'audit
audit_conf_apache