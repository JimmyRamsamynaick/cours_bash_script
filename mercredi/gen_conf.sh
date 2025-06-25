#!/bin/bash
# Script : gen_conf.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#créer un generateur de configuration apache
#demander : nom du site, port, repertoire
#utiliser here document pour le template
#remplacer les variables dans le template
#sauvegarder la configuration generee
#faire un .html pour afficher la configuration generee
#generer un fichier .conf dans /etc/apache2/sites-available/



# Exécuter le script
generer_conf_apache() {
    local nom_site port repertoire
    read -p "Nom du site : " nom_site
    read -p "Port (par défaut 80) : " port
    port=${port:-80}  # Utiliser 80 par défaut si vide
    read -p "Répertoire racine (par défaut /var/www/$nom_site) : " repertoire
    repertoire=${repertoire:-/var/www/html/$nom_site}  # Utiliser le répertoire par défaut si vide

    # Créer le répertoire avec les permissions appropriées
    sudo chown -R www-data:www-data "$repertoire"
    sudo chmod -R 755 "$repertoire"
    # Créer le répertoire s'il n'existe pas
    echo "Création du répertoire $repertoire..."
    mkdir -p "$repertoire"
    # Créer le répertoire s'il n'existe pas
    if [ ! -d "$repertoire" ]; then
        echo "Le répertoire $repertoire n'existe pas, création en cours..."
    else
        echo "Le répertoire $repertoire existe déjà."
    fi

    # Générer la configuration Apache
    cat <<EOF > "/etc/apache2/sites-available/$nom_site.conf"
<VirtualHost *:$port>
    ServerName $nom_site
    DocumentRoot $repertoire

    <Directory "$repertoire">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/$nom_site-error.log
    CustomLog \${APACHE_LOG_DIR}/$nom_site-access.log combined
</VirtualHost>
EOF

    # Activer le site
    a2ensite "$nom_site.conf"

    # Redémarrer Apache pour appliquer les changements
    systemctl restart apache2

    echo "Configuration générée et site $nom_site activé sur le port $port."

    # Afficher la configuration dans un fichier HTML
    afficher_conf_html "$nom_site" "$port" "$repertoire"
}

# Fonction pour afficher la configuration générée dans un fichier HTML
afficher_conf_html() {
    local nom_site="$1"
    local port="$2"
    local repertoire="$3"

    # Créer le répertoire pour le fichier HTML si nécessaire
    mkdir -p "/var/www/html/$nom_site"
    # Générer le fichier HTML
    cat <<EOF > "/var/www/html/$nom_site/configuration.html"

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configuration Apache - $nom_site</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h1 { color: #333; }
        pre { background-color: #f4f4f4; padding: 10px; border-radius: 5px; }
    </style>
</head>
<body>
    <h1>Configuration Apache pour $nom_site</h1>
    <p>Port : $port</p>
    <p>Répertoire racine : $repertoire</p>
    <pre>
<VirtualHost *:$port>
    ServerName $nom_site
    DocumentRoot $repertoire

    <Directory "$repertoire">
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/$nom_site-error.log
    CustomLog \${APACHE_LOG_DIR}/$nom_site-access.log combined
</VirtualHost>
    </pre>
</body>
</html>
EOF

    echo "Configuration affichée dans /var/www/$nom_site/configuration.html"
}

# Fonction pour afficher le menu
afficher_menu() {
    echo -e "\n=== Générateur de Configuration Apache ==="
    echo "1. Générer une configuration Apache"
    echo "2. Quitter"
}
# Boucle principale du menu
while true; do
    afficher_menu
    read -p "Choisissez une option : " choix

    case $choix in
        1)
            generer_conf_apache
            ;;
        2)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Option invalide. Veuillez réessayer."
            ;;
    esac
done

# Exécuter le script
generer_conf_apache