script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

##### IMPORTANT. REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### for most this should be -l 100 and -s 20

qsub $script amblyomma_americanum SRR4416255 male single
qsub $script amblyomma_americanum SRR4416253 male single
qsub $script amblyomma_americanum SRR4416251 male single
qsub $script amblyomma_americanum SRR4416254 female single
qsub $script amblyomma_americanum SRR4416252 female single
qsub $script amblyomma_americanum SRR4416250 female single

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