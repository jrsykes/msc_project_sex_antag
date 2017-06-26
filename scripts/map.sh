#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 2
#$ -l h_vmem=40G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/map

########## 	EDIT THE READ_LENGTH AND SD VARIABLES IF RUNNING IN SINGLE END OR BOTH MODE ################
READ_LENGTH=165
SD=92.8
################################################################################################

SPECIES=$1
SRR=$2
SEX=$3
MODE=$4


mkdir /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SRR
mkdir /scratch/jsykes/map_$SRR

if [ $MODE == 'paired' ]
then

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$SPECIES/kallisto/paired_$SPECIES.idx -o /scratch/jsykes/map_$SRR/$SRR -b 100 /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/$SEX/$SRR\_1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/$SEX/$SRR\_2.fq


elif [ $MODE == 'single' ]
	then
/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$SPECIES/kallisto/single_$SPECIES.idx -o /scratch/jsykes/map_$SRR/$SRR -b 100 --single -l $READ_LENGTH -s $SD /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/$SEX/$SRR\_s.fq

fi

rsync -a /scratch/jsykes/map_$SRR/$SRR /data/projects/lross_ssa/analyses/$SPECIES/kallisto
rm -rf /scratch/jsykes/map_$SRR

####### setting up files for sleuth #########

mkdir /data/projects/lross_ssa/analyses/$SPECIES/kallisto/kal_results
touch /data/projects/lross_ssa/analyses/$SPECIES/kallisto/kal_results/hiseq_info.txt

mkdir /data/projects/lross_ssa/analyses/$SPECIES/kallisto/kal_results/kal_files
ln -s /data/projects/lross_ssa/analyses/$SPECIES/kallisto/$SRR /data/projects/lross_ssa/analyses/$SPECIES/kallisto/kal_results/kal_files/$SRR


#### combined method. To be used for libraries composed of mutiple runs.

#mkdir /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
#ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*1.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
#ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*1.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
#
#ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*2.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
#ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*2.fq /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined
#INPUT=$(for file in $(ls -1 /data/projects/lross_ssa/analyses/$SPECIES/kallisto/combined); do readlink -f $file ;done | paste -)
#
#ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq /data/projects/lross_ssa/analyses/temp_out/map/
#ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*.fq /data/projects/lross_ssa/analyses/temp_out/map/

#echo $INPUT > /data/projects/lross_ssa/analyses/temp_out/map/INPUT.txt
















