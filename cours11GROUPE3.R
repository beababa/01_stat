# ouverture et filtre sur le code insee
getwd()
base <- read.csv("data/devoirMaison/base.csv", 
                 fileEncoding = "UTF-8", dec =",")
extraction <-  base [ base$INSEE_COM == '93010',]
table(extraction$bureau)
# il y a un doublon sur le bureau 7
# pour le supprimmer on va utiliser la cmd "duplicated"
doublon <- extraction [duplicated(extraction$bureau),]
extraction <- extraction [!duplicated(extraction$bureau),]
extraction [,1:4]
# pour regarder les 3 premières colonnes 
# la donnée apparaît propre
str(extraction)
# léger pb sur la décimale
head(extraction$Valeur.fonciere)
head(extraction$men_pauv)
head(extraction$X..Abs.Ins)
# la base sera corrigé ce soir....
# ROWNAMES = nom de lg
rownames(extraction) <- bureau
bureau <- substring(extraction$bureau,7,9)
# objectif : faire un joli graphique 
#avec 2 bureaux et pl.variables
graph <- extraction [c(1:3),c(119,126,133,112)]

names(extraction)
head(graph)
matrice <- as.matrix(graph)
barplot(matrice.cr, beside = TRUE)
str(graph)
# échelle
matrice.cr <- scale(matrice)
