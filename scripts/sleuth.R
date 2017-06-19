
######## Ensure that you are in the directory, in bash, that contains the kal_files directory and hiseq_info.txt file.

library("sleuth")


### Set directory of Kallisto Results

########## 		REMEMBER TO EDIT SPECIES NAME.    #########
base_dir <-"/data/projects/lross_ssa/analyses/varroa_destructor/kallisto/kal_results"

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

cat KallistoSummary.txt | cut -d " " -f 2,5 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 6 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16 > Kallisto_TPM_table.txt

 ####The header of this table has been deleted. Add a header with: 

 ####### 	IMPORTANT  ######
 # change the relevent SRR values

sed -i $'1 i\\Transcript SRR5377265 SRR5377267 SRR5377268\n' Kallisto_TPM_table.txt

###Create a count table with:

cat KallistoSummary.txt | cut -d " " -f 2,4 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 6 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16 > Kallisto_ESTcounts_table.txt

sed -i $'1 i\\Transcript SRR5377265 SRR5377267 SRR5377268\n' Kallisto_ESTcounts_table.txt


######## Back to R

Review the distribution of expression values from each library

expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

pdf("Boxplot1.pdf", width=14, height=7)

expression_values<- (expression[,c(2,3,4)])

expression_values<-expression_values[!rowSums(expression_values <1),]

boxplot(log2(expression_values), outline=F, notch=F, col=rainbow(8), ylab="Log2(TPM)")

dev.off()

####### correlations

cor(expression_values, method="pearson")

# Add an additional column to the TPM table with an average of the two female TPM columns:

expression<-read.table("Kallisto_TPM_table.txt", head=T, sep=" ")

expression$MeanF<-(expression$SRR5377267+expression$SRR5377268)/2

head(expression)

expression_values$MeanF<-(expression_values$SRR5377267+expression_values$SRR5377268)/2


library(ggplot2)


pdf("scatterplot2.pdf", width=14, height=7)
expression_values$col<-"grey"

expression_values[(expression_values$SRR5377265) & expression_values$SRR5377265 > 2*expression_values$MeanF,"col"] <- "steelblue"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 2*expression_values$SRR5377265,"col"] <- "steelblue"
expression_values[(expression_values$SRR5377265) & expression_values$SRR5377265 > 4*expression_values$MeanF,"col"] <- "tan1"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 4*expression_values$SRR5377265,"col"] <- "tan1"
expression_values[(expression_values$SRR5377265) & expression_values$SRR5377265 > 6*expression_values$MeanF,"col"] <- "forestgreen"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 6*expression_values$SRR5377265,"col"] <- "forestgreen"
expression_values[(expression_values$SRR5377265) & expression_values$SRR5377265 > 8*expression_values$MeanF,"col"] <- "darkmagenta"
expression_values[(expression_values$MeanF) & expression_values$MeanF > 8*expression_values$SRR5377265,"col"] <- "darkmagenta"

ggplot(expression_values, aes(x = log2(expression_values$SRR5377265), y = log2(expression_values$MeanF), color = col)) + geom_point(size=0.7) + xlab("Log2 Male TPM") + ylab("Log2 Female TPM") + scale_color_identity() + xlim(0,20) + geom_smooth(method='lm')

dev.off()


#Merge the tables with TPM and p/q values.

detranscripts<-read.table("DEgenes", head=T, sep=" ")

newexpression<-merge(expression, detranscripts, by.x="Transcript", by.y="target_id")[,c(1,2,3,4,5,6,7,8)]

#Remove all reads with TPM<1

newexpression<-subset(newexpression, SRR5377265>1 | SRR5377267>1 | SRR5377268>1 | MeanF>1)

#create subsets

## n sex biased gene per individual using 2xtranscription level threshold.

biasSRR5377265_cutoff<-(subset(newexpression, SRR5377265>(2*MeanF)))

biasSRR5377267_cutoff<-(subset(newexpression, SRR5377267>(2*SRR5377265)))

biasSRR5377268_cutoff<-(subset(newexpression, SRR5377268>(2*SRR5377265)))

## n sex biased gene per library using q<0.05 threshold. Only use this is n>6 if at all.

#fbias_qval<-(subset(newexpression,qval<0.05 | MeanF>(2*SRR5377265)))

#mbias_qval<-(subset(newexpression,qval<0.05 | SRR5377265>(2*MeanF))) 

##### n biased contigs

dim (biasSRR5377265_cutoff) 

dim (biasSRR5377267_cutoff) 

dim (biasSRR5377268_cutoff)

##n genes transcribed by SRR5377265 individual

lim65<-(subset(expression, SRR5377265>0 | MeanF<1))

 

dim(lim65)

 

##n genes transcribed by the species

ncontigs<-(subset(newexpression, SRR5377265>0 | SRR5377267>0 | SRR5377268>0))
dim (ncontigs)





