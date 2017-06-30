#### format of hiseq_info.txt file:
run_accession condition
SRR2773799 female
SRR2773798 female
SRR2773797 female
SRR2773796 female
SRR2773795 female
SRR2773794 female
SRR1566030 female
SRR1566029 female
SRR1566028 female
SRR1566024 female
SRR1566023 female
SRR1566022 female
SRR1566033 male
SRR1566032 male
SRR1566031 male
SRR1566027 male
SRR1566026 male
SRR1566025 male

####################################################################################################

########################################  STEP ONE   ###############################################

#####################################################################################################

######## Ensure that you are in the directory, in bash, that contains the kal_files directory and hiseq_info.txt file.
### Remember to edit hiseq_info.txt per the example above, beofre running sleuth script

library("sleuth")


### Set directory of Kallisto Results

########## 		REMEMBER TO EDIT SPECIES NAME.    #########
base_dir <-"/data/projects/lross_ssa/analyses/nasonia_giraulti/kallisto/kal_results"

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

cat KallistoSummary.txt | cut -d " " -f 2,5 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 36 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36 > Kallisto_TPM_table.txt

 ####The header of this table has been deleted. Add a header with: 

 ####### 	IMPORTANT  ######
 # change the relevent SRR values

sed -i $'1 i\\Transcript SRR2773799 SRR2773798 SRR2773797 SRR2773796 SRR2773795 SRR2773794 SRR1566030 SRR1566029 SRR1566028 SRR1566024 SRR1566023 SRR1566022 SRR1566033 SRR1566032 SRR1566031 SRR1566027 SRR1566026 SRR1566025\n' Kallisto_TPM_table.txt

###Create a count table with:

cat KallistoSummary.txt | cut -d " " -f 2,4 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 36 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36 > Kallisto_ESTcounts_table.txt

sed -i $'1 i\\Transcript SRR2773799 SRR2773798 SRR2773797 SRR2773796 SRR2773795 SRR2773794 SRR1566030 SRR1566029 SRR1566028 SRR1566024 SRR1566023 SRR1566022 SRR1566033 SRR1566032 SRR1566031 SRR1566027 SRR1566026 SRR1566025\n' Kallisto_ESTcounts_table.txt

head Kallisto_ESTcounts_table.txt

####################################################################################################

########################################  STEP TWO   ###############################################

#####################################################################################################

######## Back to R ###########

#Review the distribution of expression values from each library

expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

### the number of numerical values the the following line should equal n and begin with 2
expression_values<- (expression[,c(2,3,4,5)])

#Includes only reads with a TPM>1 in at least one individual
expression_values<-(subset(expression_values, SRR1842142 >1 & SRR1842141 >1 | SRR1842140 >1 & SRR1842139 >1 ))

### plot ditributions
pdf("distribution_boxplot.pdf", width=14, height=7)
boxplot(log2(expression_values), outline=F, notch=F, col=rainbow(8), ylab="Log2(TPM)")
dev.off()

####### correlations
sink('correlations.txt')
cor(expression_values, method="pearson")
sink()

#### Add columns to expression_vaues with mean female TPM and mean male TPM
expression_values$MeanM<-(expression_values$SRR1842142+expression_values$SRR1842141)/2
expression_values$MeanF<-(expression_values$SRR1842140+expression_values$SRR1842139)/2

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

SRR1842142_cutoff<-(subset(expression_values, SRR1842142>(2*expression_values$MeanF)))
SRR1842141_cutoff<-(subset(expression_values, SRR1842141>(2*expression_values$MeanF)))
SRR1842140_cutoff<-(subset(expression_values, SRR1842140>(2*expression_values$MeanM)))
SRR1842139_cutoff<-(subset(expression_values, SRR1842139>(2*expression_values$MeanM)))
#SRR974926_cutoff<-(subset(expression_values, SRR974926>(2*expression_values$MeanF)))
#SRR2074672_cutoff<-(subset(expression_values, SRR2074672>(2*expression_values$MeanM)))
#SRR1184537_cutoff<-(subset(expression_values, SRR1184537>(2*expression_values$MeanF)))
#SRR1184533_cutoff<-(subset(expression_values, SRR1184533>(2*expression_values$MeanF)))



##### n biased contigs

dim (SRR1842142_cutoff)
dim (SRR1842141_cutoff) 
dim (SRR1842140_cutoff)
dim (SRR1842139_cutoff)
#dim (SRR974926_cutoff) 
#dim (SRR2074672_cutoff)
#dim (SRR1184537_cutoff)
#dim (SRR1184533_cutoff) 



##n sex limited genes
SRR1842142_limited<-(subset(expression_values, SRR1842142>1 & MeanF<1))
SRR1842141_limited<-(subset(expression_values, SRR1842141>1 & MeanF<1))
SRR1842140_limited<-(subset(expression_values, SRR1842140>1 & MeanM<1))
SRR1842139_limited<-(subset(expression_values, SRR1842139>1 & MeanM<1))
#SRR974926_limited<-(subset(expression_values, SRR974926>1 & MeanF<1))
#SRR2074672_limited<-(subset(expression_values, SRR2074672>1 & MeanM<1))
#SRR1184537_limited<-(subset(expression_values, SRR1184537>1 & MeanF<1))
#SRR1184533_limited<-(subset(expression_values, SRR1184533>1 & MeanF<1))


dim (SRR1842142_limited)
dim (SRR1842141_limited) 
dim (SRR1842140_limited)
dim (SRR1842139_limited)
#dim (SRR974926_limited) 
#dim (SRR2074672_limited)
#dim (SRR1184537_limited)
#dim (SRR1184533_limited) 


## n genes transcribed by the per library
one<-(subset(expression_values,		SRR1842142>1))
two<-(subset(expression_values,		SRR1842141>1))
three<-(subset(expression_values,	SRR1842140>1))
four<-(subset(expression_values,	SRR1842139>1))
#five<-(subset(expression_values,	SRR974926>1))
#six<-(subset(expression_values,	SRR2074672>1))
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



