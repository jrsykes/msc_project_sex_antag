
#Review the distribution of expression values from each library

varroa_destructor_expression<-read.table("varroa_destructor_TPM_table.txt", head=T)
amblyomma_americanum_expression<-read.table("amblyomma_americanum_TPM_table.txt", head=T)
tropilaelaps_mercedesae_expression<-read.table("tropilaelaps_mercedesae_TPM_table.txt", head=T)
rhizoglyphus_robini_expression<-read.table("rhizoglyphus_robini_TPM_table.txt", head=T)
tetranychus_urticae_expression<-read.table("tetranychus_urticae_TPM_table.txt", head=T)
dendroctonus_ponderosae_expression<-read.table("dendroctonus_ponderosae_TPM_table.txt", head=T)
mayetiola_destructor_expression<-read.table("mayetiola_destructor_TPM_table.txt", head=T)
teleopsis_dalmanni_expression<-read.table("teleopsis_dalmanni_TPM_table.txt", head=T)
phlebotomus_perniciosus_expression<-read.table("phlebotomus_perniciosus_TPM_table.txt", head=T)
lygus_hesperus_expression<-read.table("lygus_hesperus_TPM_table.txt", head=T)
athalia_rosae_expression<-read.table("athalia_rosae_TPM_table.txt", head=T)
ceratosolen_solmsi_expression<-read.table("ceratosolen_solmsi_TPM_table.txt", head=T)
nasonia_giraulti_expression<-read.table("nasonia_giraulti_TPM_table.txt", head=T)

planococcus_citric_expression<-read.table("planococcus_citric_TPM_table.txt", head=T)
planococcus_ficus_expression<-read.table("planococcus_ficus_TPM_table.txt", head=T)
agrilus_planipennis_expression<-read.table("agrilus_planipennis_TPM_table.txt", head=T)
leptinotarsa_decemlineata_expression<-read.table("leptinotarsa_decemlineata_TPM_table.txt", head=T)
pachypsylla_venusta_expression<-read.table("pachypsylla_venusta_TPM_table.txt", head=T)
bemisia_tabaci_expression<-read.table("bemisia_tabaci_TPM_table.txt", head=T)
frankliniella_occidentalis_expression<-read.table("frankliniella_occidentalis_TPM_table.txt", head=T)


varroa_destructor_expression_values<- (varroa_destructor_expression[,c(1,2,3)])
amblyomma_americanum_expression_values<- (amblyomma_americanum_expression[,c(1,2,3,4,5,6)])
tropilaelaps_mercedesae_expression_values<- (tropilaelaps_mercedesae_expression[,c(1,2,3,4)])
rhizoglyphus_robini_expression_values<- (rhizoglyphus_robini_expression[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)])
tetranychus_urticae_expression_values<- (tetranychus_urticae_expression[,c(1,2,3,4,5,6,7,8,9,10,11,12)])
dendroctonus_ponderosae_expression_values<- (dendroctonus_ponderosae_expression[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)])
mayetiola_destructor_expression_values<- (mayetiola_destructor_expression[,c(1,2,3,4,5,6)])
teleopsis_dalmanni_expression_values<- (teleopsis_dalmanni_expression[,c(1,2,3,4,5,6,7,8)])
phlebotomus_perniciosus_expression_values<- (phlebotomus_perniciosus_expression[,c(1,2,3,4,5,6)])
lygus_hesperus_expression_values<- (lygus_hesperus_expression[,c(1,2,3,4)])
athalia_rosae_expression_values<- (athalia_rosae_expression[,c(1,2,3,4)])
ceratosolen_solmsi_expression_values<- (ceratosolen_solmsi_expression[,c(1,2,3,4,5)])
nasonia_giraulti_expression_values<- (nasonia_giraulti_expression[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18)])

planococcus_citric_expression_values<- (planococcus_citric_expression[,c(1,2)])
planococcus_ficus_expression_values<- (planococcus_ficus_expression[,c(1,2)])
agrilus_planipennis_expression_values<- (agrilus_planipennis_expression[,c(1,2)])
leptinotarsa_decemlineata_expression_values<- (leptinotarsa_decemlineata_expression[,c(1,2)])
pachypsylla_venusta_expression_values<- (pachypsylla_venusta_expression[,c(1,2)])
bemisia_tabaci_expression_values<- (bemisia_tabaci_expression[,c(2,3)])
frankliniella_occidentalis_expression_values<- (frankliniella_occidentalis_expression[,c(1,2)])


