# obtenir une matrice numérique pour faire l'ACP
getwd()
data <- read.csv("baseMultivarieSel.csv")
head(data,5)
# filtrer sur le 93
data <- data  [data$dpt == 93,]
row.names(data)
data <- data [,-1]
row.names(data) <- data$commune
# filtrer valeurs, par exemple petites depenses perso
data <- data [data$personnel < 80,]
# script ACP

####################
#####script cours 10
#####################
head(data)
data <- data [, -1]
row.names(data)
summary(data)
cor(data)
pairs(data)

tab <- table(group$id)
barplot(tab)
# ACP analyse en composante principale
res <- prcomp(data, scale. = TRUE)
plot(res)
biplot(res)
# matrice des distances
ddata <- dist(data)
cah <- hclust(ddata)
plot(cah)
#Dendrogramme avec matérialisation des groupes
plot(cah)
rect.hclust(cah,k=4)
groupes.cah <- cutree(cah,k=4)
print(sort(groupes.cah))