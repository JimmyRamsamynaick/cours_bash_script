#!/bin/bash
# Script : gen_conf.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Modifier /etc/ssh/ssd_config (ou copie de test)
#Changer le port par défaut (22->2222)
#Désactiver l'authentification par mot de passe root
#Activer logs détaillés
#Creer une sauvegarde avant modification

# Exécuter le script
generer_conf_ssh() {
    local ssh_config="/etc/ssh/sshd_config"
    local backup_config="/etc/ssh/sshd_config.bak"

    # Créer une sauvegarde du fichier de configuration SSH
    if [ ! -f "$backup_config" ]; then
        sudo cp "$ssh_config" "$backup_config"
        echo "Sauvegarde du fichier de configuration SSH créée : $backup_config"
    else
        echo "La sauvegarde du fichier de configuration SSH existe déjà : $backup_config"
    fi

    # Modifier le fichier de configuration SSH
    sudo sed -i 's/^#Port 22/Port 2222/' "$ssh_config"
    sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' "$ssh_config"
    sudo sed -i 's/^#LogLevel INFO/LogLevel VERBOSE/' "$ssh_config"

    # Redémarrer le service SSH pour appliquer les changements
    sudo systemctl restart sshd
    echo "Configuration SSH mise à jour et service redémarré."
}

# Appel de la fonction pour générer la configuration SSH
generer_conf_ssh

# Afficher un message de succès
echo "Configuration SSH générée avec succès. Le port par défaut a été changé, l'authentification par mot de passe root a été désactivée et les logs détaillés sont activés."

