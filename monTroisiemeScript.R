getwd()
# working directory
data <- read.csv2("ofgl-base-communes.csv", dec = ".")
names(data)
names (sel) <- c("dpt", "ville","epargne")
# donne les noms des variables
# F1 sur la commande pour avoir l'aide
data <- data [,c("Nom.2024.Commune", 
                 "Agrégat", 
                 "Montant.en...par.habitant")]
sel <- data [,c(6,16,28)]
# sélectionner par nom ou par numéro de colonne
table(sel$dpt)
# Calculer la variance
# Moyenne des écarts à la moyenne
# racine carrée de la variance = écart-type
var(sel$epargne)
# calcul la variance sans la fonction var
mean((sel$epargne-
       mean(sel$epargne))^2)
# au lieu de calculer avec un effectif complet, R utilise un effectif
# moins 1 élément
# ANOVA analyse ordinaire de la variance
