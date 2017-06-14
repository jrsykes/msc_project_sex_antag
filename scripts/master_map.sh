script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

##### IMPORTANT. REMMEBER TO LOOK AT SEQUENCE LENGTH IN MASTER_MAP.SH BFORE RUNNING ########### for most this should be -l 100 and -s 20

qsub $script tropilaelaps_mercedesae SRR4294671 female paired
qsub $script tropilaelaps_mercedesae SRR4294670 female paired
qsub $script tropilaelaps_mercedesae SRR4294669 male paired
qsub $script tropilaelaps_mercedesae SRR4294668 male paired

#qsub $script tetranychus_urticae SRR4043741 male paired
#qsub $script tetranychus_urticae SRR4043740 male paired
#qsub $script tetranychus_urticae SRR4043739 male paired
#qsub $script tetranychus_urticae SRR4043738 male paired
#qsub $script tetranychus_urticae SRR1582619 female paired
#qsub $script tetranychus_urticae SRR1582618 female paired
#qsub $script tetranychus_urticae SRR1582616 female paired
#qsub $script tetranychus_urticae SRR1582617 female paired

#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 
#qsub $script 