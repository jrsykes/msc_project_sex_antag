#!/bin/bash​
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=10G
#$ -cwd

#Mdify the species name variable
#For every fastq file to be downloaded, unhash the necesary lines and modify the vlaues for the SSR# and sex variables.
#IMPORTANT. Go to fastqc qsub script at /data/projects/lross_ssa/scripts/fastqc.sh and edit acordingly before running this script.

species=ericerus_pela
mkdir /data/projects/lross_ssa/raw/$species
mkdir /data/projects/lross_ssa/raw/$species/male
mkdir /data/projects/lross_ssa/raw/$species/female

#mkdir /data/projects/lross_ssa/analyses/$species
#mkdir /data/projects/lross_ssa/analyses/$species/fastqc
#mkdir /data/projects/lross_ssa/analyses/$species/fastqc/male
#mkdir /data/projects/lross_ssa/analyses/$species/fastqc/female

SRR=SRR1027689
sex=male
echo -n $SRR | wc -c > SRRn.txt
read SRRn < SRRn.txt ; rm -f SRRn.txt

if [ $SRRn=9 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_1.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_2.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

if [ $SRRn=10 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/YES/$SRR/$SRR\_1.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_2.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

if [ $SRRn=11 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_1.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_2.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

if [ $SRRn=12 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_1.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_2.fastq.gz > /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

gunzip /data/projects/lross_ssa/raw/$species/male/*
gunzip /data/projects/lross_ssa/raw/$species/female/*

cp /data/projects/lross_ssa/scripts/*.sh.* /data/projects/lross_ssa/raw/$species

#qsub /data/projects/lross_ssa/scripts/fastqc.sh


