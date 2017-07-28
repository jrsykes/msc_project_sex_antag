
#Review the distribution of expression values from each library

varroa_destructor_expression<-read.table("varroa_destructor_TPM_table.txt", head=T, sep=" ")
amblyomma_americanum_expression<-read.table("amblyomma_americanum_TPM_table.txt", head=T, sep=" ")
tropilaelaps_mercedesae_expression<-read.table("tropilaelaps_mercedesae_TPM_table.txt", head=T, sep=" ")
rhizoglyphus_robini_expression<-read.table("rhizoglyphus_robini_TPM_table.txt", head=T, sep=" ")
tetranychus_urticae_expression<-read.table("tetranychus_urticae_TPM_table.txt", head=T, sep=" ")
dendroctonus_ponderosae_expression<-read.table("dendroctonus_ponderosae_TPM_table.txt", head=T, sep=" ")
mayetiola_destructor_expression<-read.table("mayetiola_destructor_TPM_table.txt", head=T, sep=" ")
teleopsis_dalmanni_expression<-read.table("teleopsis_dalmanni_TPM_table.txt", head=T, sep=" ")
phlebotomus_perniciosus_expression<-read.table("phlebotomus_perniciosus_TPM_table.txt", head=T, sep=" ")
lygus_hesperus_expression<-read.table("lygus_hesperus_TPM_table.txt", head=T, sep=" ")
athalia_rosae_expression<-read.table("athalia_rosae_TPM_table.txt", head=T, sep=" ")
bemisia_tabaci_expression<-read.table("bemisia_tabaci_TPM_table.txt", head=T, sep=" ")
ceratosolen_solmsi_expression<-read.table("ceratosolen_solmsi_TPM_table.txt", head=T, sep=" ")
nasonia_giraulti_expression<-read.table("nasonia_giraulti_TPM_table.txt", head=T, sep=" ")


varroa_destructor_expression_values<- (varroa_destructor_expression[,c(2,3,4)])
amblyomma_americanum_expression_values<- (amblyomma_americanum_expression[,c(2,3,4,5,6,7)])
tropilaelaps_mercedesae_expression_values<- (tropilaelaps_mercedesae_expression[,c(2,3,4,5)])
rhizoglyphus_robini_expression_values<- (rhizoglyphus_robini_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)])
tetranychus_urticae_expression_values<- (tetranychus_urticae_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13)])
dendroctonus_ponderosae_expression_values<- (dendroctonus_ponderosae_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)])
mayetiola_destructor_expression_values<- (mayetiola_destructor_expression[,c(2,3,4,5,6,7)])
teleopsis_dalmanni_expression_values<- (teleopsis_dalmanni_expression[,c(2,3,4,5,6,7,8,9)])
phlebotomus_perniciosus_expression_values<- (phlebotomus_perniciosus_expression[,c(2,3,4,5,6,7)])
lygus_hesperus_expression_values<- (lygus_hesperus_expression[,c(2,3,4,5)])
athalia_rosae_expression_values<- (athalia_rosae_expression[,c(2,3,4,5)])
bemisia_tabaci_expression_values<- (bemisia_tabaci_expression[,c(2,3)])
ceratosolen_solmsi_expression_values<- (ceratosolen_solmsi_expression[,c(2,3,4,5,6)])
nasonia_giraulti_expression_values<- (nasonia_giraulti_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)])


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
bemisia_tabaci_expression_values$MeanM<-(bemisia_tabaci_expression_values$SRR5086010)
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
bemisia_tabaci_expression_values$MeanF<-(bemisia_tabaci_expression_values$SRR5086009)
ceratosolen_solmsi_expression_values$MeanF<-(ceratosolen_solmsi_expression_values$SRR974925+ceratosolen_solmsi_expression_values$SRR974929+ceratosolen_solmsi_expression_values$SRR974927)/3
nasonia_giraulti_expression_values$MeanF<-(nasonia_giraulti_expression_values$SRR2773799+nasonia_giraulti_expression_values$SRR2773798+nasonia_giraulti_expression_values$SRR2773797+nasonia_giraulti_expression_values$SRR2773796+nasonia_giraulti_expression_values$SRR2773795+nasonia_giraulti_expression_values$SRR2773794+nasonia_giraulti_expression_values$SRR1566030+nasonia_giraulti_expression_values$SRR1566029+nasonia_giraulti_expression_values$SRR1566028+nasonia_giraulti_expression_values$SRR1566024+nasonia_giraulti_expression_values$SRR1566023+nasonia_giraulti_expression_values$SRR1566022)/12



