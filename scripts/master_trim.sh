

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script ceratosolen_solmsi SRR974925 female paired 
qsub $script ceratosolen_solmsi SRR974929 female paired
qsub $script ceratosolen_solmsi SRR974927 female paired
qsub $script ceratosolen_solmsi SRR974928 male paired
qsub $script ceratosolen_solmsi SRR974926 male paired


qsub $script frankliniella_occidentalis SRR1826956 female paired
qsub $script frankliniella_occidentalis SRR1826954 male paired

#qsub $script phlebotomus_perniciosus SRR2074672 female paired
