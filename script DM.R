
#### prep des donn?es
#################

# jointure avec le fichier RPLS
rpls <- read.csv("data/data00.csv", fileEncoding = "UTF-8")
str(rpls)
names(rpls)
data <- read.csv("data/Amaryllis2.csv", na.strings = "",  
                  encoding =  "UTF-8", skip = 3 , dec = ",")

str(data)
names (data) <-  c("Code", "LIB",  "mono", "enf", "Dipl", "voit")
write.csv(data, "data/Amaryllis.csv", fileEncoding = "UTF-8", row.names = F)


                  
# jointure avec les deux fichiers avec le code INSEE
# enlever jointure <- merge (rpls, data, by = "Code")
# On a X communes, il en manque Y...
# On sauvegarde la donnée
# enlever write.csv(jointure, "data/base.csv", fileEncoding = "UTF-8")

# formatage pour l'analyse
data <- read.csv("data/Amaryllis.csv", fileEncoding = "UTF-8")
str(data)
names(data)
rownames(data) <- data [,1]
data <- data [,c(3:6)]

pairs(data)



##################################################################

summary(data)
data
# Etude de la donn?e, valeurs manquantes, aberrantes etc...
which(row.names(data) == 31555)
data <- data [-42,]

# ...puis centrer - r?duire
data_cr <- scale (data)
pairs(data_cr)

write.csv(data_cr, "data/base_cr", fileEncoding = "UTF-8")

# ACP
#####################
acp <- prcomp(data_cr)
# par d?faut direction n?gative on inverse

# On joue sur les couleurs pour afficher, et les xlim / ylim pour zoomer
biplot(acp, col = c("blue", "red"), scale = 0, 
       xlim = c(-3, 3), 
       ylim = c(-3,3))



# Classification
######################
# Centrage et r?duction
data.cr <- scale(data, center = T, scale = T)
# matrice des distances entre les individus
data.d <- dist(data.cr)
# classification
cah <- hclust(data.d)
# dendogramme
plot(cah)
# mat?rialisation des groupes
rect.hclust(cah, k = 6)
# d?coupage
groupes.cah <- cutree(cah, k = 6)
liste <- sort(groupes.cah)
# mat?rialiser les groupes par couleur.
acp <- princomp(data.cr, cor = T, scores = T)
par(bg = "white", mar = c(1,1,1,1))
plot(acp$scores[,1],acp$scores[,2], type = "p")
text(acp$scores[,1],acp$scores[,2],col=c(topo.colors(6))[groupes.cah],cex
     =1,labels=rownames(data))