#### Mean male
varroa_destructor_expression_values$MeanM<-(varroa_destructor_expression_values$SRR5377265)/1
amblyomma_americanum_expression_values$MeanM<-(amblyomma_americanum_expression_values$SRR4416255+amblyomma_americanum_expression_values$SRR4416253+amblyomma_americanum_expression_values$SRR4416251)/3
tropilaelaps_mercedesae_expression_values$MeanM<-(tropilaelaps_mercedesae_expression_values$SRR4294669+tropilaelaps_mercedesae_expression_values$SRR4294668)/2
rhizoglyphus_robini_expression_values$MeanM<-(rhizoglyphus_robini_expression_values$SRR3934339+rhizoglyphus_robini_expression_values$SRR3934326+rhizoglyphus_robini_expression_values$SRR3934327+rhizoglyphus_robini_expression_values$SRR3934328+rhizoglyphus_robini_expression_values$SRR3934329+rhizoglyphus_robini_expression_values$SRR3934330+rhizoglyphus_robini_expression_values$SRR3934331+rhizoglyphus_robini_expression_values$SRR3934338)/8
tetranychus_urticae_expression_values$MeanM<-(tetranychus_urticae_expression_values$SRR4043741+tetranychus_urticae_expression_values$SRR4043740+tetranychus_urticae_expression_values$SRR4043739+tetranychus_urticae_expression_values$SRR4043738)/4
dendroctonus_ponderosae_expression_values$MeanM<-(dendroctonus_ponderosae_expression_values$SRR867432+dendroctonus_ponderosae_expression_values$SRR867441+dendroctonus_ponderosae_expression_values$SRR867433+dendroctonus_ponderosae_expression_values$SRR867434+dendroctonus_ponderosae_expression_values$SRR867436+dendroctonus_ponderosae_expression_values$SRR867438+dendroctonus_ponderosae_expression_values$SRR867439+dendroctonus_ponderosae_expression_values$SRR867440)/8
mayetiola_destructor_expression_values$MeanM<-(mayetiola_destructor_expression_values$SRR1738673+mayetiola_destructor_expression_values$SRR1239358+mayetiola_destructor_expression_values$SRR1239355)/3
teleopsis_dalmanni_expression_values$MeanM<-(teleopsis_dalmanni_expression_values$SRR1184541+teleopsis_dalmanni_expression_values$SRR1738676+teleopsis_dalmanni_expression_values$SRR1184537+teleopsis_dalmanni_expression_values$SRR1184533)/4
phlebotomus_perniciosus_expression_values$MeanM<-(phlebotomus_perniciosus_expression_values$SRR2075602+phlebotomus_perniciosus_expression_values$SRR2075601+phlebotomus_perniciosus_expression_values$SRR2075601)/3
lygus_hesperus_expression_values$MeanM<-(lygus_hesperus_expression_values$SRR925995+lygus_hesperus_expression_values$SRR925994)/2
athalia_rosae_expression_values$MeanM<-(athalia_rosae_expression_values$SRR1842142+athalia_rosae_expression_values$SRR1842141)/2
ceratosolen_solmsi_expression_values$MeanM<-(ceratosolen_solmsi_expression_values$SRR974928+ceratosolen_solmsi_expression_values$SRR974926)/2
nasonia_giraulti_expression_values$MeanM<-(nasonia_giraulti_expression_values$SRR1566033+nasonia_giraulti_expression_values$SRR1566032+nasonia_giraulti_expression_values$SRR1566031+nasonia_giraulti_expression_values$SRR1566027+nasonia_giraulti_expression_values$SRR1566026+nasonia_giraulti_expression_values$SRR1566025)/6

