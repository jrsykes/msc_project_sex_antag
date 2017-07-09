
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

varroa_destructor_expression_values$col<-"grey"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 2*varroa_destructor_expression_values$MeanF,"col"] <- "steelblue"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 2*varroa_destructor_expression_values$MeanM,"col"] <- "steelblue"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 4*varroa_destructor_expression_values$MeanF,"col"] <- "tan1"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 4*varroa_destructor_expression_values$MeanM,"col"] <- "tan1"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 6*varroa_destructor_expression_values$MeanF,"col"] <- "forestgreen"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 6*varroa_destructor_expression_values$MeanM,"col"] <- "forestgreen"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanM) & varroa_destructor_expression_values$MeanM > 8*varroa_destructor_expression_values$MeanF,"col"] <- "darkmagenta"
varroa_destructor_expression_values[(varroa_destructor_expression_values$MeanF) & varroa_destructor_expression_values$MeanF > 8*varroa_destructor_expression_values$MeanM,"col"] <- "darkmagenta"


p1<-ggplot(varroa_destructor_expression_values, aes(x = log2(varroa_destructor_expression_values$MeanM), y = log2(varroa_destructor_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

amblyomma_americanum_expression_values$col<-"grey"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 2*amblyomma_americanum_expression_values$MeanF,"col"] <- "steelblue"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 2*amblyomma_americanum_expression_values$MeanM,"col"] <- "steelblue"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 4*amblyomma_americanum_expression_values$MeanF,"col"] <- "tan1"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 4*amblyomma_americanum_expression_values$MeanM,"col"] <- "tan1"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 6*amblyomma_americanum_expression_values$MeanF,"col"] <- "forestgreen"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 6*amblyomma_americanum_expression_values$MeanM,"col"] <- "forestgreen"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanM) & amblyomma_americanum_expression_values$MeanM > 8*amblyomma_americanum_expression_values$MeanF,"col"] <- "darkmagenta"
amblyomma_americanum_expression_values[(amblyomma_americanum_expression_values$MeanF) & amblyomma_americanum_expression_values$MeanF > 8*amblyomma_americanum_expression_values$MeanM,"col"] <- "darkmagenta"


p2<-ggplot(amblyomma_americanum_expression_values, aes(x = log2(amblyomma_americanum_expression_values$MeanM), y = log2(amblyomma_americanum_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

tropilaelaps_mercedesae_expression_values$col<-"grey"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 2*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "steelblue"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 2*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "steelblue"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 4*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "tan1"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 4*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "tan1"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 6*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "forestgreen"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 6*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "forestgreen"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanM) & tropilaelaps_mercedesae_expression_values$MeanM > 8*tropilaelaps_mercedesae_expression_values$MeanF,"col"] <- "darkmagenta"
tropilaelaps_mercedesae_expression_values[(tropilaelaps_mercedesae_expression_values$MeanF) & tropilaelaps_mercedesae_expression_values$MeanF > 8*tropilaelaps_mercedesae_expression_values$MeanM,"col"] <- "darkmagenta"


p3<-ggplot(tropilaelaps_mercedesae_expression_values, aes(x = log2(tropilaelaps_mercedesae_expression_values$MeanM), y = log2(tropilaelaps_mercedesae_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

rhizoglyphus_robini_expression_values$col<-"grey"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 2*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "steelblue"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 2*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "steelblue"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 4*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "tan1"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 4*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "tan1"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 6*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "forestgreen"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 6*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "forestgreen"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanM) & rhizoglyphus_robini_expression_values$MeanM > 8*rhizoglyphus_robini_expression_values$MeanF,"col"] <- "darkmagenta"
rhizoglyphus_robini_expression_values[(rhizoglyphus_robini_expression_values$MeanF) & rhizoglyphus_robini_expression_values$MeanF > 8*rhizoglyphus_robini_expression_values$MeanM,"col"] <- "darkmagenta"


p4<-ggplot(rhizoglyphus_robini_expression_values, aes(x = log2(rhizoglyphus_robini_expression_values$MeanM), y = log2(rhizoglyphus_robini_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

tetranychus_urticae_expression_values$col<-"grey"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 2*tetranychus_urticae_expression_values$MeanF,"col"] <- "steelblue"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 2*tetranychus_urticae_expression_values$MeanM,"col"] <- "steelblue"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 4*tetranychus_urticae_expression_values$MeanF,"col"] <- "tan1"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 4*tetranychus_urticae_expression_values$MeanM,"col"] <- "tan1"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 6*tetranychus_urticae_expression_values$MeanF,"col"] <- "forestgreen"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 6*tetranychus_urticae_expression_values$MeanM,"col"] <- "forestgreen"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanM) & tetranychus_urticae_expression_values$MeanM > 8*tetranychus_urticae_expression_values$MeanF,"col"] <- "darkmagenta"
tetranychus_urticae_expression_values[(tetranychus_urticae_expression_values$MeanF) & tetranychus_urticae_expression_values$MeanF > 8*tetranychus_urticae_expression_values$MeanM,"col"] <- "darkmagenta"