### plot mean sex biased expression
library(ggplot2)
library(grid)

varroa_destructor_expression_values$col<-"grey"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 2*varroa_destructor_expression_values$MeanF,"col"] <- "steelblue"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 2*varroa_destructor_expression_values$MeanM,"col"] <- "steelblue"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 4*varroa_destructor_expression_values$MeanF,"col"] <- "tan1"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 4*varroa_destructor_expression_values$MeanM,"col"] <- "tan1"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 8*varroa_destructor_expression_values$MeanF,"col"] <- "forestgreen"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 8*varroa_destructor_expression_values$MeanM,"col"] <- "forestgreen"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 16*varroa_destructor_expression_values$MeanF,"col"] <- "darkmagenta"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 16*varroa_destructor_expression_values$MeanM,"col"] <- "darkmagenta"


p1<-ggplot(varroa_destructor_expression_values, aes(x = log2(varroa_destructor_expression_values$MeanM), y = log2(varroa_destructor_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Varroa destructor") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

amblyomma_americanum_expression_values$col<-"grey"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 2*amblyomma_americanum_expression_values$MeanF,"col"] <- "steelblue"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 2*amblyomma_americanum_expression_values$MeanM,"col"] <- "steelblue"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 4*amblyomma_americanum_expression_values$MeanF,"col"] <- "tan1"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 4*amblyomma_americanum_expression_values$MeanM,"col"] <- "tan1"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 8*amblyomma_americanum_expression_values$MeanF,"col"] <- "forestgreen"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 8*amblyomma_americanum_expression_values$MeanM,"col"] <- "forestgreen"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 16*amblyomma_americanum_expression_values$MeanF,"col"] <- "darkmagenta"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 16*amblyomma_americanum_expression_values$MeanM,"col"] <- "darkmagenta"


