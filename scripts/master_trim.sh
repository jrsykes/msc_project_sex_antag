

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script phlebotomus_perniciosus SRR2075602 male paired
qsub $script phlebotomus_perniciosus SRR2075601 male paired
qsub $script phlebotomus_perniciosus SRR2074666 male paired
qsub $script phlebotomus_perniciosus SRR2075600 female paired
qsub $script phlebotomus_perniciosus SRR2075599 female paired
qsub $script phlebotomus_perniciosus SRR2074672 female paired


#qsub $script teleopsis_dalmanni SRR1184537 male paired
#qsub $script teleopsis_dalmanni SRR1184533 male paired