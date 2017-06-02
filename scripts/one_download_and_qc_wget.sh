#!/bin/bash​
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=10G
#$ -cwd

#Mdify the species name variable
#For every fastq file to be downloaded, unhash the necesary lines and modify the vlaues for the SSR# and sex variables.
#IMPORTANT. Go to fastqc qsub script at /data/projects/lross_ssa/scripts/fastqc.sh and edit acordingly before running this script.

species=$1

mkdir /data/projects/lross_ssa/raw/$species
mkdir /data/projects/lross_ssa/raw/$species/male
mkdir /data/projects/lross_ssa/raw/$species/female

#mkdir /data/projects/lross_ssa/analyses/$species
#mkdir /data/projects/lross_ssa/analyses/$species/fastqc
#mkdir /data/projects/lross_ssa/analyses/$species/fastqc/male
#mkdir /data/projects/lross_ssa/analyses/$species/fastqc/female

########################SRR1
SRR1=$2
sex1=$3

echo -n $SRR1 | wc -c > SRR1n.txt
read SRR1n < SRR1n.txt ; rm -f SRR1n.txt

if [ $SRR1n -eq 9 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/$SRR1/$SRR1\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/$SRR1/$SRR1\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_2.fastq.gz
fi

if [ $SRR1n -eq 10 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/00${SRR1:9:11}/$SRR1/$SRR1\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/00${SRR1:9:11}/$SRR1/$SRR1\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_2.fastq.gz
fi

if [ $SRR1n -eq 11 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/0${SRR1:9:12}/$SRR1/$SRR1\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/0${SRR1:9:12}/$SRR1/$SRR1\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_2.fastq.gz
fi

if [ $SRR1n -eq 12 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/${SRR1:9:13}/$SRR1/$SRR1\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR1:0:6}/${SRR1:9:13}/$SRR1/$SRR1\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex1/$SRR1\_2.fastq.gz
fi

########################SRR2
SRR2=$4
sex2=$5

echo -n $SRR2 | wc -c > SRR2n.txt
read SRR2n < SRR2n.txt ; rm -f SRR2n.txt

if [ $SRR2n -eq 9 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/$SRR2/$SRR2\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/$SRR2/$SRR2\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_2.fastq.gz
fi

if [ $SRR2n -eq 10 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/00${SRR2:9:11}/$SRR2/$SRR2\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/00${SRR2:9:11}/$SRR2/$SRR2\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_2.fastq.gz
fi

if [ $SRR2n -eq 11 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/0${SRR2:9:12}/$SRR2/$SRR2\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/0${SRR2:9:12}/$SRR2/$SRR2\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_2.fastq.gz
fi

if [ $SRR2n -eq 12 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/${SRR2:9:13}/$SRR2/$SRR2\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR2:0:6}/${SRR2:9:13}/$SRR2/$SRR2\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex2/$SRR2\_2.fastq.gz
fi


gunzip /data/projects/lross_ssa/raw/$species/male/*
gunzip /data/projects/lross_ssa/raw/$species/female/*

cp /data/projects/lross_ssa/scripts/*.sh.* /data/projects/lross_ssa/raw/$species

#qsub /data/projects/lross_ssa/scripts/fastqc.sh


