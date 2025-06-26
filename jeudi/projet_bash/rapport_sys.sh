#!/bin/bash
# Script : rapport_sys.sh
# Auteurs : Jimmy RAMSAMYNAÏCK, Sameer VALI ADAM, Alexandre BADOUARD
# Date : $(date)

# ================================================
# SECTION : INSTALLATION DES PAQUETS REQUIS (manuel)
# À exécuter une seule fois avec les droits root :
sudo apt update
sudo apt install -y pandoc texlive-latex-recommended texlive-fonts-recommended texlive-latex-extra
# sudo apt install -y mutt
# sudo apt install -y postfix
# Pour configurer postfix : sélectionner "site Internet" et valider avec domaine local
# ================================================

START=$(date +%s)

# Vérification des droits root
if [ "$(id -u)" -ne 0 ]; then
    echo "Ce script doit être exécuté avec les droits root."
    exit 1
fi

echo "Génération du rapport système en cours..."

# Répertoire de sortie
DEST_DIR="/tmp/rapports"
mkdir -p "$DEST_DIR"

# Fichiers
DATE_TAG=$(date +%Y%m%d_%H%M%S)
REPORT_FILE="$DEST_DIR/rapport_systeme_${DATE_TAG}.txt"
PDF_FILE="$DEST_DIR/rapport_systeme_${DATE_TAG}.pdf"

touch "$REPORT_FILE" || { echo "Erreur : impossible de créer le fichier de rapport."; exit 1; }
echo "Le rapport sera enregistré dans : $REPORT_FILE"

# ========== Collecte des informations système ==========
{
    echo "===== INFORMATIONS SYSTÈME ====="
    echo "OS : $(uname -s)"
    echo "Version : $(uname -r)"
    echo "Architecture : $(uname -m)"
    echo ""

    echo "===== UTILISATION CPU ====="
    top -b -n1 | grep "Cpu(s)"
    echo ""

    echo "===== MÉMOIRE ====="
    free -h
    echo ""

    echo "===== DISQUES ====="
    df -h
    echo ""

    echo "===== SERVICES ACTIFS ====="
    systemctl list-units --type=service --state=running
    echo ""

    echo "===== RÉSEAU ====="
    echo "Adresse IP : $(hostname -I | awk '{print $1}')"
    echo "Nom d'hôte : $(hostname)"
    echo "Interfaces actives :"
    ip -o link show | awk -F': ' '{print $2}'
    echo ""

    echo "===== UTILISATEURS ET PROCESSUS ====="
    who
    echo ""
    cut -d: -f1 /etc/group
    echo ""
    ps aux --sort=-%mem | head -n 10
} >> "$REPORT_FILE"

# ========== Conversion en PDF ==========
if command -v pandoc >/dev/null && command -v pdflatex >/dev/null; then
    pandoc "$REPORT_FILE" -o "$PDF_FILE"
    if [ $? -eq 0 ]; then
        echo "Conversion en PDF réussie : $PDF_FILE"
    else
        echo "Erreur lors de la conversion en PDF."
        PDF_FILE=""
    fi
else
    echo "Pandoc ou pdflatex manquant. Conversion PDF non effectuée."
    PDF_FILE=""
fi

END=$(date +%s)
echo "Durée d'exécution : $((END - START)) secondes"
echo "Fin du script."
