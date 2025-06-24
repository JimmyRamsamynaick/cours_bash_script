#!/bin/bash
# Script : generateur_test.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Demander le nombre de fichiers à créer
#Générer des fichiers avec noms aléatoires et extensions variées
#Créer une structure de répertoires (test_files/type/)
#Remplir les fichiers avec du contenu de test approprié

# Fonction pour générer un nom de fichier aléatoire
generer_nom_fichier() {
    local prefix=$(tr -dc 'a-zA-Z' </dev/urandom | head -c 5)
    local suffix=$(tr -dc 'a-zA-Z' </dev/urandom | head -c 5)
    echo "${prefix}_${suffix}"
}

# Fonction pour générer un fichier avec une extension aléatoire
generer_fichier() {
    local nom_fichier=$(generer_nom_fichier)
    local extensions=("txt" "jpg" "png" "mp3" "wav" "mp4" "avi" "sh" "py" "zip" "tar")
    local extension=${extensions[$RANDOM % ${#extensions[@]}]}
    local chemin_fichier="test_files/${extension}/${nom_fichier}.${extension}"

    # Créer le répertoire si nécessaire
    mkdir -p "$(dirname "$chemin_fichier")"

    # Générer le contenu du fichier
    case $extension in
        txt|md)
            echo "Contenu de test pour un fichier texte." > "$chemin_fichier"
            ;;
        jpg|png)
            touch "$chemin_fichier"  # Juste un fichier vide pour l'image
            ;;
        mp3|wav)
            echo "Contenu audio de test." > "$chemin_fichier"
            ;;
        mp4|avi)
            echo "Contenu vidéo de test." > "$chemin_fichier"
            ;;
        sh|py)
            echo "#!/bin/bash\n# Script de test" > "$chemin_fichier"
            chmod +x "$chemin_fichier"
            ;;
        zip|tar)
            touch "$chemin_fichier"  # Juste un fichier vide pour l'archive
            ;;
        *)
            echo "Type de fichier inconnu."
            ;;
    esac

    echo "Fichier créé : $chemin_fichier"
}

# Fonction pour générer plusieurs fichiers
generer_fichiers() {
    read -p "Combien de fichiers voulez-vous générer ? " nombre_fichiers
    for ((i = 0; i < nombre_fichiers; i++)); do
        generer_fichier
    done
}

# Exécution de la fonction pour générer des fichiers
generer_fichiers
