

##### IMPORTANT. IF RUNNING SINGLE END MODE, REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### 
######## for most libraries this should be -l 100 and -s 20 ##########
#slight deviations from these values will have no effect on mapping however, if possible, estimation and specification of length and SD is preferable  

#To run edit the appropriate qsub commands and execute with ' bash master_map.sh ' just as with master_trim.sh
#Once mapping is complete run the blobplot.sh script and then the sleuth.R R script. 
#The blobtools and sleuth scripts are not automated so standardised instructions are not possible. 
#They should be run, more or less, line by line and appropriate values edited throughout. Some instructions are icluded.

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script tetranychus_urticae SRR4043745 female paired
qsub $script tetranychus_urticae SRR4043744 female paired
qsub $script tetranychus_urticae SRR4043743 female paired
qsub $script tetranychus_urticae SRR4043742 female paired
qsub $script tetranychus_urticae SRR4043741 male paired
qsub $script tetranychus_urticae SRR4043740 male paired
qsub $script tetranychus_urticae SRR4043739 male paired
qsub $script tetranychus_urticae SRR4043738 male paired
qsub $script tetranychus_urticae SRR1582619 female paired
qsub $script tetranychus_urticae SRR1582618 female paired
qsub $script tetranychus_urticae SRR1582616 female paired
qsub $script tetranychus_urticae SRR1582617 female paired
#qsub $script rhizoglyphus_robini SRR3934331 male single
#qsub $script rhizoglyphus_robini SRR3934338 male single
#qsub $script rhizoglyphus_robini SRR3934339 male single

