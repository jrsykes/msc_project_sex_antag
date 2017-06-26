

##### IMPORTANT. IF RUNNING SINGLE END MODE, REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### 
######## for most libraries this should be -l 100 and -s 20 ##########
#slight deviations from these values will have no effect on mapping however, if possible, estimation and specification of length and SD is preferable  

#To run edit the appropriate qsub commands and execute with ' bash master_map.sh ' just as with master_trim.sh
#Once mapping is complete run the blobplot.sh script and then the sleuth.R R script. 
#The blobtools and sleuth scripts are not automated so standardised instructions are not possible. 
#They should be run, more or less, line by line and appropriate values edited throughout. Some instructions are icluded.

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script nasonia_giraulti SRR2773799 female single 
qsub $script nasonia_giraulti SRR2773798 female single 
qsub $script nasonia_giraulti SRR2773797 female single 
qsub $script nasonia_giraulti SRR2773796 female single 
qsub $script nasonia_giraulti SRR2773795 female single 
qsub $script nasonia_giraulti SRR2773794 female single 
qsub $script nasonia_giraulti SRR1566030 female single 
qsub $script nasonia_giraulti SRR1566029 female single 
qsub $script nasonia_giraulti SRR1566028 female single 
qsub $script nasonia_giraulti SRR1566024 female single 
qsub $script nasonia_giraulti SRR1566023 female single 
qsub $script nasonia_giraulti SRR1566022 female single 
qsub $script nasonia_giraulti SRR1566033 male single 
qsub $script nasonia_giraulti SRR1566032 male single 
qsub $script nasonia_giraulti SRR1566031 male single 
qsub $script nasonia_giraulti SRR1566027 male single 
qsub $script nasonia_giraulti SRR1566026 male single 
qsub $script nasonia_giraulti SRR1566025 male single 
