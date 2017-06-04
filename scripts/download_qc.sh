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

echo -n $SRR | wc -c > $SRR\n.txt
read SRRn < $SRR\n.txt ; rm -f $SRR\n.txt

if [ $mode == 'paired' ]
then
if [ $SRRn -eq 9 ]
	then
echo 1 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
echo 2 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
	
	elif [ $SRRn -eq 10 ]
	then
echo 3 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
echo 4 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
	
	elif [ $SRRn -eq 11 ]
	then
echo 5 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
echo 6 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz

	elif [ $SRRn -eq 12 ]
	then
echo 7 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_1.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq.gz
echo 8 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR\_2.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq.gz
	else
echo 'Error: command line arguments incorrect'
	fi
elif [ $mode == 'single' ]
	then
	if [ $SRRn -eq 9 ]
then
echo 9 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz

elif [ $SRRn -eq 10 ]
then
echo 10 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/00${SRR:9:11}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz
elif [ $SRRn -eq 11 ]
then
echo 11 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/0${SRR:9:12}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz

elif [ $SRRn -eq 12 ]
then
echo 12 #wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${SRR:0:6}/${SRR:9:13}/$SRR/$SRR.fastq.gz -O /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc/$sex /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq.gz
else
echo 'Error: command line arguments incorrect'
fi
fi

gunzip /data/projects/lross_ssa/raw/$species/male/*
gunzip /data/projects/lross_ssa/raw/$species/female/*

