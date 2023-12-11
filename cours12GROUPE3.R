# COURS 12 - groupe 3
# ACP 10 variables
#################

base <- read.csv("data/baseBondy.csv", fileEncoding = "UTF-8", dec = ".")

str(base)

names(base)

rownames(base)

# on rep?re les colonnes  et le pen m?lenchon 97 111

# menage pauvre 17 +  et ages population 32:41 + vf 1

grep("Nom", names(base))


ind <- grep("Nom", names(base))

base [1,ind]



# Melenchon Le pen sont les 4 et 6

filtre <- base [, c(1,17,32:41,97,111)]

names(filtre)
names(filtre)[c(13,14)] <- c("Le Pen", "M?lenchon")

acp <- prcomp(filtre, scale. = T)

biplot(acp)

str(filtre)


