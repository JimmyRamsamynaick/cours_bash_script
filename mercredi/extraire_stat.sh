#!/bin/bash
# Script : extraire_stat.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#compter le nombre total de requêtes
#lister les 10 IP les plus fréquentes
#calculer la bande passante totale
#identifier les erreurs 404 et 500
#generer un rapport formaté
#format log : IP - - [date] "méthode URL" code taille

# Exécuter le script
extraire_statistiques() {
    local log_file="/var/log/apache2/access.log"
    local report_file="rapport_statistiques.txt"

    # Vérifier si le fichier de log existe
    if [ ! -f "$log_file" ]; then
        echo "Le fichier de log $log_file n'existe pas."
        exit 1
    fi

    # Compter le nombre total de requêtes
    total_requests=$(wc -l < "$log_file")

    # Lister les 10 IP les plus fréquentes
    top_ips=$(awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 10)

    # Calculer la bande passante totale
    total_bandwidth=$(awk '{sum += $10} END {print sum}' "$log_file")

    # Identifier les erreurs 404 et 500
    errors_404=$(grep ' 404 ' "$log_file" | wc -l)
    errors_500=$(grep ' 500 ' "$log_file" | wc -l)

    # Générer le rapport formaté
    {
        echo "Rapport de Statistiques Apache"
        echo "=============================="
        echo "Nombre total de requêtes : $total_requests"
        echo ""
        echo "Top 10 des IP les plus fréquentes :"
        echo "$top_ips"
        echo ""
        echo "Bande passante totale (en octets) : $total_bandwidth"
        echo ""
        echo "Erreurs 404 : $errors_404"
        echo "Erreurs 500 : $errors_500"
    } > "$report_file"

    echo "Rapport généré dans $report_file"
}

# Appel de la fonction pour extraire les statistiques
extraire_statistiques
# Afficher un message de succès
echo "Statistiques extraites avec succès. Le rapport est disponible dans le fichier rapport_statistiques.txt."
