#This script runs trimmomatic on the downloaded libraries and then re-runs fastqc to ensure that trimmomatic has run correctly.
#To run this script first edit the qsub commands below as per the example then use the command ' bash master_trim.sh ' 
#The order of the command line arguments to be edited are specified below.
#All qsub commands can be submitted simultaneously.
#Once trimming is complete run trinity_busco_blast.sh as follows: qsub trinity_busco_blast.sh <species_name> <paired or single>
#Nothing needs to be edited in tinity_busco_blast.sh as it is not a master script. 
#Simply specify the species name and whether the reads are paired or single end.
#If you have both paired and single end read libraries for one species, run tinity_busco_blast.sh twice, once in paired mode and one in single mode.
#These two jobs will converge in the mapping stage automatically.
#Once tinity_busco_bast.sh has finished run master_map.sh


script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode


qsub $script rhizoglyphus_robini SRR3934324 female single
qsub $script rhizoglyphus_robini SRR3934325 female single
qsub $script rhizoglyphus_robini SRR3934332 female single
qsub $script rhizoglyphus_robini SRR3934333 female single
qsub $script rhizoglyphus_robini SRR3934334 female single
qsub $script rhizoglyphus_robini SRR3934335 female single
qsub $script rhizoglyphus_robini SRR3934336 female single
qsub $script rhizoglyphus_robini SRR3934337 female single
qsub $script rhizoglyphus_robini SRR946953 female paired
qsub $script rhizoglyphus_robini SRR3934326 male single
qsub $script rhizoglyphus_robini SRR3934327 male single
qsub $script rhizoglyphus_robini SRR3934328 male single
qsub $script rhizoglyphus_robini SRR3934329 male single
qsub $script rhizoglyphus_robini SRR3934330 male single
qsub $script rhizoglyphus_robini SRR3934331 male single
qsub $script rhizoglyphus_robini SRR3934338 male single
qsub $script rhizoglyphus_robini SRR3934339 male single