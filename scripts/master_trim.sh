

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script lygus_hesperus SRR925995 male paired 
qsub $script lygus_hesperus SRR925994 male paired
qsub $script lygus_hesperus SRR925993 female paired
qsub $script lygus_hesperus SRR925992 female paired