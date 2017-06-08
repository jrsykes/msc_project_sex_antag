script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script varroa_destructor SRR5377265 male paired 
qsub $script varroa_destructor SRR5377267 female paired
qsub $script varroa_destructor SRR5377268 female paired
#qsub $script  SRR1027692 male single 

