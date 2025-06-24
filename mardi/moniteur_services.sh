#!/bin/bash
# Script : moniteur_services.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Définir une liste de services à surveiller
#Vérifier l'état de chaque service (actif/inactif)
#Afficher un rapport coloré avec statuts
#Compter les services actifs et inactifs
#Ajouter la possibilité de redémarrer automatiquement les services inactifs avec confirmation utilisateur.

# Fonction pour vérifier l'état des services
verifier_services() {
    local services=("ssh" "nginx" "mysql" "apache2" "docker")
    local actif=0
    local inactif=0

    echo -e "\nÉtat des services :\n"
    for service in "${services[@]}"; do
        if systemctl is-active --quiet "$service"; then
            echo -e "\e[32m$service est actif\e[0m"
            ((actif++))
        else
            echo -e "\e[31m$service est inactif\e[0m"
            ((inactif++))
        fi
        # Demander à l'utilisateur s'il souhaite redémarrer le service inactif
        if ! systemctl is-active --quiet "$service"; then
            read -p "Voulez-vous redémarrer le service $service ? (o/n) " reponse
            if [[ "$reponse" == "o" || "$reponse" == "O" ]]; then
                sudo systemctl restart "$service"
                if systemctl is-active --quiet "$service"; then
                    echo -e "\e[32m$service a été redémarré avec succès\e[0m"
                    ((actif++))
                    ((inactif--))
                else
                    echo -e "\e[31mÉchec du redémarrage de $service\e[0m"
                fi
            fi
        fi
    done

    echo -e "\nRésumé :"
    echo -e "\e[32mNombre de services actifs : $actif\e[0m"
    echo -e "\e[31mNombre de services inactifs : $inactif\e[0m"
}

# Fonction pour afficher le menu
afficher_menu() {
    echo -e "\n=== Moniteur de Services ==="
    echo "1. Vérifier l'état des services"
    echo "2. Quitter"
}

# Boucle principale du menu
while true; do
    afficher_menu
    read -p "Choisissez une option : " choix

    case $choix in
        1)
            verifier_services
            ;;
        2)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo -e "\e[31mOption invalide, veuillez réessayer.\e[0m"
            ;;
    esac
done

# Exécution de la fonction principale
verifier_services
