#!/bin/bash
# Script : gen_conf.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#créer un generateur de configuration apache
#demander : nom du site, port, repertoire
#utiliser here document pour le template
#remplacer les variables dans le template
#sauvegarder la configuration generee

# Fonction pour générer la configuration Apache
generer_conf_apache() {
    read -p "Nom du site : " nom_site
    read -p "Port (par défaut 80) : " port
    port=${port:-80}  # Utiliser 80 par défaut si vide
    read -p "Répertoire racine (par défaut /var/www/$nom_site) : " repertoire
    repertoire=${repertoire:-/var/www/$nom_site}  # Utiliser le répertoire par défaut si vide

    # Créer le répertoire si nécessaire
    mkdir -p "$repertoire"

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

# Exécution de la fonction principale
generer_conf_apache
