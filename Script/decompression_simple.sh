#!/bin/sh
# decompression_simple.sh
#
# Décompresse une archive passée en paramètre.

# vérification de la présence d'un argument
if [ $# -lt 1 ]; then
    # s'il n'y a pas d'argument, on prévient l'utilisateur
    echo "Pas d'archive à décompresser !"
else
    # sinon on décompresse l'archive
    tar xzvf $1
fi
