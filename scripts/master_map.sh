script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

##### IMPORTANT. IF RUNNING SINGLE END MODE, REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### 
######## for most libraries this should be -l 100 and -s 20 ##########


qsub $script planococcus_citric SRR1 female paired
qsub $script planococcus_citric SRR2 male paired
qsub $script planococcus_ficus SRR3 female paired
qsub $script planococcus_ficus SRR4 male paired
#qsub $script dendroctonus_ponderosae SRR867160 female paired
#qsub $script dendroctonus_ponderosae SRR867161 female paired
#qsub $script dendroctonus_ponderosae SRR867162 female paired
#qsub $script dendroctonus_ponderosae SRR867179 female paired
#qsub $script dendroctonus_ponderosae SRR867176 female paired
#qsub $script dendroctonus_ponderosae SRR867183 female paired
#qsub $script dendroctonus_ponderosae SRR867186 female paired
#qsub $script dendroctonus_ponderosae SRR867188 female paired
#qsub $script dendroctonus_ponderosae SRR867432 male paired
#qsub $script dendroctonus_ponderosae SRR867441 male paired
#qsub $script dendroctonus_ponderosae SRR867433 male paired
#qsub $script dendroctonus_ponderosae SRR867434 male paired
#qsub $script dendroctonus_ponderosae SRR867436 male paired
#qsub $script dendroctonus_ponderosae SRR867438 male paired
#qsub $script dendroctonus_ponderosae SRR867439 male paired
#qsub $script dendroctonus_ponderosae SRR867440 male paired
