getwd()
data <- read.csv("baseMultivarieSel.csv")
# filtrer sur le 93
data <- data  [data$dpt == 93,]
### utiliser les fonctions univariées sur cette base
moy <- mean(data$personnel)
med <- median(data$personnel)
hist(data$personnel, 
     main = "Distribution des dépenses de personnel",
     xlab = "Montant (en millions)",
     ylab = "Nb de communes")
abline(v = moy, col = 'blue')
abline(v = med, col = 'red')
# multivariés
pairs (data)
data <- data [,-1]
row.names(data) <- data$commune
head(data)
# filtre sur valeurs

data <- data [data$personnel < 80,]
