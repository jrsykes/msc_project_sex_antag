script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

##### IMPORTANT. REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### for most this should be -l 100 and -s 20

qsub $script ericerus_pela SRR1027689 female single
qsub $script ericerus_pela SRR1027688 female single
qsub $script ericerus_pela SRR1027687 female single
qsub $script ericerus_pela SRR1027692 male single


#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 