p2<-ggplot(amblyomma_americanum_expression_values, aes(x = log2(amblyomma_americanum_expression_values$MeanM), y = log2(amblyomma_americanum_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Amblyomma americanum") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

tropilaelaps_mercedesae_expression_values$col<-"grey"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 2*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "steelblue"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 2*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "steelblue"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 4*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "tan1"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 4*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "tan1"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 8*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "forestgreen"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 8*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "forestgreen"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 16*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "darkmagenta"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 16*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "darkmagenta"


p3<-ggplot(tropilaelaps_mercedesae_expression_values, aes(x = log2(tropilaelaps_mercedesae_expression_values$MeanM), y = log2(tropilaelaps_mercedesae_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Tropilaelaps mercedesae") + theme(plot.title = element_text(hjust = 0.5)) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

rhizoglyphus_robini_expression_values$col<-"grey"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 2*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "steelblue"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 2*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "steelblue"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 4*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "tan1"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 4*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "tan1"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 8*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "forestgreen"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 8*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "forestgreen"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 16*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "darkmagenta"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 16*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "darkmagenta"


p4<-ggplot(rhizoglyphus_robini_expression_values, aes(x = log2(rhizoglyphus_robini_expression_values$MeanM), y = log2(rhizoglyphus_robini_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Rhizoglyphus robini") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

tetranychus_urticae_expression_values$col<-"grey"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 2*tetranychus_urticae_expression_values$MeanF,"col"] <- "steelblue"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 2*tetranychus_urticae_expression_values$MeanM,"col"] <- "steelblue"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 4*tetranychus_urticae_expression_values$MeanF,"col"] <- "tan1"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 4*tetranychus_urticae_expression_values$MeanM,"col"] <- "tan1"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 8*tetranychus_urticae_expression_values$MeanF,"col"] <- "forestgreen"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 8*tetranychus_urticae_expression_values$MeanM,"col"] <- "forestgreen"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 16*tetranychus_urticae_expression_values$MeanF,"col"] <- "darkmagenta"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 16*tetranychus_urticae_expression_values$MeanM,"col"] <- "darkmagenta"


p5<-ggplot(tetranychus_urticae_expression_values, aes(x = log2(tetranychus_urticae_expression_values$MeanM), y = log2(tetranychus_urticae_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Tetranychus urticae") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

dendroctonus_ponderosae_expression_values$col<-"grey"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 2*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "steelblue"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 2*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "steelblue"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 4*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "tan1"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 4*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "tan1"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 8*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "forestgreen"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 8*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "forestgreen"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 16*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "darkmagenta"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 16*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "darkmagenta"


p6<-ggplot(dendroctonus_ponderosae_expression_values, aes(x = log2(dendroctonus_ponderosae_expression_values$MeanM), y = log2(dendroctonus_ponderosae_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Dendroctonus ponderosae") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

mayetiola_destructor_expression_values$col<-"grey"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 2*mayetiola_destructor_expression_values$MeanF,"col"] <- "steelblue"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 2*mayetiola_destructor_expression_values$MeanM,"col"] <- "steelblue"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 4*mayetiola_destructor_expression_values$MeanF,"col"] <- "tan1"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 4*mayetiola_destructor_expression_values$MeanM,"col"] <- "tan1"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 8*mayetiola_destructor_expression_values$MeanF,"col"] <- "forestgreen"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 8*mayetiola_destructor_expression_values$MeanM,"col"] <- "forestgreen"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 16*mayetiola_destructor_expression_values$MeanF,"col"] <- "darkmagenta"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 16*mayetiola_destructor_expression_values$MeanM,"col"] <- "darkmagenta"


p7<-ggplot(mayetiola_destructor_expression_values, aes(x = log2(mayetiola_destructor_expression_values$MeanM), y = log2(mayetiola_destructor_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Mayetiola destructor") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

teleopsis_dalmanni_expression_values$col<-"grey"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 2*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "steelblue"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 2*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "steelblue"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 4*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "tan1"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 4*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "tan1"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 8*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "forestgreen"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 8*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "forestgreen"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 16*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "darkmagenta"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 16*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "darkmagenta"


p8<-ggplot(teleopsis_dalmanni_expression_values, aes(x = log2(teleopsis_dalmanni_expression_values$MeanM), y = log2(teleopsis_dalmanni_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Teleopsis dalmanni") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

phlebotomus_perniciosus_expression_values$col<-"grey"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 2*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "steelblue"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 2*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "steelblue"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 4*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "tan1"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 4*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "tan1"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 8*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "forestgreen"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 8*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "forestgreen"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 16*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "darkmagenta"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 16*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "darkmagenta"


p9<-ggplot(phlebotomus_perniciosus_expression_values, aes(x = log2(phlebotomus_perniciosus_expression_values$MeanM), y = log2(phlebotomus_perniciosus_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Phlebotomus perniciosus") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("")  + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

lygus_hesperus_expression_values$col<-"grey"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 2*lygus_hesperus_expression_values$MeanF,"col"] <- "steelblue"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 2*lygus_hesperus_expression_values$MeanM,"col"] <- "steelblue"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 4*lygus_hesperus_expression_values$MeanF,"col"] <- "tan1"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 4*lygus_hesperus_expression_values$MeanM,"col"] <- "tan1"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 8*lygus_hesperus_expression_values$MeanF,"col"] <- "forestgreen"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 8*lygus_hesperus_expression_values$MeanM,"col"] <- "forestgreen"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 16*lygus_hesperus_expression_values$MeanF,"col"] <- "darkmagenta"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 16*lygus_hesperus_expression_values$MeanM,"col"] <- "darkmagenta"


p10<-ggplot(lygus_hesperus_expression_values, aes(x = log2(lygus_hesperus_expression_values$MeanM), y = log2(lygus_hesperus_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Lygus hesperus") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

athalia_rosae_expression_values$col<-"grey"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 2*athalia_rosae_expression_values$MeanF,"col"] <- "steelblue"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 2*athalia_rosae_expression_values$MeanM,"col"] <- "steelblue"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 4*athalia_rosae_expression_values$MeanF,"col"] <- "tan1"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 4*athalia_rosae_expression_values$MeanM,"col"] <- "tan1"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 8*athalia_rosae_expression_values$MeanF,"col"] <- "forestgreen"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 8*athalia_rosae_expression_values$MeanM,"col"] <- "forestgreen"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 16*athalia_rosae_expression_values$MeanF,"col"] <- "darkmagenta"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 16*athalia_rosae_expression_values$MeanM,"col"] <- "darkmagenta"


