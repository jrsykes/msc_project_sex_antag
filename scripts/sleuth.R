
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
######## in the section of the above line of code, “perl -pe 's{ }{++$n % 6 ? $& : "\n"}ge'” , 6=2n samples. This should be adjusted accordingly.
### IMPORTANT ###

cat KallistoSummary.txt | cut -d " " -f 2,5 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 6 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16 > Kallisto_TPM_table.txt

 ####The header of this table has been deleted. Add a header with: 

 ####### 	IMPORTANT  ######
 # change the televent SRR values

sed -i $'1 i\\Transcript SRR5377265 SRR5377267 SRR5377268\n' Kallisto_TPM_table.txt

###Create a count table with:

cat KallistoSummary.txt | cut -d " " -f 2,4 | grep -v sample | perl -pi -e 's/\n/ /gi' | perl -pe 's{ }{++$n % 6 ? $& : "\n"}ge' | cut -d " " -f 1,2,4,6,8,10,12,14,16 > Kallisto_ESTcounts_table.txt

sed -i $'1 i\\Transcript SRR5377265 SRR5377267 SRR5377268\n' Kallisto_ESTcounts_table.txt











