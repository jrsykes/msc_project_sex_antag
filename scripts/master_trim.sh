

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script ericerus_pela SRR1027689 female single
qsub $script ericerus_pela SRR1027688 female single
qsub $script ericerus_pela SRR1027687 female single
qsub $script ericerus_pela SRR1027692 male single


#qsub $script ceratosolen_solmsi SRR974926 male paired
#qsub $script frankliniella_occidentalis SRR1826956 female paired
#qsub $script frankliniella_occidentalis SRR1826954 male paired
#qsub $script phlebotomus_perniciosus SRR2074672 female paired
