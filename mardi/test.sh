#!/bin/bash
# script
# Utilisation ./condition1.sh
# Script : condition1.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

read -p "Chemin du fichier à teste : " fichier

if [ -f "$fichier" ]; then
  echo "Le fichier existe."
  if [ -r "$fichier" ]; then
    echo "on peut le lire."
    fi
  if [ -w "$fichier" ]; then
    echo "on peut le modifier !!"
    fi
  else
    echo "Le fichier n'existe pas."
fi