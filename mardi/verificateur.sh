#!/bin/bash
# script
# Utilisation ./condition1.sh
# Script : condition1.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#demander l'age de l'utilisateur
#Catégoriser : mineur, majeur, senior (65+)
#Prendre un nom de fichier en parametre
#Vérifier permission du fichier
#Rapport complet des verifications

echo "=== INFORMATION SUR LE REPERTOIRE COURANT ==="
echo "repertoire analyser : $1"
echo ""

echo "=== AGE DE L'UTILISATEUR ==="
read -p "Entrez votre age : " age
#empecher l'utilisateur de saisir un age invalide, s'il rentre un age invalide, le script affiche une erreur et quitte.
if [[ $age =~ ^[0-9]+$ ]]; then
  if [ "$age" -lt 1 ] || [ "$age" -gt 150 ]; then
    echo "Veuillez entrer un age valide (un nombre entier entre 1 et 150)."
    exit 1
  elif [ "$age" -lt 18 ]; then
    echo "Vous êtes mineur."
  elif [ "$age" -lt 65 ]; then
    echo "Vous êtes majeur."
  else
    echo "Vous êtes senior."
  fi
else
  echo "Veuillez entrer un age valide (un nombre entier entre 1 et 150)."
  exit 1
fi
echo ""

echo "=== INFORMATION DU REPERTOIRE ==="
if [ -e "$1" ]; then
  echo "Le fichier '$1' existe."
  if [ -r "$1" ]; then
    echo "Vous avez la permission de lire le fichier."
  else
    echo "Vous n'avez pas la permission de lire le fichier."
  fi
  if [ -w "$1" ]; then
    echo "Vous avez la permission d'écrire dans le fichier."
  else
    echo "Vous n'avez pas la permission d'écrire dans le fichier."
  fi
else
  echo "Le fichier '$1' n'existe pas."
fi

