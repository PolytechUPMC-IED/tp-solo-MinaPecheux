#!/bin/sh
# modif_genres.sh
#
# Décompresse toutes les archives du répertoire passé en paramètre puis
# à l'aide de l'exécutable id3v2, modifie les genres musicaux des fichiers.

# L'option d'id3v2 qui permet de modifier le genre d'un fichier est : "-g"

# vérification de la présence d'un argument
if [ $# -lt 1 ]; then
    # s'il n'y a pas d'argument, on prévient l'utilisateur
    echo "Pas d'archives à modifier !"
else
    # sinon on décompresse les archives dans un répertoire de destination
    destdir="music-uncompress"
    mkdir -p $destdir

    list_ar=`ls $1 | grep .tgz`
    for i in $list_ar
    do
	tar xzvf $1/$i -C $destdir
    done

    # puis on récupère la liste des fichiers .mp3
    # liste des répertoires contenant les fichiers
    list_dir=`ls $destdir | grep /`

    # pour chaque répertoire
    for dir in $list_dir
    do
	list_files=`ls $destdir/$dir | grep .mp3`
	# pour chaque fichier .mp3
	for file in $list_files
	do
	    # pour chaque fichier, on modifie le genre (qui est le nom du dossier)
	    # on récupère le numéro du genre
	    num="`id3v2 -L | grep \"$dir\" | cut -d : -f 1`"
	    res=`id3v2 $destdir/$dir/$file -g $num`
	    if [ res -neq 0 ]; then
		echo "Erreur."
	    else
		echo "Fichier modifié : $file."
	    fi
	done
    done

    # on recompresse l'archive
    tar czvf music-new.tgz $destdir
fi
