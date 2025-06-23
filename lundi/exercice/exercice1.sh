#!/bin/bash
# script
# Utilisation ./param.sh
# Script : param.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#information du script
echo "=== INFORMATION SCRIPT ==="
echo "Nom du script : $0"
echo "Nombre de parametres reçus : $#"

echo "Note : Ce script fonctionne mieux avec des parametres."
echo "Usage : ./param.sh <param1> <param2> <param3> ..."
echo "Exemple : ./param.sh hello world test"

echo "=== PARAMETRES INDIVIDUELS ==="
echo "Premier parametre ($1) : $1"
echo "Deuxieme parametre ($2) : $2"
echo "Troisieme parametre ($3) : $3"

echo "=== TOUS LES PARAMETRES ==="
echo "Avec \$@: $@"
echo "Avec \$*: $*"

echo "=== PARAMETRES UN PAR UN ==="
echo "Parametre 1 : $1"
echo "Parametre 2 : $2"
echo "Parametre 3 : $3"
echo "Parametre 4 : $4"
echo "Parametre 5 : $5"


