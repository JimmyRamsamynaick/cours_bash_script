#!/bin/bash
# script
# Utilisation ./param.sh
# Script : param.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#information du script
echo "=== INFORMATION SCRIPT ==="
echo "Nom du script : $0"
echo "Nombre de paramètres reçus : $#"

echo "Note : Ce script fonctionne mieux avec des paramètres."
echo "Usage : ./param.sh <param1> <param2> <param3> ..."
echo "Exemple : ./param.sh hello world test"

echo "=== PARAMÈTRES INDIVIDUELS ==="
echo "Premier paramètre ($1) : $1"
echo "Deuxième paramètre ($2) : $2"
echo "Troisième paramètre ($3) : $3"

echo "=== TOUS LES PARAMÈTRES ==="
echo "Avec \$@: $@"
echo "Avec \$*: $*"

echo "=== PARAMÈTRES UN PAR UN ==="
echo "Paramètre 1 : $1"
echo "Paramètre 2 : $2"
echo "Paramètre 3 : $3"
echo "Paramètre 4 : $4"
echo "Paramètre 5 : $5"


