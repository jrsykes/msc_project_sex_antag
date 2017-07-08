
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
varroa_destructor_expression_values$MeanM<-(varroa_destructor_expression_values$)/
amblyomma_americanum_expression_values$MeanM<-(amblyomma_americanum_expression_values$)/
tropilaelaps_mercedesae_expression_values$MeanM<-(tropilaelaps_mercedesae_expression_values$)/
rhizoglyphus_robini_expression_values$MeanM<-(rhizoglyphus_robini_expression_values$)/
tetranychus_urticae_expression_values$MeanM<-(tetranychus_urticae_expression_values$)/
dendroctonus_ponderosae_expression_values$MeanM<-(dendroctonus_ponderosae_expression_values$)/
mayetiola_destructor_expression_values$MeanM<-(mayetiola_destructor_expression_values$)/
teleopsis_dalmanni_expression_values$MeanM<-(teleopsis_dalmanni_expression_values$)/
phlebotomus_perniciosus_expression_values$MeanM<-(phlebotomus_perniciosus_expression_values$)/
lygus_hesperus_expression_values$MeanM<-(lygus_hesperus_expression_values$)/
athalia_rosae_expression_values$MeanM<-(athalia_rosae_expression_values$)/
bemisia_tabaci_expression_values$MeanM<-(bemisia_tabaci_expression_values$)/
ceratosolen_solmsi_expression_values$MeanM<-(ceratosolen_solmsi_expression_values$)/
nasonia_giraulti_expression_values$MeanM<-(nasonia_giraulti_expression_values$)/

### Mean feamle
varroa_destructor_expression_values$MeanF<-(varroa_destructor_expression_values$)/
amblyomma_americanum_expression_values$MeanF<-(amblyomma_americanum_expression_values$)/
tropilaelaps_mercedesae_expression_values$MeanF<-(tropilaelaps_mercedesae_expression_values$)/
rhizoglyphus_robini_expression_values$MeanF<-(rhizoglyphus_robini_expression_values$)/
tetranychus_urticae_expression_values$MeanF<-(tetranychus_urticae_expression_values$)/
dendroctonus_ponderosae_expression_values$MeanF<-(dendroctonus_ponderosae_expression_values$)/
mayetiola_destructor_expression_values$MeanF<-(mayetiola_destructor_expression_values$)/
teleopsis_dalmanni_expression_values$MeanF<-(teleopsis_dalmanni_expression_values$)/
phlebotomus_perniciosus_expression_values$MeanF<-(phlebotomus_perniciosus_expression_values$)/
lygus_hesperus_expression_values$MeanF<-(lygus_hesperus_expression_values$)/
athalia_rosae_expression_values$MeanF<-(athalia_rosae_expression_values$)/
bemisia_tabaci_expression_values$MeanF<-(bemisia_tabaci_expression_values$)/
ceratosolen_solmsi_expression_values$MeanF<-(ceratosolen_solmsi_expression_values$)/
nasonia_giraulti_expression_values$MeanF<-(nasonia_giraulti_expression_values$)/


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



