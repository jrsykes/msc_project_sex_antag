

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script agrilus_planipennis SRR1791267 female paired 
qsub $script agrilus_planipennis SRR1791269 male paired
#qsub $script  SRR1027687 female single
#qsub $script  SRR1027692 male single 