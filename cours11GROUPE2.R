# script cours 11 - groupe 2
###########################
# ATTENTION ce script suit la logique du cours !
############################################
getwd()
base <- read.csv("data/devoirMaison/base.csv", 
                 fileEncoding = "UTF-8")
base <- read.csv("data/devoirMaison/base.csv", 
                 fileEncoding = "UTF-8", dec = ".")
filtre <- base [base$INSEE_COM == '93010',]
# J'ai perdu un bureau de vote - c'est le 11, en regardant
# la carte, je vois qu'il est trop petit
# à comparer avec le fichier des élections 2022 vu au cours 10
str(base)
names(filtre)
str(filtre$Valeur.fonciere)
str(filtre$X..Abs.Ins)
# à revoir le séparateur décimal doit être le même pour tout
# le fichier
rownames(filtre)
# affichage de toutes les lg avec 
# uniquement les 2 premières colonnes
head(filtre)[,1:3]
# extrait les caractères 6 au car 8
bureau <- substring(filtre$bureau,7,8)
# je les met dans un vecteur 'bureau'
rownames(filtre) <- bureau
# pb : il y a deux bureaux 7
filtre <- filtre [!duplicated(filtre$bureau),]
# filtre sur 2 colonnes
filtre2col <- filtre [, c("Valeur.fonciere", 
                                  "Surface.reelle.bati")]

str(filtre2col)
# le barplot ne fonctionne pas 
barplot(filtre2col)
# on transforme en matrice
mat <- as.matrix(filtre2col)
barplot(mat)
# comment interpréter ce graphique ?
# On simplifie la matrice, on ne prend que les 5 premières lg
matFiltre <- mat [1:5,]
barplot(matFiltre, beside = TRUE)
# il s'agit de l'histogramme des deux variables côte à côte
# complément (à voir au prochain cours)
matFiltre.cr <- scale(matFiltre)
barplot(matFiltre.cr, beside = T)
# comme on a mis les 2 variables à la même échelle (scale),
# on peut voir les 2 histogrammes
# mettre à l'échelle c'est centrer la série, puis la réduire à
# l'écart type.
# on peut aussi faire
boxplot(matFiltre.cr)
