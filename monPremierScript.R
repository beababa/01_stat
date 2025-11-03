nom <- c("Bea", "Ursule", "Zac")
note <- c(10,5,1)
# 2 objets, le premier vecteur caractères 
# le deuxième vecteur numérique
######################################
############indexation################
######################################
nom [1]
note [2]
######################################
###########data.frame#################
######################################
tableau <- data.frame(nom, note)
tableau [1,2]
tableau$nom
tableau$note
sum(tableau$note)
mean(tableau$note)
####################################
#############lire un .csv#########
getwd()
read.csv("data93.csv")







