#!/bin/bash
# script
# Utilisation ./condition1.sh
# Script : condition1.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Test de condition numérique

read -p "Entrez votre age : " age

#empecher l'utilisateur de saisir un age invalide, s'il rentre un age invalide, le script affiche une erreur et quitte.
#un age est un chiffre entier compris entre 1 et 150
#un age c'est des chiffres, pas de lettres, pas de caracteres speciaux

if [[ $age =~ ^[0-9]+$ ]]; then
  if [ "$age" -lt 1 ] || [ "$age" -gt 150 ]; then
    echo "Veuillez entrer un age valide (un nombre entier entre 1 et 150)."
    exit 1
  elif [ "$age" -eq 1 ]; then
    echo "Vous avez 1 an."
  else
    echo "Vous avez $age ans."
  fi
else
  echo "Veuillez entrer un age valide (un nombre entier entre 1 et 150)."
  exit 1
fi