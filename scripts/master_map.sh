

##### IMPORTANT. IF RUNNING SINGLE END MODE, REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### 
######## for most libraries this should be -l 100 and -s 20 ##########
#slight deviations from these values will have no effect on mapping however, if possible, estimation and specification of length and SD is preferable  

#To run edit the appropriate qsub commands and execute with ' bash master_map.sh ' just as with master_trim.sh
#Once mapping is complete run the blobplot.sh script and then the sleuth.R R script. 
#The blobtools and sleuth scripts are not automated so standardised instructions are not possible. 
#They should be run, more or less, line by line and appropriate values edited throughout. Some instructions are icluded.

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script mayetiola_destructor SRR1738673 male paired   
qsub $script mayetiola_destructor SRR1239358 male paired   
qsub $script mayetiola_destructor SRR1239355 male paired   
qsub $script mayetiola_destructor SRR1738672 female paired   
qsub $script mayetiola_destructor SRR1239356 female paired   
qsub $script mayetiola_destructor SRR1239354 female paired   
qsub $script planococcus_pooled SRR1 female paired  
qsub $script planococcus_pooled SRR3 female paired  
qsub $script planococcus_pooled SRR4 male paired 
qsub $script planococcus_pooled SRR2 male paired 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
