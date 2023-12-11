# COURS 12 - groupe 2
# ACP 10 variables
#################

base <- read.csv("data/baseBondy.csv", fileEncoding = "UTF-8")

names(base)

rownames(base)

# on repère les colonnes abstentions 52 et macron 83

# achat période 8 13 + vf 1

grep("Nom", names(base))

grep("Nom", names(base))

ind <- grep("Nom", names(base))

base [1,ind]



# Macron est le 2

filtre <- base [, c(1,52,83,8:13)]

names(filtre)
names(filtre)[c(2,3)] <- c("abstentions", "macron")

acp <- prcomp(filtre, scale. = F)

biplot(acp)

filtre