### Mean feamle
varroa_destructor_expression_values$MeanF<-(varroa_destructor_expression_values$SRR5377267+varroa_destructor_expression_values$SRR5377268)/2
amblyomma_americanum_expression_values$MeanF<-(amblyomma_americanum_expression_values$SRR4416254+amblyomma_americanum_expression_values$SRR4416252+amblyomma_americanum_expression_values$SRR4416250)/3
tropilaelaps_mercedesae_expression_values$MeanF<-(tropilaelaps_mercedesae_expression_values$SRR4294671+tropilaelaps_mercedesae_expression_values$SRR4294670)/2
rhizoglyphus_robini_expression_values$MeanF<-(rhizoglyphus_robini_expression_values$SRR3934324+rhizoglyphus_robini_expression_values$SRR3934325+rhizoglyphus_robini_expression_values$SRR3934332+rhizoglyphus_robini_expression_values$SRR3934333+rhizoglyphus_robini_expression_values$SRR3934334+rhizoglyphus_robini_expression_values$SRR3934335+rhizoglyphus_robini_expression_values$SRR3934336+rhizoglyphus_robini_expression_values$SRR3934337)/8
tetranychus_urticae_expression_values$MeanF<-(tetranychus_urticae_expression_values$SRR4043745+tetranychus_urticae_expression_values$SRR4043744+tetranychus_urticae_expression_values$SRR4043743+tetranychus_urticae_expression_values$SRR4043742+tetranychus_urticae_expression_values$SRR1582619+tetranychus_urticae_expression_values$SRR1582618+tetranychus_urticae_expression_values$SRR1582616+tetranychus_urticae_expression_values$SRR1582617)/8
dendroctonus_ponderosae_expression_values$MeanF<-(dendroctonus_ponderosae_expression_values$SRR867160+dendroctonus_ponderosae_expression_values$SRR867161+dendroctonus_ponderosae_expression_values$SRR867162+dendroctonus_ponderosae_expression_values$SRR867179+dendroctonus_ponderosae_expression_values$SRR867176+dendroctonus_ponderosae_expression_values$SRR867183+dendroctonus_ponderosae_expression_values$SRR867186+dendroctonus_ponderosae_expression_values$SRR867188)/8
mayetiola_destructor_expression_values$MeanF<-(mayetiola_destructor_expression_values$SRR1738672+mayetiola_destructor_expression_values$SRR1239356+mayetiola_destructor_expression_values$SRR1239354)/3
teleopsis_dalmanni_expression_values$MeanF<-(teleopsis_dalmanni_expression_values$SRR1738677+teleopsis_dalmanni_expression_values$SRR1184536+teleopsis_dalmanni_expression_values$SRR1184535+teleopsis_dalmanni_expression_values$SRR1184534)/4
phlebotomus_perniciosus_expression_values$MeanF<-(phlebotomus_perniciosus_expression_values$SRR2075600+phlebotomus_perniciosus_expression_values$SRR2075599+phlebotomus_perniciosus_expression_values$SRR2074672)/3
lygus_hesperus_expression_values$MeanF<-(lygus_hesperus_expression_values$SRR925993+lygus_hesperus_expression_values$SRR925992)/2
athalia_rosae_expression_values$MeanF<-(athalia_rosae_expression_values$SRR1842140+athalia_rosae_expression_values$SRR1842139)/2
ceratosolen_solmsi_expression_values$MeanF<-(ceratosolen_solmsi_expression_values$SRR974925+ceratosolen_solmsi_expression_values$SRR974929+ceratosolen_solmsi_expression_values$SRR974927)/3
nasonia_giraulti_expression_values$MeanF<-(nasonia_giraulti_expression_values$SRR2773799+nasonia_giraulti_expression_values$SRR2773798+nasonia_giraulti_expression_values$SRR2773797+nasonia_giraulti_expression_values$SRR2773796+nasonia_giraulti_expression_values$SRR2773795+nasonia_giraulti_expression_values$SRR2773794+nasonia_giraulti_expression_values$SRR1566030+nasonia_giraulti_expression_values$SRR1566029+nasonia_giraulti_expression_values$SRR1566028+nasonia_giraulti_expression_values$SRR1566024+nasonia_giraulti_expression_values$SRR1566023+nasonia_giraulti_expression_values$SRR1566022)/12

################################################