p11<-ggplot(athalia_rosae_expression_values, aes(x = log2(athalia_rosae_expression_values$MeanM), y = log2(athalia_rosae_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlim(-30,20) + ylim(-30,20) + ggtitle("Athalia rosae") + theme(plot.title = element_text(hjust = 0.5)) + scale_color_identity() + xlab("") + ylab("") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

bemisia_tabaci_expression_values$col<-"grey"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 2*bemisia_tabaci_expression_values$MeanF,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 2*bemisia_tabaci_expression_values$MeanM,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 4*bemisia_tabaci_expression_values$MeanF,"col"] <- "tan1"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 4*bemisia_tabaci_expression_values$MeanM,"col"] <- "tan1"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 8*bemisia_tabaci_expression_values$MeanF,"col"] <- "forestgreen"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 8*bemisia_tabaci_expression_values$MeanM,"col"] <- "forestgreen"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 16*bemisia_tabaci_expression_values$MeanF,"col"] <- "darkmagenta"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 16*bemisia_tabaci_expression_values$MeanM,"col"] <- "darkmagenta"


#p12<-ggplot(bemisia_tabaci_expression_values, aes(x = log2(bemisia_tabaci_expression_values$MeanM), y = log2(bemisia_tabaci_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Bemisia tabaci") + theme(plot.title = element_text(hjust = 0.5)) + scale_color_identity() + xlab("") + ylab("") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))
#
#ceratosolen_solmsi_expression_values$col<-"grey"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 2*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "steelblue"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 2*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "steelblue"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 4*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "tan1"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 4*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "tan1"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 8*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "forestgreen"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 8*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "forestgreen"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 16*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "darkmagenta"
#ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 16*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "darkmagenta"


p13<-ggplot(ceratosolen_solmsi_expression_values, aes(x = log2(ceratosolen_solmsi_expression_values$MeanM), y = log2(ceratosolen_solmsi_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlim(-30,20) + ylim(-30,20) + ggtitle("Ceratosolen solmsi") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

nasonia_giraulti_expression_values$col<-"grey"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 2*nasonia_giraulti_expression_values$MeanF,"col"] <- "steelblue"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 2*nasonia_giraulti_expression_values$MeanM,"col"] <- "steelblue"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 4*nasonia_giraulti_expression_values$MeanF,"col"] <- "tan1"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 4*nasonia_giraulti_expression_values$MeanM,"col"] <- "tan1"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 8*nasonia_giraulti_expression_values$MeanF,"col"] <- "forestgreen"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 8*nasonia_giraulti_expression_values$MeanM,"col"] <- "forestgreen"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 16*nasonia_giraulti_expression_values$MeanF,"col"] <- "darkmagenta"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 16*nasonia_giraulti_expression_values$MeanM,"col"] <- "darkmagenta"


