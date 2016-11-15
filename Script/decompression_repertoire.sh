#!/bin/sh
# decompression_repertoire.sh
#
# Décompresse l'ensemble des archives contenues dans un
# répertoire passé en paramètre.

# vérification de la présence d'un argument
if [ $# -lt 1 ]; then
    # s'il n'y a pas d'argument, on prévient l'utilisateur
    echo "Pas d'archives à décompresser !"
else
    # sinon on décompresse les archives du répertoire

    # on récupère la liste
    list_ar=`ls $1 | grep .tgz`
    # pour chaque archive, on décompresse
    for i in $list_ar
    do
	tar xzvf $1/$i
    done
fi
