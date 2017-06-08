#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 16
#$ -l h_vmem=40G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/map

SPECIES=$1
MODE=$2


if [ $MODE == 'paired' ]
then
mkdir /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*1.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*1.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined

ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*2.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*2.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
INPUT=$(for file in $(ls -1 /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined); do readlink -f $file ;done | paste -)

echo $INPUT > /data/projects/lross_ssa/analyses/temp_out/map/INPUT.txt

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SPECIES\_indexed.idx -o /data/projects/lross_ssa/analyses/$SPECIES/kallisto/ -b 100 $INPUT
rm -rf /data/projects/lross_ssa/analyses/bemisia_tabaci/kallisto/combined
fi

if [ $MODE == 'single' ]
	then
/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SPECIES\_indexed.idx -o /data/projects/lross_ssa/analyses/bemisia_tabaci/kallisto/$SRR -b 100 /data/projects/lross_ssa/analyses/tetranychus_urticae/trimmomatic/$SEX/$SRR\_1.fq /data/projects/lross_ssa/analyses/tetranychus_urticae/trimmomatic/$SEX/$SRR\_2.fq

fi