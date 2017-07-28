library(MCMCglmm)


tree<-read.tree("cladogram.tre")
dat<-read.csv("cor_animal_model.csv")

species<-  makeNodeLabel(tree)

some.species <- c("Varroa_destructor", "Amblyomma_americanum", "Tropilaelaps_mercedesae","Rhizoglyphus_robini","Tetranychus_urticae", "Dendroctonus_ponderosae","Mayetiola_destructor","Teleopsis_dalmanni","Phlebotomus_perniciosus","Lygus_hesperus","Athalia_rosae","Ceratosolen_solmsi","Nasonia_giraulti","Planococcus_citri","Planococcus_ficus","Agrilus_planipennis","Leptinotarsa_decemlineata","Pachypsylla_venusta","Bemisia_tabaci","Frankliniella_occidentalis")


Nphylo <- drop.tip(species, setdiff(species$tip.label, some.species))


INphylo <- inverseA(Nphylo)


m1.MCMC<-MCMCglmm(cor~SexDeterm, random=~species, rcov = ~trait:units, data=dat, ginverse=list(species=INphylo$Ainv), family="gaussian", pl=TRUE,slice=TRUE, nitt=5000000, thin=100, burnin=1000)