p14<-ggplot(nasonia_giraulti_expression_values, aes(x = log2(nasonia_giraulti_expression_values$MeanM), y = log2(nasonia_giraulti_expression_values$MeanF), color = col)) +  geom_point(size=0.3) + xlim(-30,20) + ylim(-30,20) + ggtitle("Nasonia giraulti") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))



#^^^^ SLEUTH ^^^^^^ #

### gfold ###
planococcus_citric_expression<-read.table("frankliniella_occidentalis_RPKM.txt", head=T)
planococcus_ficus_expression<-read.table("planococcus_ficus_RPKM.txt", head=T)
agrilus_planipennis_expression<-read.table("agrilus_planipennis_RPKM.txt", head=T)
leptinotarsa_decemlineata_expression<-read.table("leptinotarsa_decemlineata_RPKM.txt", head=T,)
pachypsylla_venusta_expression<-read.table("pachypsylla_venusta_RPKM.txt", head=T)
bemisia_tabaci_expression<-read.table("bemisia_tabaci_RPKM.txt", head=T)
frankliniella_occidentalis_expression<-read.table("frankliniella_occidentalis_RPKM.txt", head=T)

planococcus_citric_expression_values<- (planococcus_citric_expression[,c(6,7)])
planococcus_ficus_expression_values<- (planococcus_ficus_expression[,c(6,7)])
agrilus_planipennis_expression_values<- (agrilus_planipennis_expression[,c(6,7)])
leptinotarsa_decemlineata_expression_values<- (leptinotarsa_decemlineata_expression[,c(6,7)])
pachypsylla_venusta_expression_values<- (pachypsylla_venusta_expression[,c(6,7)])
bemisia_tabaci_expression_values<- (bemisia_tabaci_expression[,c(6,7)])
frankliniella_occidentalis_expression_values<- (frankliniella_occidentalis_expression[,c(6,7)])




planococcus_citric_expression_values$col<-"grey"
planococcus_citric_expression_values[(planococcus_citric_expression_values$male_RPKM) & planococcus_citric_expression_values$male_RPKM > 2*planococcus_citric_expression_values$female_RPKM,"col"] <- "steelblue"
planococcus_citric_expression_values[(planococcus_citric_expression_values$female_RPKM) & planococcus_citric_expression_values$female_RPKM > 2*planococcus_citric_expression_values$male_RPKM,"col"] <- "steelblue"
planococcus_citric_expression_values[(planococcus_citric_expression_values$male_RPKM) & planococcus_citric_expression_values$male_RPKM > 4*planococcus_citric_expression_values$female_RPKM,"col"] <- "tan1"
planococcus_citric_expression_values[(planococcus_citric_expression_values$female_RPKM) & planococcus_citric_expression_values$female_RPKM > 4*planococcus_citric_expression_values$male_RPKM,"col"] <- "tan1"
planococcus_citric_expression_values[(planococcus_citric_expression_values$male_RPKM) & planococcus_citric_expression_values$male_RPKM > 6*planococcus_citric_expression_values$female_RPKM,"col"] <- "forestgreen"
planococcus_citric_expression_values[(planococcus_citric_expression_values$female_RPKM) & planococcus_citric_expression_values$female_RPKM > 6*planococcus_citric_expression_values$male_RPKM,"col"] <- "forestgreen"
planococcus_citric_expression_values[(planococcus_citric_expression_values$male_RPKM) & planococcus_citric_expression_values$male_RPKM > 8*planococcus_citric_expression_values$female_RPKM,"col"] <- "darkmagenta"
planococcus_citric_expression_values[(planococcus_citric_expression_values$female_RPKM) & planococcus_citric_expression_values$female_RPKM > 8*planococcus_citric_expression_values$male_RPKM,"col"] <- "darkmagenta"


