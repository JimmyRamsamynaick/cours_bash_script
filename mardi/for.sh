#!/bin/bash
# Script : for.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

for compteur in {1..100}; do
  echo "Le numero en cours est : ${compteur}"
done

for voiture in "BMW" "Mercedes" "Audi"; do
  echo "La marque de voiture est : ${voiture}"
done

compteur=0
while [ $compteur -lt 100 ]; do
  compteur=$((compteur + 1))
    echo $compteur
done

