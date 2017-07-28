# Project title

ASREML univariate analysis of sex biased TPM data 

W10000

# description of the data

  	target_id 	!A 4806329 	!LL 30 !SKIP 1
 	tpm 			
  	sex			
  	species		!A 2631633	!LL 30 	
  	SRR			!A 4692401	
  	SexDeterm	!A 	


# Name of the data file

combined_abundance_unique_id.tsv	!SKIP 1 


# Model specification

log(tpm) ~ sex !r at(SexDeterm):corgh(sex):target_id:species



#(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_id:species, rcov=~units:at(SSD), data=dat, workspace=1e+10)

