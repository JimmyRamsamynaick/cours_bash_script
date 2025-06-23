#!/bin/bash
# script de presentation
# Utilisation ./script2.sh
# Script : script2.sh
#Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#création de 2 variables
nombre1=20
nombre2=30

echo "le 1er nombre est ${nombre1}, le 2eme nombre est ${nombre2}." #affiche les variables

#addition des 2 variables et affichage du résultat
echo "Resultat= $((nombre1+nombre2))"

echo "Resultat modulo= $((nombre2%nombre1))"

echo "Resultat multiplication= $((nombre1*nombre2))"

echo "Resultat soustraction= $((nombre1-nombre2))"