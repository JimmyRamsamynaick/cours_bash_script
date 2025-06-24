#!/bin/bash
# script
# Utilisation ./menu.sh
# Script : menu.sh
# Auteur : Jimmy RAMSAMYNAÏCK
# Date : $(date)

#Demander un mot de passe à l'utilisateur (masqué)
#Verifier la longeur
#Verifier la présence chiffre et lettre
#Score de sécurité (Faible/Moyen/Fort)
#Recommandation d'amélioration

#!/bin/bash

echo "=== VERIFICATION DU MOT DE PASSE ==="
read -sp "Entrez votre mot de passe : " motdepasse
echo ""

echo "=== VERIFICATION DE LA LONGUEUR ==="
longueur=${#motdepasse}
echo "Longueur du mot de passe : $longueur caractères"
echo ""

echo "=== EST-CE QU'IL Y A DES CHIFFRES ET DES LETTRES ==="
score=0

if [[ "$motdepasse" =~ [a-zA-Z] ]]; then
  echo "Présence de lettre : OK"
  ((score++))
else
  echo "Présence de lettre : NON"
fi

if [[ "$motdepasse" =~ [0-9] ]]; then
  echo "Présence de chiffre : OK"
  ((score++))
else
  echo "Présence de chiffre : NON"
fi

if [[ "$motdepasse" =~ [!@#$%^\&*(),.?\":{}|\<\>] ]]; then
  echo "Présence de caractère spécial : OK"
  ((score++))
else
  echo "Présence de caractère spécial : NON"
fi

if [[ $longueur -ge 8 ]]; then
  ((score++))
fi

echo "Score obtenu : $score / 4"
echo ""

echo "=== CALCUL DU SCORE DE SÉCURITÉ ==="
if [[ $score -le 2 ]]; then
  echo "Score de sécurité : Faible"
elif [[ $score -eq 3 ]]; then
  echo "Score de sécurité : Moyen"
else
  echo "Score de sécurité : Fort"
fi
echo ""

echo "=== RECOMMANDATIONS D'AMÉLIORATION ==="
case $score in
  1|2)
    echo "Recommandations :"
    echo "- Utilisez au moins 8 caractères."
    echo "- Incluez des chiffres, des lettres et des caractères spéciaux."
    ;;
  3)
    echo "Recommandations :"
    echo "- Ajoutez des caractères spéciaux ou augmentez la longueur."
    ;;
  4)
    echo "Votre mot de passe est suffisamment sécurisé."
    ;;
esac
echo ""