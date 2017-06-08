script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script bemisia_tabaci SRR5086009 female paired
qsub $script bemisia_tabaci SRR5086010 male paired
qsub $script bemisia_tabaci SRR1523522 female paired
#qsub $script  SRR1027692 male single 

