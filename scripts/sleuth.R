run_accession condition
SRR4294671 female
SRR4294670 female
SRR4294669 male
SRR4294668 male


######## Ensure that you are in the directory, in bash, that contains the kal_files directory and hiseq_info.txt file.
### Remember to edit hiseq_info.txt as per the example above, beofre running sleuth script

library("sleuth")


### Set directory of Kallisto Results

########## 		REMEMBER TO EDIT SPECIES NAME.    #########
base_dir <-"/data/projects/lross_ssa/analyses/tropilaelaps_mercedesae/kallisto/kal_results"

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
### IMPORTANT ###

cat KallistoSummary.txt | cut -d " " -f 2,5 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 8 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16 > Kallisto_TPM_table.txt

 ####The header of this table has been deleted. Add a header with: 

 ####### 	IMPORTANT  ######
 # change the relevent SRR values

sed -i $'1 i\\Transcript SRR4294671 SRR4294670 SRR4294669 SRR4294668\n' Kallisto_TPM_table.txt

###Create a count table with:

cat KallistoSummary.txt | cut -d " " -f 2,4 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 8 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16 > Kallisto_ESTcounts_table.txt

sed -i $'1 i\\Transcript SRR4294671 SRR4294670 SRR4294669 SRR4294668\n' Kallisto_ESTcounts_table.txt


######## Back to R

Review the distribution of expression values from each library

expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

### the number of numeric values the the following line should equal n and begin with 2
expression_values<- (expression[,c(2,3,4,5)])

expression_values<-expression_values[!rowSums(expression_values <1),]

pdf("Boxplot1.pdf", width=14, height=7)

boxplot(log2(expression_values), outline=F, notch=F, col=rainbow(8), ylab="Log2(TPM)")

dev.off()

####### correlations
sink('correlations.txt')
cor(expression_values, method="pearson")
sink()

# Add an additional column to the TPM table with an average of the two female TPM columns:

#expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

#expression$MeanF<-(expression$SRR4416254+expression$SRR4416252+expression$SRR4416250)/3
#expression$MeanM<-(expression$SRR4416255+expression$SRR4416253+expression$SRR4416251)/3

#head(expression)

expression_values$MeanF<-(expression_values$SRR4294671+expression_values$SRR4294670)/2
expression_values$MeanM<-(expression_values$SRR4294669+expression_values$SRR4294668)/2

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
ggplot(expression_values, aes(x = log2(expression_values$MeanM), y = log2(expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Male TPM") + ylab("Log2 Female TPM") + scale_color_identity()
dev.off()

pdf("scatterplot2.pdf", width=14, height=7)
ggplot(expression_values, aes(x = log2(expression_values$MeanM), y = log2(expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Male TPM") + ylab("Log2 Female TPM") + scale_color_identity() + geom_smooth(method='lm')
dev.off()

#Merge the tables with TPM and p/q values.

#detranscripts<-read.table("DEgenes", head=T, sep=" ")

#newexpression<-merge(expression, detranscripts, by.x="Transcript", by.y="target_id")[,c(1,2,3,4,5,6,7,8)]

#Remove all reads with TPM<1

#newexpression<-subset(newexpression, SRR4416255>1 | SRR4416253>1 | SRR4416251>1 | SRR4416254>1 SRR4416252>1 | SRR4416250>1)

#create subsets

## n sex biased gene per individual using 2xtranscription level threshold.

SRR4294671_cutoff<-(subset(expression_values, SRR4294671>(2*expression_values$MeanM)))
SRR4294670_cutoff<-(subset(expression_values, SRR4294670>(2*expression_values$MeanM)))
SRR4294669_cutoff<-(subset(expression_values, SRR4294669>(2*expression_values$MeanF)))
SRR4294668_cutoff<-(subset(expression_values, SRR4294668>(2*expression_values$MeanF)))

## n sex biased gene per library using q<0.05 threshold. Only use this is n>6 if at all.

#fbias_qval<-(subset(newexpression,qval<0.05 | MeanF>(2*MeanM)))

#mbias_qval<-(subset(newexpression,qval<0.05 | MeanM>(2*MeanF))) 

##### n biased contigs

dim (SRR4294671_cutoff)
dim (SRR4294670_cutoff) 
dim (SRR4294669_cutoff)
dim (SRR4294668_cutoff)



##n sex limited genes

male_limited<-(subset(expression_values, SRR4294669>4 & SRR4294671<4 & SRR4294670<4))
dim (male_limited)
male_limited<-(subset(expression_values, SRR4294668>4 & SRR4294671<4 & SRR4294670<4))
dim (male_limited)


female_limited<-(subset(expression_values, SRR4294671>4 & SRR4294669<4 & SRR4294668<4))
dim (female_limited)
female_limited<-(subset(expression_values, SRR4294670>4 & SRR4294669<4 & SRR4294668<4))
dim (female_limited)
 

##n genes transcribed by the species

tail(expression_values)




