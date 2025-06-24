#!/bin/bash
# script
# Utilisation ./condition1.sh
# Script : condition1.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Test de condition numérique

read -p "Entrez votre age : " age

if [ $age -gt 1 ]; then
  echo "Vous avez $age ans"
  else [ $age -eq 1 ];
    echo "Vous avez 1 an"
fi