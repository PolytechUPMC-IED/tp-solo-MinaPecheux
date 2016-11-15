# options de compilation
CC = g++
CCFLAGS = -Wall
ID3 = /home/sasl/shared/main3/env/tools
LDLIBS = -lz
CLIBS = -lid3
VERSION = v2-0.1.11
DESTDIR = ~/Informatique/OPI/TP_solo

# fichiers du projet
EXEC = id3v2
SRC = convert.cpp genre.cpp id3v2.cpp list.cpp
OBJ = $(SRC:.cpp=.o)

all: $(EXEC)

# dépendance des .h
genre.o: genre.h
list.o: genre.h frametable.h

# règles de compilation
%.o: %.cpp
	$(CC) -I $(ID3)/include $(CCFLAGS) -DVERSION="\"${VERSION}\"" -c -o $@ $<

# règles d'édition de liens
$(EXEC): $(OBJ)
	$(CC) -L$(ID3)/lib $(CCFLAGS) -o $@ $^ $(CLIBS) $(LDLIBS)

# règle d'installation
install:
	mkdir -p $(DESTDIR)/bin
	cp $(EXEC) $(DESTDIR)/bin
	mkdir -p $(DESTDIR)/man/man1
	nroff -man ../id3v2.1 > $(DESTDIR)/man/man1/id3v2.1

# règles supplémentaires
clean:
	rm -f *.o $(EXEC)
distclean:
	make clean
	rm $(DESTDIR)/bin/id3v2 $(DESTDIR)/man/man1/id3v2.1

# pour modifier la variable d'environnement "LD_LIBRARY_PATH" et conserver les changements
# après la sortie du terminal, on utilise la commande :
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/sasl/shared/main3/env/tools/lib

# pour accèder à l'exécutable depuis n'importe quel dossier, on doit l'ajouter à la variable
# d'environnement "PATH" :
# export PATH=$PATH:~/Informatique/OPI/TP_solo/bin
