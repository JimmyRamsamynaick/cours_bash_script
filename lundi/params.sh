#!/bin/bash
# script
# Utilisation ./params.sh
# Script : params.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

echo "nom du script : $0"

echo "nombre d'arguments : $#"

echo "Tous les arguments : $*"
# X est le Xeme paramètre

echo $1 #le premier paramètre

nom=$1
prenom=$2

echo "Votre nom est $nom!"
echo "votre prénom est $prenom!"