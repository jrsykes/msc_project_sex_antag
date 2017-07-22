#### format of hiseq_info.txt file:
run_accession condition
SRR1 female
SRR3 female
SRR4 male
SRR2 male

####################################################################################################

########################################  STEP ONE   ###############################################

#####################################################################################################

######## Ensure that you are in the directory, in bash, that contains the kal_files directory and hiseq_info.txt file.
### Remember to edit hiseq_info.txt per the example above, beofre running sleuth script

library("sleuth")


### Set directory of Kallisto Results

########## 		REMEMBER TO EDIT SPECIES NAME.    #########
base_dir <-"/data/projects/lross_ssa/analyses/planococcus_pooled/kallisto/kal_results"

sample_id <- dir(file.path(base_dir, "kal_files"))

kal_dirs <- sapply(sample_id, function(id) file.path(base_dir, "kal_files", id))

### Give sample information

s2c <- read.table(file.path(base_dir, "hiseq_info.txt"), header = TRUE, stringsAsFactors=FALSE)

s2c <- dplyr::select(s2c, sample = run_accession, condition)

s2c

s2c <- dplyr::mutate(s2c, path = kal_dirs)

s2c

#run Sleuth

so <- sleuth_prep(s2c, ~ condition)

so <- sleuth_fit(so)

so <- sleuth_fit(so, ~1, 'reduced')

so <- sleuth_lrt(so, 'reduced', 'full')

#Get Results!

results_table <- sleuth_results(so, 'reduced:full', test_type = 'lrt')

write.table(results_table, file = "DEgenes")

SummaryKallisto_table<- kallisto_table(so, use_filtered = FALSE, normalized = TRUE, include_covariates = TRUE)

write.table(SummaryKallisto_table, file = "KallistoSummary.txt")

## In KalResults you will then have the following files:

## DEgenes.txt  hiseq_info.txt  kalfiles  KallistoSummary.txt

####### Now back in bash, in the kal_results directory.

#Organise KallistoSummary.txt with:

### IMPORTANT ###
######## in the section of the below line of code, “perl -pe 's{ }{++$n % 6 ? $& : "\n"}ge'” , 6=2n samples. This should be adjusted accordingly.
### If n is greater than 12, increase the last cut command per the patern. i.e. +2 for every extra library.
### IMPORTANT ###

cat KallistoSummary.txt | cut -d " " -f 2,5 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 8 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36 > Kallisto_TPM_table.txt

 ####The header of this table has been deleted. Add a header with: 

 ####### 	IMPORTANT  ######
 # change the relevent SRR values

sed -i $'1 i\\Transcript SRR1 SRR3 SRR4 SRR2\n' Kallisto_TPM_table.txt

###Create a count table with:

cat KallistoSummary.txt | cut -d " " -f 2,4 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 8 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36 > Kallisto_ESTcounts_table.txt

sed -i $'1 i\\Transcript SRR1 SRR3 SRR4 SRR2\n' Kallisto_ESTcounts_table.txt

head Kallisto_ESTcounts_table.txt

####################################################################################################

########################################  STEP TWO   ###############################################

#####################################################################################################

######## Back to R ###########

#Review the distribution of expression values from each library

expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

### the number of numerical values the the following line should equal n and begin with 2
expression_values<- (expression[,c(2,3,4)])

#Includes only reads with a TPM>1 in at least one individual
expression_values<-(subset(expression_values, SRR5377265 >exp(-7) | SRR5377267 >1 | SRSRR5377268 >1 | SRR2 >1))

### plot ditributions
pdf("distribution_boxplot.pdf", width=14, height=7)
boxplot(log2(expression_values), outline=F, notch=F, col=rainbow(8), ylab="Log2(TPM)")
dev.off()

####### correlations
sink('correlations.txt')
cor(expression_values, method="pearson")
sink()

#### Add columns to expression_vaues with mean female TPM and mean male TPM
expression_values$MeanM<-(expression_values$SRR4+expression_values$SRR2)/2
expression_values$MeanF<-(expression_values$SRR1+expression_values$SRR3)/2

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

# sync plots and correlations.txt back to mac and review

####################################################################################################

########################################  STEP THREE   ###############################################

#####################################################################################################

#create subsets

## n sex biased transcripts per individual using 2xtranscription level threshold.

SRR1_cutoff<-(subset(expression_values, SRR1>(2*expression_values$MeanM)))
SRR3_cutoff<-(subset(expression_values, SRR3>(2*expression_values$MeanM)))
SRR4_cutoff<-(subset(expression_values, SRR4>(2*expression_values$MeanF)))
SRR2_cutoff<-(subset(expression_values, SRR2>(2*expression_values$MeanF)))
#SRR1239356_cutoff<-(subset(expression_values, SRR1239356>(2*expression_values$MeanM)))
#SRR1239354_cutoff<-(subset(expression_values, SRR1239354>(2*expression_values$MeanM)))
#SRR1184537_cutoff<-(subset(expression_values, SRR1184537>(2*expression_values$MeanF)))
#SRR1184533_cutoff<-(subset(expression_values, SRR1184533>(2*expression_values$MeanF)))



##### n biased contigs

dim (SRR1_cutoff)
dim (SRR3_cutoff) 
dim (SRR4_cutoff)
dim (SRR2_cutoff)
#dim (SRR1239356_cutoff) 
#dim (SRR1239354_cutoff)
#dim (SRR1184537_cutoff)
#dim (SRR1184533_cutoff) 



##n sex limited genes
SRR1_limited<-(subset(expression_values, SRR1>1 & MeanM<1))
SRR3_limited<-(subset(expression_values, SRR3>1 & MeanM<1))
SRR4_limited<-(subset(expression_values, SRR4>1 & MeanF<1))
SRR2_limited<-(subset(expression_values, SRR2>1 & MeanF<1))
#SRR1239356_limited<-(subset(expression_values, SRR1239356>1 & MeanM<1))
#SRR1239354_limited<-(subset(expression_values, SRR1239354>1 & MeanM<1))
#SRR1184537_limited<-(subset(expression_values, SRR1184537>1 & MeanF<1))
#SRR1184533_limited<-(subset(expression_values, SRR1184533>1 & MeanF<1))


dim (SRR1_limited)
dim (SRR3_limited) 
dim (SRR4_limited)
dim (SRR2_limited)
#dim (SRR1239356_limited) 
#dim (SRR1239354_limited)
#dim (SRR1184537_limited)
#dim (SRR1184533_limited) 


## n genes transcribed by the per library
one<-(subset(expression_values,		SRR1>1))
two<-(subset(expression_values,		SRR3>1))
three<-(subset(expression_values,	SRR4>1))
four<-(subset(expression_values,	SRR2>1))
#five<-(subset(expression_values,	SRR1239356>1))
#six<-(subset(expression_values,		SRR1239354>1))
#seven<-(subset(expression_values,	SRR1184537>1))
#eight<-(subset(expression_values,	SRR1184533>1))


dim(one)
dim(two)
dim(three)
dim(four)
#dim(five)
#dim(six)
#dim(seven)
#dim(eight)



