#!/bin/bash
# script
# Utilisation ./menu.sh
# Script : menu.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#afficher le menu avec une fonction

#declaration de la fonction affichage_menu
affichage_menu(){
  echo "ceci sera un menu un jour"
}

salutation(){
  echo "Bonjour $1, est ce que ça va ?"

  affichage_menu
}

salutation Jimmy