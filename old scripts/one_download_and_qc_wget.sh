#!/bin/bash​
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 2
#$ -l h_vmem=10G
#$ -cwd

#Mdify the species name variable
#For every fastq file to be downloaded, unhash the necesary lines and modify the vlaues for the SSR# and sex variables.
#IMPORTANT. Go to fastqc qsub script at /data/projects/lross_ssa/scripts/fastqc.sh and edit acordingly before running this script.

species=$1
SRR=$2
sex=$3

echo -n $SRR | wc -c > SRRn.txt
read SRRn < SRRn.txt ; rm -f SRRn.txt

if [ $SRRn -eq 9 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

if [ $SRRn -eq 10 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

if [ $SRRn -eq 11 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi

if [ $SRRn -eq 12 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
fi



