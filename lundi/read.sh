#!/bin/bash
# script
# Utilisation ./read.sh
# Script : read.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

echo "entrer votre nom :"
read nom

echo "entrer votre age :"
read age

echo "Bonjour, vous vous appelez $nom et vous avez $age ans."

read -s -p "Entrer votre mot de passe : " motdepasse