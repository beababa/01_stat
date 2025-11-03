getwd()
data <- read.csv2("ofgl-base-communes.csv", dec=".")
data$Montant.en...par.habitant
summary(data$Montant.en...par.habitant)
boxplot(data$Nom.2024.Département~data$Montant.en...par.habitant)

boxplot(data$Montant.en...par.habitant~
          data$Nom.2024.Département)
filtre <- data [data$Montant.en...par.habitant >-200,]
boxplot(filtre$Montant.en...par.habitant~
          filtre$Nom.2024.Département)


data$Montant.en...par.habitant

filtre$
