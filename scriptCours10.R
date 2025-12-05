
####################
#####script cours 10
#####################
data <- read.csv("data/baseMultivarie.csv", row.names = 2 )
head(data)
data <- data [, -1]
summary(data)
cor(data)
pairs(data)
# ACP analyse en composante principale
res <- prcomp(data, scale. = F)
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
