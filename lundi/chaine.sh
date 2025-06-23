#!/bin/bash
# script
# Utilisation ./chaine.sh
# Script : chaine.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

nom="RAMSAMYNAÏCK"
prenom="JIMMY"
prenom="${prenom,,}" # met tout le prénom en minuscule
prenom="${prenom^}" # met la première lettre en majuscule
nom=${nom,,} #met le nom en minuscule
nomPrenom="$nom $prenom " #concaténation du nom et du prénom

echo "l'utilisateur s'appelle ${nomPrenom}, cela fait ${#nomPrenom}" #affiche le nom et le prénom

#extraction de chaine
echo ${nomPrenom:0:1} #affiche la première lettre de la chaine nom et prénom
echo ${nomPrenom:0:2} #affiche les 2 premières lettres de la chaine nom et prénom
echo ${nomPrenom:1:2} #affiche la chaine à partir de la 2eme lettre et les 2 lettres suivantes

# affiche les initials du nom concaténé à la premiere lettre du prénom
# fonctionne avec n'importe quelle chaine de caractères

premiereLettreNom=${nom:0:1} #extrait la première lettre du nom
premiereLettrePrenom=${prenom:0:1} #extrait la première lettre du prénom

echo "Initiales : ${nomPrenom:0:1}${nomPrenom:13:1}" #affiche les initiales du nom et du prénom

echo "Initiales : ${premiereLettreNom}${premiereLettrePrenom}" #affiche les initiales du nom et du prénom

#rechercher et remplacer
echo $nomPrenom

echo ${nomPrenom/a/i}

#rechercher et remplacer tout les a par i

echo ${nomPrenom//[aA]/i}