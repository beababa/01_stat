getwd()
read.csv()
data <- read.csv2("ofgl-base-communes.csv", dec =".")
data$Montant
# boite à moustache
boxplot(data$Montant.en...par.habitant
        ~data$Nom.2024.Département)
# filtre
# enlever toutes les valeurs inférieures à -200
data [data$Montant.en...par.habitant < -200,]
data$Libellé.Budget [data$Montant.en...par.habitant < -200]
# indexation [LG,COL]
# toutes les col dont le montant > -200
# le libelle budget
filtre <- data [data$Montant.en...par.habitant > -200,]
