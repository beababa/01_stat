#####################
##########Mon premier script
########################


# lecture du fichier. Quelle remarque faire ?
vf <-  read.csv2("data/93_vfEXAMEN.csv", fileEncoding = "UTF-8")
# extraction de Bondy
vf_Bondy <- vf [ vf$cog == '93010',]
str(vf_Bondy)
# on ne conserve que la valeur foncière
vf_Bondy <- vf_Bondy [, c("Section","Valeur.fonciere")]
# liste des sections
unique(vf_Bondy$Section)
# combien de valeurs foncières par section ?
table(vf_Bondy$Section)
# inégale répartition 


boxplot(vf_Bondy$Valeur.fonciere~vf_Bondy$Section)
# Trop de sections, on va prendre uniquement les sections où il y a beaucoup de données.
ind <- which((table(vf_Bondy$Section) > 63))
sectionSup63 <- names(ind)
vf_BondySup63 <- vf_Bondy [vf_Bondy$Section %in% sectionSup63,]
boxplot(vf_BondySup63$Valeur.fonciere~vf_BondySup63$Section)
# la section P et H  paraîssent des cas à part
vf_BondySup63_sansPH <- vf_BondySup63 [!(vf_BondySup63$Section %in%  c('P','H')),]
boxplot(vf_BondySup63_sansPH$Valeur.fonciere~vf_BondySup63_sansPH$Section)
# avec quelques options pour faire plus joli
# on décide de diviser la valeur foncière par 100 000 afin d'avoir moins de zéros.
vf_BondySup63_sansPH$Valeur.fonciere <- vf_BondySup63_sansPH$Valeur.fonciere / 100000
boxplot(vf_BondySup63_sansPH$Valeur.fonciere~vf_BondySup63_sansPH$Section, xlab ="Section", ylab="montant valeur foncière (centaines de milliers)",
        col=rainbow(8))
# Affichage des moyennes sur les boites à moustache
moyenne <- tapply(vf_BondySup63_sansPH$Valeur.fonciere, vf_BondySup63_sansPH$Section, mean)
points(moyenne, pch = 8,  col="black", cex = 2)