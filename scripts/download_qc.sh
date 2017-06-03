#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 3
#$ -l h_vmem=10G
#$ -wd /data/projects/lross_ssa/analyses/scratch


species=$1
SRR=$2
sex=$3
mode=$4

echo -n $SRR | wc -c > SRRn.txt
read SRRn < SRRn.txt ; rm -f SRRn.txt

if [ $mode == 'paired' ]
then
if [ $SRR -eq 9 ]
	then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
	
	elif [ $SRR -eq 10 ]
	then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
	
	elif [ $SRR -eq 11 ]
	then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz

	elif [ $SRR -eq 12 ]
	then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
	else
echo 'Error: command line arguments incorrect'
	fi
elif  $mode == 'single' ]
	then
	if [ $SRRn -eq 9 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz

elif [ $SRRn -eq 10 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz


elif [ $SRRn -eq 11 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz


elif [ $SRRn -eq 12 ]
then
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz
else
echo 'Error: command line arguments incorrect'
fi
fi

gunzip /data/projects/lross_ssa/raw/$species/male/*
gunzip /data/projects/lross_ssa/raw/$species/female/*

