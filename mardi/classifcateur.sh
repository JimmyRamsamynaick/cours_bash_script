#!/bin/bash
# Script : classificateur.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#\*.txt,*.md ->  fichier texte
#\*.jpg,*.png ->  fichier image
#\*.mp3,*.wav ->  fichier audio
#\*.mp4,*.avi ->  fichier video
#\*.sh,*.py ->  fichier script
#\*.zip,*.tar ->  fichier archive
#Autre -> type de fichier inconnu
#bonus : ajouter la taille du fichier s'il existe

# Fonction pour classer les fichiers
classer_fichiers() {
    for fichier in *; do
        if [[ -f $fichier ]]; then
            case $fichier in
                *.txt|*.md)
                    echo "$fichier est un fichier texte"
                    ;;
                *.jpg|*.png)
                    echo "$fichier est une image"
                    ;;
                *.mp3|*.wav)
                    echo "$fichier est un fichier audio"
                    ;;
                *.mp4|*.avi)
                    echo "$fichier est une vidéo"
                    ;;
                *.sh|*.py)
                    echo "$fichier est un script"
                    ;;
                *.zip|*.tar)
                    echo "$fichier est une archive"
                    ;;
                *)
                    echo "$fichier est un type de fichier inconnu"
                    ;;
            esac
        fi
        # Afficher la taille du fichier
        if [[ -f $fichier ]]; then
            taille=$(du -h "$fichier" | cut -f1)
            echo "Taille de $fichier : $taille"
        fi
        echo "------------------------"
        # Ajouter une ligne de séparation
        echo "------------------------"
        # Pause pour la lisibilité
        sleep 1
    done
}

# Exécution de la fonction
classer_fichiers