p5<-ggplot(tetranychus_urticae_expression_values, aes(x = log2(tetranychus_urticae_expression_values$MeanM), y = log2(tetranychus_urticae_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

dendroctonus_ponderosae_expression_values$col<-"grey"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 2*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "steelblue"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 2*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "steelblue"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 4*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "tan1"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 4*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "tan1"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 6*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "forestgreen"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 6*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "forestgreen"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanM) & dendroctonus_ponderosae_expression_values$MeanM > 8*dendroctonus_ponderosae_expression_values$MeanF,"col"] <- "darkmagenta"
dendroctonus_ponderosae_expression_values[(dendroctonus_ponderosae_expression_values$MeanF) & dendroctonus_ponderosae_expression_values$MeanF > 8*dendroctonus_ponderosae_expression_values$MeanM,"col"] <- "darkmagenta"


p6<-ggplot(dendroctonus_ponderosae_expression_values, aes(x = log2(dendroctonus_ponderosae_expression_values$MeanM), y = log2(dendroctonus_ponderosae_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

mayetiola_destructor_expression_values$col<-"grey"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 2*mayetiola_destructor_expression_values$MeanF,"col"] <- "steelblue"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 2*mayetiola_destructor_expression_values$MeanM,"col"] <- "steelblue"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 4*mayetiola_destructor_expression_values$MeanF,"col"] <- "tan1"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 4*mayetiola_destructor_expression_values$MeanM,"col"] <- "tan1"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 6*mayetiola_destructor_expression_values$MeanF,"col"] <- "forestgreen"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 6*mayetiola_destructor_expression_values$MeanM,"col"] <- "forestgreen"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanM) & mayetiola_destructor_expression_values$MeanM > 8*mayetiola_destructor_expression_values$MeanF,"col"] <- "darkmagenta"
mayetiola_destructor_expression_values[(mayetiola_destructor_expression_values$MeanF) & mayetiola_destructor_expression_values$MeanF > 8*mayetiola_destructor_expression_values$MeanM,"col"] <- "darkmagenta"


p7<-ggplot(mayetiola_destructor_expression_values, aes(x = log2(mayetiola_destructor_expression_values$MeanM), y = log2(mayetiola_destructor_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

teleopsis_dalmanni_expression_values$col<-"grey"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 2*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "steelblue"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 2*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "steelblue"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 4*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "tan1"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 4*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "tan1"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 6*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "forestgreen"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 6*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "forestgreen"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanM) & teleopsis_dalmanni_expression_values$MeanM > 8*teleopsis_dalmanni_expression_values$MeanF,"col"] <- "darkmagenta"
teleopsis_dalmanni_expression_values[(teleopsis_dalmanni_expression_values$MeanF) & teleopsis_dalmanni_expression_values$MeanF > 8*teleopsis_dalmanni_expression_values$MeanM,"col"] <- "darkmagenta"


p8<-ggplot(teleopsis_dalmanni_expression_values, aes(x = log2(teleopsis_dalmanni_expression_values$MeanM), y = log2(teleopsis_dalmanni_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

phlebotomus_perniciosus_expression_values$col<-"grey"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 2*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "steelblue"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 2*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "steelblue"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 4*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "tan1"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 4*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "tan1"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 6*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "forestgreen"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 6*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "forestgreen"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanM) & phlebotomus_perniciosus_expression_values$MeanM > 8*phlebotomus_perniciosus_expression_values$MeanF,"col"] <- "darkmagenta"
phlebotomus_perniciosus_expression_values[(phlebotomus_perniciosus_expression_values$MeanF) & phlebotomus_perniciosus_expression_values$MeanF > 8*phlebotomus_perniciosus_expression_values$MeanM,"col"] <- "darkmagenta"


p9<-ggplot(phlebotomus_perniciosus_expression_values, aes(x = log2(phlebotomus_perniciosus_expression_values$MeanM), y = log2(phlebotomus_perniciosus_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

lygus_hesperus_expression_values$col<-"grey"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 2*lygus_hesperus_expression_values$MeanF,"col"] <- "steelblue"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 2*lygus_hesperus_expression_values$MeanM,"col"] <- "steelblue"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 4*lygus_hesperus_expression_values$MeanF,"col"] <- "tan1"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 4*lygus_hesperus_expression_values$MeanM,"col"] <- "tan1"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 6*lygus_hesperus_expression_values$MeanF,"col"] <- "forestgreen"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 6*lygus_hesperus_expression_values$MeanM,"col"] <- "forestgreen"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanM) & lygus_hesperus_expression_values$MeanM > 8*lygus_hesperus_expression_values$MeanF,"col"] <- "darkmagenta"
lygus_hesperus_expression_values[(lygus_hesperus_expression_values$MeanF) & lygus_hesperus_expression_values$MeanF > 8*lygus_hesperus_expression_values$MeanM,"col"] <- "darkmagenta"


