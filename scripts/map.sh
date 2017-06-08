#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=20G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/map

SPECIES=$1
SRR=$2
SEX=$3
MODE=$4

if [ $MODE == 'paired' ]
	then

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SPECIES\_indexed.idx -o /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SRR -b 100 /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/$SEX/$SRR\_1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/$SEX/$SRR\_2.fq

fi

if [ $MODE == 'single' ]
	then
/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SPECIES\_indexed.idx -o /data/projects/lross_ssa/analyses/bemisia_tabaci/kallisto/$SRR -b 100 /data/projects/lross_ssa/analyses/tetranychus_urticae/trimmomatic/$SEX/$SRR\_1.fq /data/projects/lross_ssa/analyses/tetranychus_urticae/trimmomatic/$SEX/$SRR\_2.fq

fi