varroa_destructor_expression_values<-(subset(varroa_destructor_expression_values, MeanM>0 & MeanF>0))
amblyomma_americanum_expression_values<-(subset(amblyomma_americanum_expression_values, MeanM>0 & MeanF>0))
tropilaelaps_mercedesae_expression_values<-(subset(tropilaelaps_mercedesae_expression_values, MeanM>0 & MeanF>0))
rhizoglyphus_robini_expression_values<-(subset(rhizoglyphus_robini_expression_values, MeanM>0 & MeanF>0))
tetranychus_urticae_expression_values<-(subset(tetranychus_urticae_expression_values, MeanM>0 & MeanF>0))
dendroctonus_ponderosae_expression_values<-(subset(dendroctonus_ponderosae_expression_values, MeanM>0 & MeanF>0))
mayetiola_destructor_expression_values<-(subset(mayetiola_destructor_expression_values, MeanM>0 & MeanF>0))
teleopsis_dalmanni_expression_values<-(subset(teleopsis_dalmanni_expression_values, MeanM>0 & MeanF>0))
phlebotomus_perniciosus_expression_values<-(subset(phlebotomus_perniciosus_expression_values, MeanM>0 & MeanF>0))
lygus_hesperus_expression_values<-(subset(lygus_hesperus_expression_values, MeanM>0 & MeanF>0))
athalia_rosae_expression_values<-(subset(athalia_rosae_expression_values, MeanM>0 & MeanF>0))
ceratosolen_solmsi_expression_values<-(subset(ceratosolen_solmsi_expression_values, MeanM>0 & MeanF>0))
nasonia_giraulti_expression_values<-(subset(nasonia_giraulti_expression_values, MeanM>0 & MeanF>0))
varroa_destructor_expression_values<-(subset(varroa_destructor_expression_values, MeanM>0 & MeanF>0))
amblyomma_americanum_expression_values<-(subset(amblyomma_americanum_expression_values, MeanM>0 & MeanF>0))
tropilaelaps_mercedesae_expression_values<-(subset(tropilaelaps_mercedesae_expression_values, MeanM>0 & MeanF>0))
rhizoglyphus_robini_expression_values<-(subset(rhizoglyphus_robini_expression_values, MeanM>0 & MeanF>0))
tetranychus_urticae_expression_values<-(subset(tetranychus_urticae_expression_values, MeanM>0 & MeanF>0))
dendroctonus_ponderosae_expression_values<-(subset(dendroctonus_ponderosae_expression_values, MeanM>0 & MeanF>0))
mayetiola_destructor_expression_values<-(subset(mayetiola_destructor_expression_values, MeanM>0 & MeanF>0))
teleopsis_dalmanni_expression_values<-(subset(teleopsis_dalmanni_expression_values, MeanM>0 & MeanF>0))
phlebotomus_perniciosus_expression_values<-(subset(phlebotomus_perniciosus_expression_values, MeanM>0 & MeanF>0))
lygus_hesperus_expression_values<-(subset(lygus_hesperus_expression_values, MeanM>0 & MeanF>0))
athalia_rosae_expression_values<-(subset(athalia_rosae_expression_values, MeanM>0 & MeanF>0))
ceratosolen_solmsi_expression_values<-(subset(ceratosolen_solmsi_expression_values, MeanM>0 & MeanF>0))
nasonia_giraulti_expression_values<-(subset(nasonia_giraulti_expression_values, MeanM>0 & MeanF>0))


planococcus_citric_expression_values<-(subset(planococcus_citric_expression_values, SRR2>0 & SRR1>0))
planococcus_ficus_expression_values<-(subset(planococcus_ficus_expression_values, SRR4>0 & SRR3>0))
agrilus_planipennis_expression_values<-(subset(agrilus_planipennis_expression_values, SRR1791269>0 & SRR1791267>0))
leptinotarsa_decemlineata_expression_values<-(subset(leptinotarsa_decemlineata_expression_values, SRR1827566>0 & SRR1827565>0))
pachypsylla_venusta_expression_values<-(subset(pachypsylla_venusta_expression_values, SRR1824580>0 & SRR1824579>0))
bemisia_tabaci_expression_values<-(subset(bemisia_tabaci_expression_values, SRR5086010>0 & SRR5086009>0))
frankliniella_occidentalis_expression_values<-(subset(frankliniella_occidentalis_expression_values, SRR1826954>0 & SRR1826956>0))


