#### format of hiseq_info.txt file:
run_accession condition
SRR4043745 female
SRR4043744 female
SRR4043743 female
SRR4043742 female
SRR4043741 male
SRR4043740 male
SRR4043739 male
SRR4043738 male
SRR1582619 female
SRR1582618 female
SRR1582616 female
SRR1582617 female


######## Ensure that you are in the directory, in bash, that contains the kal_files directory and hiseq_info.txt file.
### Remember to edit hiseq_info.txt per the example above, beofre running sleuth script

library("sleuth")


### Set directory of Kallisto Results

########## 		REMEMBER TO EDIT SPECIES NAME.    #########
base_dir <-"/data/projects/lross_ssa/analyses/tetranychus_urticae/kallisto/kal_results"

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

cat KallistoSummary.txt | cut -d " " -f 2,5 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 24 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16,18,20,22,24 > Kallisto_TPM_table.txt

 ####The header of this table has been deleted. Add a header with: 

 ####### 	IMPORTANT  ######
 # change the relevent SRR values

sed -i $'1 i\\Transcript SRR4043745 SRR4043744 SRR4043743 SRR4043742 SRR4043741 SRR4043740 SRR4043739 SRR4043738 SRR1582619 SRR1582618 SRR1582616 SRR1582617\n' Kallisto_TPM_table.txt

###Create a count table with:

cat KallistoSummary.txt | cut -d " " -f 2,4 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 24 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16,18,20,22,24 > Kallisto_ESTcounts_table.txt

sed -i $'1 i\\Transcript SRR4043745 SRR4043744 SRR4043743 SRR4043742 SRR4043741 SRR4043740 SRR4043739 SRR4043738 SRR1582619 SRR1582618 SRR1582616 SRR1582617\n' Kallisto_ESTcounts_table.txt

head Kallisto_ESTcounts_table.txt
######## Back to R

#Review the distribution of expression values from each library

expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

### the number of numerical values the the following line should equal n and begin with 2
expression_values<- (expression[,c(2,3,4,5,6,7,8,9,10,11,12,13)])

#Includes only reads with a TPM>1 in at least one individual
expression_values<-(subset(expression_values, SRR1582618 >1 & SRR1582616 >1 & SRR1582617>1 & SRR4043745>1 & SRR4043744 >1 & SRR4043743 >1 & SRR4043742 >1 | SRR4043741 >1 & SRR4043740 >1 & SRR4043739 >1 & SRR4043738 >1 ))

### plot ditributions
pdf("distribution_boxplot.pdf", width=14, height=7)
boxplot(log2(expression_values), outline=F, notch=F, col=rainbow(8), ylab="Log2(TPM)")
dev.off()

####### correlations
sink('correlations.txt')
cor(expression_values, method="pearson")
sink()

#### Add columns to expression_vaues with mean female TPM and mean male TPM
expression_values$MeanM<-(expression_values$SRR4043741+expression_values$SRR4043740+expression_values$SRR4043739+expression_values$SRR4043738)/4
expression_values$MeanF<-(expression_values$SRR4043745+expression_values$SRR4043744+expression_values$SRR4043743+expression_values$SRR4043742+expression_values$SRR1582618+expression_values$SRR1582616+expression_values$SRR1582617)/7

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


#create subsets

## n sex biased transcripts per individual using 2xtranscription level threshold.

SRR4043745_cutoff<-(subset(expression_values, SRR4043745>(2*expression_values$MeanM)))
SRR4043744_cutoff<-(subset(expression_values, SRR4043744>(2*expression_values$MeanM)))
SRR4043743_cutoff<-(subset(expression_values, SRR4043743>(2*expression_values$MeanM)))
SRR4043742_cutoff<-(subset(expression_values, SRR4043742>(2*expression_values$MeanM)))
SRR4043741_cutoff<-(subset(expression_values, SRR4043741>(2*expression_values$MeanF)))
SRR4043740_cutoff<-(subset(expression_values, SRR4043740>(2*expression_values$MeanF)))
SRR4043739_cutoff<-(subset(expression_values, SRR4043739>(2*expression_values$MeanF)))
SRR4043738_cutoff<-(subset(expression_values, SRR4043738>(2*expression_values$MeanF)))
SRR1582618_cutoff<-(subset(expression_values, SRR1582618>(2*expression_values$MeanM)))
SRR1582616_cutoff<-(subset(expression_values, SRR1582616>(2*expression_values$MeanM)))
SRR1582617_cutoff<-(subset(expression_values, SRR1582617>(2*expression_values$MeanM)))

##### n biased contigs

dim (SRR4043745_cutoff)
dim (SRR4043744_cutoff) 
dim (SRR4043743_cutoff)
dim (SRR4043742_cutoff)
dim (SRR4043741_cutoff) 
dim (SRR4043740_cutoff)
dim (SRR4043739_cutoff)
dim (SRR4043738_cutoff) 
dim (SRR1582618_cutoff)
dim (SRR1582616_cutoff) 
dim (SRR1582617_cutoff)

##n sex limited genes
SRR4043745_limited<-(subset(expression_values, SRR4043745>1 & MeanM<1))
SRR4043744_limited<-(subset(expression_values, SRR4043744>1 & MeanM<1))
SRR4043743_limited<-(subset(expression_values, SRR4043743>1 & MeanM<1))
SRR4043742_limited<-(subset(expression_values, SRR4043742>1 & MeanM<1))
SRR4043741_limited<-(subset(expression_values, SRR4043741>1 & MeanF<1))
SRR4043740_limited<-(subset(expression_values, SRR4043740>1 & MeanF<1))
SRR4043739_limited<-(subset(expression_values, SRR4043739>1 & MeanF<1))
SRR4043738_limited<-(subset(expression_values, SRR4043738>1 & MeanF<1))
SRR1582618_limited<-(subset(expression_values, SRR1582618>1 & MeanM<1))
SRR1582616_limited<-(subset(expression_values, SRR1582616>1 & MeanM<1))
SRR1582617_limited<-(subset(expression_values, SRR1582617>1 & MeanM<1))

dim (SRR4043745_limited)
dim (SRR4043744_limited) 
dim (SRR4043743_limited)
dim (SRR4043742_limited)
dim (SRR4043741_limited) 
dim (SRR4043740_limited)
dim (SRR4043739_limited)
dim (SRR4043738_limited) 
dim (SRR1582618_limited)
dim (SRR1582616_limited) 
dim (SRR1582617_limited)

## n genes transcribed by the per library
one<-(subset(expression_values, SRR4043745>1))
two<-(subset(expression_values, SRR4043744>1))
three<-(subset(expression_values, SRR4043743>1))
four<-(subset(expression_values, SRR4043742>1))
five<-(subset(expression_values, SRR4043741>1))
six<-(subset(expression_values, SRR4043740>1))
seven<-(subset(expression_values, SRR4043739>1))
eight<-(subset(expression_values, SRR4043738>1))
ten<-(subset(expression_values, SRR1582618>1))
eleven<-(subset(expression_values, SRR1582616>1))
twelve<-(subset(expression_values, SRR1582617>1))

dim(one)
dim(two)
dim(three)
dim(four)
dim(five)
dim(six)
dim(seven)
dim(eight)
dim(ten)
dim(eleven)
dim(twelve)

