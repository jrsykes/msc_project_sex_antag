
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


varroa_destructor_expression_values<- (varroa_destructor_expression[,c(2,3,4)]
amblyomma_americanum_expression_values<- (amblyomma_americanum_expression[,c(2,3,4,5,6,7)]
tropilaelaps_mercedesae_expression_values<- (tropilaelaps_mercedesae_expression[,c(2,3,4,5)]
rhizoglyphus_robini_expression_values<- (rhizoglyphus_robini_expression[,c(2,3,4)]
tetranychus_urticae_expression_values<- (tetranychus_urticae_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13)]
dendroctonus_ponderosae_expression_values<- (dendroctonus_ponderosae_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17)]
mayetiola_destructor_expression_values<- (mayetiola_destructor_expression[,c(2,3,4,5,6,7)]
teleopsis_dalmanni_expression_values<- (teleopsis_dalmanni_expression[,c(2,3,4,5,6,7,8,9)]
phlebotomus_perniciosus_expression_values<- (phlebotomus_perniciosus_expression[,c(2,3,4,5,6,7)]
lygus_hesperus_expression_values<- (lygus_hesperus_expression[,c(2,3,4,5)]
athalia_rosae_expression_values<- (athalia_rosae_expression[,c(2,3,4,5)]
bemisia_tabaci_expression_values<- (bemisia_tabaci_expression[,c(2,3,4)]
ceratosolen_solmsi_expression_values<- (ceratosolen_solmsi_expression[,c(2,3,4,5,6)]
nasonia_giraulti_expression_values<- (nasonia_giraulti_expression[,c(2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19)]


#### Add columns to expression_vaues with mean female TPM and mean male TPM
expression_values$MeanM<-(expression_values$SRR4+expression_values$SRR2)/2
expression_values$MeanF<-(expression_values$SRR1+expression_values$SRR3)/2


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


expression_values$col<-"grey"
expression_values[(expression_values$MeanM) & expression_values$MeanM > 2*expression_values$MeanF,"col"] <- "steelblue"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 2*expression_values$MeanM,"col"] <- "steelblue"
expression_values[(expression_values$MeanM) & expression_values$MeanM > 4*expression_values$MeanF,"col"] <- "tan1"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 4*expression_values$MeanM,"col"] <- "tan1"
expression_values[(expression_values$MeanM) & expression_values$MeanM > 6*expression_values$MeanF,"col"] <- "forestgreen"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 6*expression_values$MeanM,"col"] <- "forestgreen"
expression_values[(expression_values$MeanM) & expression_values$MeanM > 8*expression_values$MeanF,"col"] <- "darkmagenta"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 8*expression_values$MeanM,"col"] <- "darkmagenta"

pdf("scatterplot1.pdf", width=14, height=7)
ggplot(expression_values, aes(x = log2(expression_values$MeanM), y = log2(expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Mean Male TPM") + ylab("Log2 Mean Female TPM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))
dev.off()