p10<-ggplot(lygus_hesperus_expression_values, aes(x = log2(lygus_hesperus_expression_values$MeanM), y = log2(lygus_hesperus_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

athalia_rosae_expression_values$col<-"grey"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 2*athalia_rosae_expression_values$MeanF,"col"] <- "steelblue"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 2*athalia_rosae_expression_values$MeanM,"col"] <- "steelblue"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 4*athalia_rosae_expression_values$MeanF,"col"] <- "tan1"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 4*athalia_rosae_expression_values$MeanM,"col"] <- "tan1"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 6*athalia_rosae_expression_values$MeanF,"col"] <- "forestgreen"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 6*athalia_rosae_expression_values$MeanM,"col"] <- "forestgreen"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanM) & athalia_rosae_expression_values$MeanM > 8*athalia_rosae_expression_values$MeanF,"col"] <- "darkmagenta"
athalia_rosae_expression_values[(athalia_rosae_expression_values$MeanF) & athalia_rosae_expression_values$MeanF > 8*athalia_rosae_expression_values$MeanM,"col"] <- "darkmagenta"


p11<-ggplot(athalia_rosae_expression_values, aes(x = log2(athalia_rosae_expression_values$MeanM), y = log2(athalia_rosae_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

bemisia_tabaci_expression_values$col<-"grey"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 2*bemisia_tabaci_expression_values$MeanF,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 2*bemisia_tabaci_expression_values$MeanM,"col"] <- "steelblue"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 4*bemisia_tabaci_expression_values$MeanF,"col"] <- "tan1"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 4*bemisia_tabaci_expression_values$MeanM,"col"] <- "tan1"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 6*bemisia_tabaci_expression_values$MeanF,"col"] <- "forestgreen"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 6*bemisia_tabaci_expression_values$MeanM,"col"] <- "forestgreen"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanM) & bemisia_tabaci_expression_values$MeanM > 8*bemisia_tabaci_expression_values$MeanF,"col"] <- "darkmagenta"
bemisia_tabaci_expression_values[(bemisia_tabaci_expression_values$MeanF) & bemisia_tabaci_expression_values$MeanF > 8*bemisia_tabaci_expression_values$MeanM,"col"] <- "darkmagenta"


p12<-ggplot(bemisia_tabaci_expression_values, aes(x = log2(bemisia_tabaci_expression_values$MeanM), y = log2(bemisia_tabaci_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

ceratosolen_solmsi_expression_values$col<-"grey"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 2*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "steelblue"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 2*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "steelblue"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 4*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "tan1"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 4*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "tan1"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 6*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "forestgreen"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 6*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "forestgreen"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanM) & ceratosolen_solmsi_expression_values$MeanM > 8*ceratosolen_solmsi_expression_values$MeanF,"col"] <- "darkmagenta"
ceratosolen_solmsi_expression_values[(ceratosolen_solmsi_expression_values$MeanF) & ceratosolen_solmsi_expression_values$MeanF > 8*ceratosolen_solmsi_expression_values$MeanM,"col"] <- "darkmagenta"


p13<-ggplot(ceratosolen_solmsi_expression_values, aes(x = log2(ceratosolen_solmsi_expression_values$MeanM), y = log2(ceratosolen_solmsi_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

nasonia_giraulti_expression_values$col<-"grey"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 2*nasonia_giraulti_expression_values$MeanF,"col"] <- "steelblue"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 2*nasonia_giraulti_expression_values$MeanM,"col"] <- "steelblue"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 4*nasonia_giraulti_expression_values$MeanF,"col"] <- "tan1"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 4*nasonia_giraulti_expression_values$MeanM,"col"] <- "tan1"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 6*nasonia_giraulti_expression_values$MeanF,"col"] <- "forestgreen"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 6*nasonia_giraulti_expression_values$MeanM,"col"] <- "forestgreen"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanM) & nasonia_giraulti_expression_values$MeanM > 8*nasonia_giraulti_expression_values$MeanF,"col"] <- "darkmagenta"
nasonia_giraulti_expression_values[(nasonia_giraulti_expression_values$MeanF) & nasonia_giraulti_expression_values$MeanF > 8*nasonia_giraulti_expression_values$MeanM,"col"] <- "darkmagenta"


p14<-ggplot(nasonia_giraulti_expression_values, aes(x = log2(nasonia_giraulti_expression_values$MeanM), y = log2(nasonia_giraulti_expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

pdf("Pannel_scatterplot.pdf", width=14, height=7)

multiplot(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14, cols=3)

dev.off()



