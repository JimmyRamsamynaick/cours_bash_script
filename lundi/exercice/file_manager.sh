#!/bin/bash
# script pour un file manager
# Utilisation ./manage.sh
# Script : manage.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

# donne un repertoire a analyser en parametre
echo "nom du script : $0"
echo "=== INFORMATION SUR LE REPERTOIRE COURANT ==="
echo "repertoire analyser : $1"
echo ""
# contenue du repertoire analyser et lister les fichiers et dossiers qui s'y trouvent
echo "=== CONTENU DU REPERTOIRE ==="
echo "$(ls -l $1)"
echo ""
# statistiques sur le repertoire
echo "=== STATISTIQUES SIMPLES ==="
echo "Nombre total d'element : $(ls -1 $1 | wc -l)"
echo "Espace disque utilisé : $(du -sh $1 | awk '{print $1}')"