p15<-ggplot(planococcus_citric_expression_values, aes(x = log2(planococcus_citric_expression_values$male_RPKM), y = log2(planococcus_citric_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Planococcus citri") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

planococcus_ficus_expression_values$col<-"grey"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$male_RPKM) & planococcus_ficus_expression_values$male_RPKM > 2*planococcus_ficus_expression_values$female_RPKM,"col"] <- "steelblue"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$female_RPKM) & planococcus_ficus_expression_values$female_RPKM > 2*planococcus_ficus_expression_values$male_RPKM,"col"] <- "steelblue"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$male_RPKM) & planococcus_ficus_expression_values$male_RPKM > 4*planococcus_ficus_expression_values$female_RPKM,"col"] <- "tan1"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$female_RPKM) & planococcus_ficus_expression_values$female_RPKM > 4*planococcus_ficus_expression_values$male_RPKM,"col"] <- "tan1"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$male_RPKM) & planococcus_ficus_expression_values$male_RPKM > 6*planococcus_ficus_expression_values$female_RPKM,"col"] <- "forestgreen"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$female_RPKM) & planococcus_ficus_expression_values$female_RPKM > 6*planococcus_ficus_expression_values$male_RPKM,"col"] <- "forestgreen"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$male_RPKM) & planococcus_ficus_expression_values$male_RPKM > 8*planococcus_ficus_expression_values$female_RPKM,"col"] <- "darkmagenta"
planococcus_ficus_expression_values[(planococcus_ficus_expression_values$female_RPKM) & planococcus_ficus_expression_values$female_RPKM > 8*planococcus_ficus_expression_values$male_RPKM,"col"] <- "darkmagenta"


p16<-ggplot(planococcus_ficus_expression_values, aes(x = log2(planococcus_ficus_expression_values$male_RPKM), y = log2(planococcus_ficus_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Planococcus ficus") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

agrilus_planipennis_expression_values$col<-"grey"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$male_RPKM) & agrilus_planipennis_expression_values$male_RPKM > 2*agrilus_planipennis_expression_values$female_RPKM,"col"] <- "steelblue"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$female_RPKM) & agrilus_planipennis_expression_values$female_RPKM > 2*agrilus_planipennis_expression_values$male_RPKM,"col"] <- "steelblue"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$male_RPKM) & agrilus_planipennis_expression_values$male_RPKM > 4*agrilus_planipennis_expression_values$female_RPKM,"col"] <- "tan1"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$female_RPKM) & agrilus_planipennis_expression_values$female_RPKM > 4*agrilus_planipennis_expression_values$male_RPKM,"col"] <- "tan1"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$male_RPKM) & agrilus_planipennis_expression_values$male_RPKM > 6*agrilus_planipennis_expression_values$female_RPKM,"col"] <- "forestgreen"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$female_RPKM) & agrilus_planipennis_expression_values$female_RPKM > 6*agrilus_planipennis_expression_values$male_RPKM,"col"] <- "forestgreen"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$male_RPKM) & agrilus_planipennis_expression_values$male_RPKM > 8*agrilus_planipennis_expression_values$female_RPKM,"col"] <- "darkmagenta"
agrilus_planipennis_expression_values[(agrilus_planipennis_expression_values$female_RPKM) & agrilus_planipennis_expression_values$female_RPKM > 8*agrilus_planipennis_expression_values$male_RPKM,"col"] <- "darkmagenta"


