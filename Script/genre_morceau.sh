#!/bin/sh
# genre_morceau.sh
#
# A l'aide de l'exécutable id3v2, retourne le genre musical
# d'un morceau sous la forme d'un nombre.

# L'option d'id3v2 qui donne la liste des genres est : "-L"

# vérification de la présence d'un argument
if [ $# -lt 1 ]; then
    # s'il n'y a pas d'argument, on prévient l'utilisateur
    echo "Pas de musique à analyser !"
else
    # sinon on affiche le résultat
    num="`id3v2 -L | grep \"$1\" | cut -d : -f 1`"
    echo "Le genre "\"$1"\" a pour numéro : $num."
fi
