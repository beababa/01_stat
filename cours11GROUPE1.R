# cours 11 - précisions devoir maison
base <- read.csv("data/devoirMaison/base.csv", dec =".", 
                 fileEncoding = "UTF-8" )
getwd()
str(base)
head(base$INSEE_COM)
dm <- base [ base$INSEE_COM == '93010',]
str(dm)
dm$bureau
# extraction des 3 premières colonnes
dm1 <- dm [, c(1:3)]
str(dm1)
# la valeur foncière indique la richesse d'un bv
# rownames (explication)##########
##################################
dm1$bureau1  <- substring(dm1$bureau,7,9)
nbBureaux <- unique(dm$bureau1)
# 29 bureaux sur Bondy - il en manque 2
dm1 <- dm [!duplicated(dm$bureau),]
dm1
dm1$bureau1
rownames(dm1) <- dm1$bureau1
# supprimer les NA
dm <- na.omit(dm)
names(dm1)
# supprimer les colonnes des bureaux 1 et 4
dm1 <- dm1 [,-c(1,4)]
str(dm1)
png("premierHistogramme.png")
hist(dm$Voix)
dev.off()
str(dm$Valeur.fonciere)
# faire un boxplot
str(dm1)
dm1 <- dm1 [,-1]
# attention pb du séparateur décimal, c'est un point pour les vf
# à corriger sur la base
matrice <- as.matrix(dm1)
boxplot(matrice)
matrice