p17<-ggplot(agrilus_planipennis_expression_values, aes(x = log2(agrilus_planipennis_expression_values$male_RPKM), y = log2(agrilus_planipennis_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Agrilus planipennis") + theme(plot.title = element_text(hjust = 0.5))+ xlab("Log2 Male RPKM") + ylab("Log2 Female RPKM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

leptinotarsa_decemlineata_expression_values$col<-"grey"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$male_RPKM) & leptinotarsa_decemlineata_expression_values$male_RPKM > 2*leptinotarsa_decemlineata_expression_values$female_RPKM,"col"] <- "steelblue"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$female_RPKM) & leptinotarsa_decemlineata_expression_values$female_RPKM > 2*leptinotarsa_decemlineata_expression_values$male_RPKM,"col"] <- "steelblue"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$male_RPKM) & leptinotarsa_decemlineata_expression_values$male_RPKM > 4*leptinotarsa_decemlineata_expression_values$female_RPKM,"col"] <- "tan1"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$female_RPKM) & leptinotarsa_decemlineata_expression_values$female_RPKM > 4*leptinotarsa_decemlineata_expression_values$male_RPKM,"col"] <- "tan1"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$male_RPKM) & leptinotarsa_decemlineata_expression_values$male_RPKM > 6*leptinotarsa_decemlineata_expression_values$female_RPKM,"col"] <- "forestgreen"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$female_RPKM) & leptinotarsa_decemlineata_expression_values$female_RPKM > 6*leptinotarsa_decemlineata_expression_values$male_RPKM,"col"] <- "forestgreen"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$male_RPKM) & leptinotarsa_decemlineata_expression_values$male_RPKM > 8*leptinotarsa_decemlineata_expression_values$female_RPKM,"col"] <- "darkmagenta"
leptinotarsa_decemlineata_expression_values[(leptinotarsa_decemlineata_expression_values$female_RPKM) & leptinotarsa_decemlineata_expression_values$female_RPKM > 8*leptinotarsa_decemlineata_expression_values$male_RPKM,"col"] <- "darkmagenta"


p18<-ggplot(leptinotarsa_decemlineata_expression_values, aes(x = log2(leptinotarsa_decemlineata_expression_values$male_RPKM), y = log2(leptinotarsa_decemlineata_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Leptinotarsa decemlineata") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

pachypsylla_venusta_expression_values$col<-"grey"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$male_RPKM) & pachypsylla_venusta_expression_values$male_RPKM > 2*pachypsylla_venusta_expression_values$female_RPKM,"col"] <- "steelblue"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$female_RPKM) & pachypsylla_venusta_expression_values$female_RPKM > 2*pachypsylla_venusta_expression_values$male_RPKM,"col"] <- "steelblue"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$male_RPKM) & pachypsylla_venusta_expression_values$male_RPKM > 4*pachypsylla_venusta_expression_values$female_RPKM,"col"] <- "tan1"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$female_RPKM) & pachypsylla_venusta_expression_values$female_RPKM > 4*pachypsylla_venusta_expression_values$male_RPKM,"col"] <- "tan1"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$male_RPKM) & pachypsylla_venusta_expression_values$male_RPKM > 6*pachypsylla_venusta_expression_values$female_RPKM,"col"] <- "forestgreen"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$female_RPKM) & pachypsylla_venusta_expression_values$female_RPKM > 6*pachypsylla_venusta_expression_values$male_RPKM,"col"] <- "forestgreen"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$male_RPKM) & pachypsylla_venusta_expression_values$male_RPKM > 8*pachypsylla_venusta_expression_values$female_RPKM,"col"] <- "darkmagenta"
pachypsylla_venusta_expression_values[(pachypsylla_venusta_expression_values$female_RPKM) & pachypsylla_venusta_expression_values$female_RPKM > 8*pachypsylla_venusta_expression_values$male_RPKM,"col"] <- "darkmagenta"


