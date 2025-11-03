getwd()
nom <- c("beatrice")
nomEtudiant <- c("sophie", "ursule", "zoé")
# un objet et un vecteur
age <- c(10,12,70)
univ <- data.frame(nomEtudiant, age)
mean(univ$age )
#############
####indexation
univ [3,2]
univ
##############ouverture fichier
data <- read.csv("monFichierFavori.csv")
