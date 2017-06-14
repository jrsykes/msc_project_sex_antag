

species=$1

if [ $species == ' ' ]
then
echo 'Enter species name at \command line'
exit 
fi

mkdir /data/projects/lross_ssa/raw/$species
mkdir /data/projects/lross_ssa/raw/$species/male
mkdir /data/projects/lross_ssa/raw/$species/female

mkdir /data/projects/lross_ssa/analyses/$species
mkdir /data/projects/lross_ssa/analyses/$species/fastqc
mkdir /data/projects/lross_ssa/analyses/$species/fastqc2

mkdir /data/projects/lross_ssa/analyses/$species/trinity
mkdir /data/projects/lross_ssa/analyses/$species/busco
mkdir /data/projects/lross_ssa/analyses/$species/kallisto

mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic/male
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic/female


## one = species, two = SRR, three = sex, four = paired or single end mode

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/download_qc.sh

 
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
qsub $script dendroctonus_ponderosae SRR867433 male paired
qsub $script dendroctonus_ponderosae SRR867434 male paired
#qsub $script dendroctonus_ponderosae SRR867436 male paired
#qsub $script dendroctonus_ponderosae SRR867438 male paired
#qsub $script dendroctonus_ponderosae SRR867439 male paired
#qsub $script dendroctonus_ponderosae SRR867440 male paired
#
#qsub $script amblyomma_americanum SRR1027770 female paired  
#qsub $script amblyomma_americanum SRR1027769 male paired 
#qsub $script amblyomma_americanum SRR1027768 male paired 
#qsub $script amblyomma_americanum SRR1027767 male paired 
#qsub $script amblyomma_americanum SRR1027763 male paired 
#qsub $script amblyomma_americanum SRR1027485 male paired 
#qsub $script amblyomma_americanum SRR1027483 male paired 
#
#qsub $script tropilaelaps_mercedesae SRR4294671 female paired 
#qsub $script tropilaelaps_mercedesae SRR4294670 female paired 
#qsub $script tropilaelaps_mercedesae SRR4294669 male paired 
#qsub $script tropilaelaps_mercedesae SRR4294668 male paired 