p19<-ggplot(pachypsylla_venusta_expression_values, aes(x = log2(pachypsylla_venusta_expression_values$male_RPKM), y = log2(pachypsylla_venusta_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Pachypsylla venusta") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

bemisia_tabaci_expression_values$col<-"grey"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$male_RPKM) & bemisia_tabaci_expression_values$male_RPKM > 2*bemisia_tabaci_expression_values$female_RPKM,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$female_RPKM) & bemisia_tabaci_expression_values$female_RPKM > 2*bemisia_tabaci_expression_values$male_RPKM,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$male_RPKM) & bemisia_tabaci_expression_values$male_RPKM > 4*bemisia_tabaci_expression_values$female_RPKM,"col"] <- "tan1"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$female_RPKM) & bemisia_tabaci_expression_values$female_RPKM > 4*bemisia_tabaci_expression_values$male_RPKM,"col"] <- "tan1"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$male_RPKM) & bemisia_tabaci_expression_values$male_RPKM > 6*bemisia_tabaci_expression_values$female_RPKM,"col"] <- "forestgreen"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$female_RPKM) & bemisia_tabaci_expression_values$female_RPKM > 6*bemisia_tabaci_expression_values$male_RPKM,"col"] <- "forestgreen"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$male_RPKM) & bemisia_tabaci_expression_values$male_RPKM > 8*bemisia_tabaci_expression_values$female_RPKM,"col"] <- "darkmagenta"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$female_RPKM) & bemisia_tabaci_expression_values$female_RPKM > 8*bemisia_tabaci_expression_values$male_RPKM,"col"] <- "darkmagenta"


p20<-ggplot(bemisia_tabaci_expression_values, aes(x = log2(bemisia_tabaci_expression_values$male_RPKM), y = log2(bemisia_tabaci_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Bemisia tabaci") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

frankliniella_occidentalis_expression_values$col<-"grey"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$male_RPKM) & frankliniella_occidentalis_expression_values$male_RPKM > 2*frankliniella_occidentalis_expression_values$female_RPKM,"col"] <- "steelblue"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$female_RPKM) & frankliniella_occidentalis_expression_values$female_RPKM > 2*frankliniella_occidentalis_expression_values$male_RPKM,"col"] <- "steelblue"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$male_RPKM) & frankliniella_occidentalis_expression_values$male_RPKM > 4*frankliniella_occidentalis_expression_values$female_RPKM,"col"] <- "tan1"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$female_RPKM) & frankliniella_occidentalis_expression_values$female_RPKM > 4*frankliniella_occidentalis_expression_values$male_RPKM,"col"] <- "tan1"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$male_RPKM) & frankliniella_occidentalis_expression_values$male_RPKM > 6*frankliniella_occidentalis_expression_values$female_RPKM,"col"] <- "forestgreen"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$female_RPKM) & frankliniella_occidentalis_expression_values$female_RPKM > 6*frankliniella_occidentalis_expression_values$male_RPKM,"col"] <- "forestgreen"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$male_RPKM) & frankliniella_occidentalis_expression_values$male_RPKM > 8*frankliniella_occidentalis_expression_values$female_RPKM,"col"] <- "darkmagenta"
frankliniella_occidentalis_expression_values[(frankliniella_occidentalis_expression_values$female_RPKM) & frankliniella_occidentalis_expression_values$female_RPKM > 8*frankliniella_occidentalis_expression_values$male_RPKM,"col"] <- "darkmagenta"


p21<-ggplot(frankliniella_occidentalis_expression_values, aes(x = log2(frankliniella_occidentalis_expression_values$male_RPKM), y = log2(frankliniella_occidentalis_expression_values$female_RPKM), color = col)) +  geom_point(size=0.3) + xlim(-10,12) + ylim(-10,12) + ggtitle("Frankliniella occidentalis") + theme(plot.title = element_text(hjust = 0.5)) + xlab("") + ylab("") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)

  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}



pdf("RPKM_Pannel_scatterplot.pdf", width=14, height=14)

multiplot(p18,p19,p13,p14,p20,p21,p15,p16,p17, cols=3)

dev.off()

pdf("TPM_Pannel_scatterplot.pdf", width=14, height=14)

multiplot(p2,p4,p6,p8,p9,p10,p3,p5,p11,p1,p7, cols=4)

dev.off()


