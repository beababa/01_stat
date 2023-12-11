# cours 12 groupe 1 -
# Faire un script permettant une 
# ACP sur les données complètes de Bondy pour 10 variables.
########################################################

data <- read.csv("data/baseBondy.csv", fileEncoding = "UTF-8")

# variables
names(data)

# lignes
row.names(data)

# filtrer uniquement les % resultats

ind <- grep ("X..Voix.Ins", names(data))

names(data) [ind]

# autres variables valeur fonciere et date achat
# 1 8:13

filtre <- data [,c( ind, 1,8:13)]
names(filtre)

# etik elections

# on recherche les variables ayant le motif "nom"
ind <- grep("Nom", names(data))

# la 1e lg suffit
data [1,ind]

nom  <- data [1,ind]

# la 1e colonne n'est pas nécessaire
nom <- nom [,-1]

nom

names(filtre)[1:12]  <- nom
names(filtre)

#ACP

filtre

acp <- prcomp(filtre, scale = TRUE)
biplot(acp)


# conversion (à éviter)
data$Valeur.fonciere <- as.numeric(data$Valeur.fonciere)
