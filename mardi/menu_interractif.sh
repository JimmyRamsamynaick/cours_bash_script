#!/bin/bash
# script
# Utilisation ./menu.sh
# Script : menu.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#possibilité de faire un choix pour choisir son menu (allant de 1 à 5)
#affichage du menu apres choix
#afficher la date et l'heure
#afficher l'espace disque
#afficher les utilisateurs connectés
#afficher les processus en cours
#quitter le script

# Fonction pour afficher le menu
echo "=== MENU INTERACTIF ==="
afficher_menu() {
    echo "Menu Interactif"
    echo "1. Afficher la date et l'heure"
    echo "2. Afficher l'espace disque"
    echo "3. Afficher les utilisateurs connectés"
    echo "4. Afficher les processus en cours"
    echo "5. Quitter le script"
}
echo ""

# Fonction pour afficher la date et l'heure
afficher_date_heure() {
    echo "Date et Heure : $(date)"
}

# Fonction pour afficher l'espace disque
afficher_espace_disque() {
    echo "Espace Disque :"
    df -h
}

# Fonction pour afficher les utilisateurs connectés
afficher_utilisateurs_connectes() {
    echo "Utilisateurs Connectés :"
    who
}

# Fonction pour afficher les processus en cours
afficher_processus_en_cours() {
    echo "Processus en Cours :"
    ps aux
}

# Boucle principale du menu
while true; do
    afficher_menu
    echo -n "Choisissez une option (1-5) : "
    read choix

    case $choix in
        1)
            afficher_date_heure
            ;;
        2)
            afficher_espace_disque
            ;;
        3)
            afficher_utilisateurs_connectes
            ;;
        4)
            afficher_processus_en_cours
            ;;
        5)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Choix invalide. Veuillez choisir une option entre 1 et 5."
            ;;
    esac
    echo ""
    read -p "Appuyez sur Entrée pour continuer..."
    echo ""
    clear
done