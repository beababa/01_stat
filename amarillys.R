
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

