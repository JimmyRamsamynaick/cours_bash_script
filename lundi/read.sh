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

echo "Quelle est votre couleur préférée ?"
read -t 10 couleur

echo "code de retour de read : $?"
echo "Votre couleur préférée est $couleur."