### plot mean sex biased expression
library(ggplot2)
library(grid)
library(cowplot)

varroa_destructor_expression_values$col<-"grey"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 2.052566*varroa_destructor_expression_values$MeanF,"col"] <- "steelblue"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 2.052566*varroa_destructor_expression_values$MeanM,"col"] <- "steelblue"


p1<-ggplot(varroa_destructor_expression_values, aes(x = (log(varroa_destructor_expression_values$MeanM)), y = (log(varroa_destructor_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005)+ ggtitle("Varroa destructor") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.65", size=7, parse = TRUE)

amblyomma_americanum_expression_values$col<-"grey"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 3.866191*amblyomma_americanum_expression_values$MeanF,"col"] <- "steelblue"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 3.866191*amblyomma_americanum_expression_values$MeanM,"col"] <- "steelblue"


p2<-ggplot(amblyomma_americanum_expression_values, aes(x = (log(amblyomma_americanum_expression_values$MeanM)), y = (log(amblyomma_americanum_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Amblyomma americanum") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.44", size=7, parse = TRUE)


tropilaelaps_mercedesae_expression_values$col<-"grey"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 2.597303*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "steelblue"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 2.597303*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "steelblue"


p3<-ggplot(tropilaelaps_mercedesae_expression_values, aes(x = (log(tropilaelaps_mercedesae_expression_values$MeanM)), y = (log(tropilaelaps_mercedesae_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Tropilaelaps mercedesae") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.67", size=7, parse = TRUE)

rhizoglyphus_robini_expression_values$col<-"grey"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 3.653672*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "steelblue"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 3.653672*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "steelblue"


p4<-ggplot(rhizoglyphus_robini_expression_values, aes(x = (log(rhizoglyphus_robini_expression_values$MeanM)), y = (log(rhizoglyphus_robini_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Rhizoglyphus robini") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.52", size=7, parse = TRUE)

tetranychus_urticae_expression_values$col<-"grey"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 4.593985*tetranychus_urticae_expression_values$MeanF,"col"] <- "steelblue"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 4.593985*tetranychus_urticae_expression_values$MeanM,"col"] <- "steelblue"


p5<-ggplot(tetranychus_urticae_expression_values, aes(x = (log(tetranychus_urticae_expression_values$MeanM)), y = (log(tetranychus_urticae_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Tetranychus urticae") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.56", size=7, parse = TRUE)

dendroctonus_ponderosae_expression_values$col<-"grey"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 1.973836*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "steelblue"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 1.973836*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "steelblue"


p6<-ggplot(dendroctonus_ponderosae_expression_values, aes(x = (log(dendroctonus_ponderosae_expression_values$MeanM)), y = (log(dendroctonus_ponderosae_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Dendroctonus ponderosae") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.69", size=7, parse = TRUE)

mayetiola_destructor_expression_values$col<-"grey"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 2.141466*mayetiola_destructor_expression_values$MeanF,"col"] <- "steelblue"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 2.141466*mayetiola_destructor_expression_values$MeanM,"col"] <- "steelblue"


p7<-ggplot(mayetiola_destructor_expression_values, aes(x = (log(mayetiola_destructor_expression_values$MeanM)), y = (log(mayetiola_destructor_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Mayetiola destructor") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.76", size=7, parse = TRUE)

teleopsis_dalmanni_expression_values$col<-"grey"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 3.021215*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "steelblue"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 3.021215*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "steelblue"


p8<-ggplot(teleopsis_dalmanni_expression_values, aes(x = (log(teleopsis_dalmanni_expression_values$MeanM)), y = (log(teleopsis_dalmanni_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Teleopsis dalmanni") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.59", size=7, parse = TRUE)

phlebotomus_perniciosus_expression_values$col<-"grey"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 0.7350429*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "steelblue"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 0.7350429*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "steelblue"


p9<-ggplot(phlebotomus_perniciosus_expression_values, aes(x = (log(phlebotomus_perniciosus_expression_values$MeanM)), y = (log(phlebotomus_perniciosus_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Phlebotomus perniciosus") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.87", size=7, parse = TRUE)

lygus_hesperus_expression_values$col<-"grey"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 0.6699066*lygus_hesperus_expression_values$MeanF,"col"] <- "steelblue"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 0.6699066*lygus_hesperus_expression_values$MeanM,"col"] <- "steelblue"


p10<-ggplot(lygus_hesperus_expression_values, aes(x = (log(lygus_hesperus_expression_values$MeanM)), y = (log(lygus_hesperus_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Lygus hesperus") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.88", size=7, parse = TRUE)

athalia_rosae_expression_values$col<-"grey"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 1.937095*athalia_rosae_expression_values$MeanF,"col"] <- "steelblue"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 1.937095*athalia_rosae_expression_values$MeanM,"col"] <- "steelblue"


p11<-ggplot(athalia_rosae_expression_values, aes(x = (log(athalia_rosae_expression_values$MeanM)), y = (log(athalia_rosae_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
xlab("Log male expression") + ylab("Log female expression") + scale_color_identity() + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Athalia rosae") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.75", size=7, parse = TRUE)

ceratosolen_solmsi_expression_values$col<-"grey"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 2.363925*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "steelblue"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 2.363925*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "steelblue"


p12<-ggplot(ceratosolen_solmsi_expression_values, aes(x = (log(ceratosolen_solmsi_expression_values$MeanM)), y = (log(ceratosolen_solmsi_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Ceratosolen solmsi") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.7", size=7, parse = TRUE)

nasonia_giraulti_expression_values$col<-"grey"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 2.207076*nasonia_giraulti_expression_values$MeanF,"col"] <- "steelblue"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 2.207076*nasonia_giraulti_expression_values$MeanM,"col"] <- "steelblue"


p13<-ggplot(nasonia_giraulti_expression_values, aes(x = (log(nasonia_giraulti_expression_values$MeanM)), y = (log(nasonia_giraulti_expression_values$MeanF)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Nasonia giraulti") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.23", size=7, parse = TRUE)


#^^^^ SLEUTH ^^^^^^ #

### gfold ###


planococcus_citric_expression_values$col<-"grey"
planococcus_citric_expression_values[(planococcus_citric_expression_values$SRR2) & planococcus_citric_expression_values$SRR2 > 4.908228*planococcus_citric_expression_values$SRR1,"col"] <- "steelblue"
planococcus_citric_expression_values[(planococcus_citric_expression_values$SRR1) & planococcus_citric_expression_values$SRR1 > 4.908228*planococcus_citric_expression_values$SRR2,"col"] <- "steelblue"


p14<-ggplot(planococcus_citric_expression_values, aes(x = (log(planococcus_citric_expression_values$SRR2)), y = (log(planococcus_citric_expression_values$SRR1)), color = col)) + geom_point(size=0.7) + 
xlab("Log male expression") + ylab("Log female expression") + scale_color_identity() + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Planococcus citri") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.46", size=7, parse = TRUE)


planococcus_ficus_expression_values$col<-"grey"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$SRR4) & planococcus_ficus_expression_values$SRR4 > 7.377608*planococcus_ficus_expression_values$SRR3,"col"] <- "steelblue"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$SRR3) & planococcus_ficus_expression_values$SRR3 > 7.377608*planococcus_ficus_expression_values$SRR4,"col"] <- "steelblue"

p15<-ggplot(planococcus_ficus_expression_values, aes(x = (log(planococcus_ficus_expression_values$SRR4)), y = (log(planococcus_ficus_expression_values$SRR3)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Planococcus ficus") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.19", size=7, parse = TRUE)

agrilus_planipennis_expression_values$col<-"grey"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$SRR1791269) & agrilus_planipennis_expression_values$SRR1791269 > 1.861104*agrilus_planipennis_expression_values$SRR1791267,"col"] <- "steelblue"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$SRR1791267) & agrilus_planipennis_expression_values$SRR1791267 > 1.861104*agrilus_planipennis_expression_values$SRR1791269,"col"] <- "steelblue"

p16<-ggplot(agrilus_planipennis_expression_values, aes(x = (log(agrilus_planipennis_expression_values$SRR1791269)), y = (log(agrilus_planipennis_expression_values$SRR1791267)), color = col)) + geom_point(size=0.7) + 
xlab("Log male expression") + ylab("Log female expression") + scale_color_identity() + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Agrilus planipennis") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.76", size=7, parse = TRUE)


leptinotarsa_decemlineata_expression_values$col<-"grey"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$SRR1827566) & leptinotarsa_decemlineata_expression_values$SRR1827566 > 2.094005*leptinotarsa_decemlineata_expression_values$SRR1827565,"col"] <- "steelblue"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$SRR1827565) & leptinotarsa_decemlineata_expression_values$SRR1827565 > 2.094005*leptinotarsa_decemlineata_expression_values$SRR1827566,"col"] <- "steelblue"

p17<-ggplot(leptinotarsa_decemlineata_expression_values, aes(x = (log(leptinotarsa_decemlineata_expression_values$SRR1827566)), y = (log(leptinotarsa_decemlineata_expression_values$SRR1827565)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Leptinotarsa decemlineata") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.65", size=7, parse = TRUE)

pachypsylla_venusta_expression_values$col<-"grey"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$SRR1824580) & pachypsylla_venusta_expression_values$SRR1824580 > 2.180852*pachypsylla_venusta_expression_values$SRR1824579,"col"] <- "steelblue"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$SRR1824579) & pachypsylla_venusta_expression_values$SRR1824579 > 2.180852*pachypsylla_venusta_expression_values$SRR1824580,"col"] <- "steelblue"

p18<-ggplot(pachypsylla_venusta_expression_values, aes(x = (log(pachypsylla_venusta_expression_values$SRR1824580)), y = (log(pachypsylla_venusta_expression_values$SRR1824579)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Pachypsylla venusta") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.63", size=7, parse = TRUE)


bemisia_tabaci_expression_values$col<-"grey"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$SRR5086010) & bemisia_tabaci_expression_values$SRR5086010 > 3.277395*bemisia_tabaci_expression_values$SRR5086009,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$SRR5086009) & bemisia_tabaci_expression_values$SRR5086009 > 3.277395*bemisia_tabaci_expression_values$SRR5086010,"col"] <- "steelblue"

p19<-ggplot(bemisia_tabaci_expression_values, aes(x = (log(bemisia_tabaci_expression_values$SRR5086010)), y = (log(bemisia_tabaci_expression_values$SRR5086009)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Bemisia tabaci") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.54", size=7, parse = TRUE)


frankliniella_occidentalis_expression_values$col<-"grey"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$SRR1826954) & frankliniella_occidentalis_expression_values$SRR1826954 > 2.300444*frankliniella_occidentalis_expression_values$SRR1826956,"col"] <- "steelblue"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$SRR1826956) & frankliniella_occidentalis_expression_values$SRR1826956 > 2.300444*frankliniella_occidentalis_expression_values$SRR1826954,"col"] <- "steelblue"

p20<-ggplot(frankliniella_occidentalis_expression_values, aes(x = (log(frankliniella_occidentalis_expression_values$SRR1826954)), y = (log(frankliniella_occidentalis_expression_values$SRR1826956)), color = col)) + geom_point(size=0.7) + 
scale_color_identity() + xlab("") + ylab("") + 
theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "grey")) +
geom_point(alpha=0.005) + ggtitle("Frankliniella occidentalis") + theme(plot.title = element_text(size=26)) + xlim(-20,10) + ylim(-20,10) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26,face="bold")) + 
annotate("text", x = -15, y = 8, label = "r == 0.65", size=7, parse = TRUE)


png("Diplo_panel_scatter.png", width=1460, height=1460)
plot_grid(p2,p4,p6,p8,p9,p10,p16,p17,p18, labels=c("", ""), ncol = 3, nrow = 3)

dev.off()

png("Haplo_panel_scatter.png", width=1460, height=1460)

plot_grid(p3,p5,p20,p12,p13,p19,p11, labels=c("", ""), ncol = 3, nrow = 3)

dev.off()

png("PGE_panel_scatter.png", width=1460, height=1460)

plot_grid(p1,p7,p14,p15, labels=c("", ""), ncol = 2, nrow = 2)

dev.off()

