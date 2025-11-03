getwd()
data <- read.csv2("ofgl-base-communes.csv", dec=".")
data$Montant.en...par.habitant
# séparateur décimal . (type anglais), séparateur champs français ;
boxplot(data$Montant.en...par.habitant~data$Code.Insee.2024.Département)
filtreInf200 <- data [data$Montant.en...par.habitant > 200,] 
boxplot(filtreInf200$Montant.en...par.habitant~filtreInf200$Nom.2024.Département)
