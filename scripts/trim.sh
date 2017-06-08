#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=10G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/trim

species=$1
SRR=$2
sex=$3
mode=$4

#/exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc2 /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_1.fq /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_2.fq

#### SINGLE END MODE ####
if [ $mode == "single" ]
then
java -jar /exports/software/trimmomatic/Trimmomatic-0.36/trimmomatic-0.36.jar SE -phred33 /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR.fq ILLUMINACLIP:/exports/software/trimmomatic/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 HEADCROP:12 && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc2 /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR.fq && rm -f /data/projects/lross_ssa/raw/$species/$sex/$SRR.fastq
#### PAIRED END MODE ####
elif [ $mode == "paired" ]
then
java -jar /exports/software/trimmomatic/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_1.fq /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_forward_unpaired.fq.gz /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_2.fq /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_reverse_unpaired.fq.gz ILLUMINACLIP:/exports/software/trimmomatic/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 HEADCROP:12 && /exports/software/fastqc/fastqc_v0.11.5/FastQC/fastqc --outdir /data/projects/lross_ssa/analyses/$species/fastqc2 /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_1.fq /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_2.fq && rm -f /data/projects/lross_ssa/raw/$species/$sex/$SRR\_1.fastq && rm -f /data/projects/lross_ssa/raw/$species/$sex/$SRR\_2.fastq

rm -f /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_forward_unpaired.fq.gz ; rm -f /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_reverse_unpaired.fq.gz

sed 's/_F\/1/_1/g' /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_1.fq | sed 's/_f\/1/_1/g' | sed 's/_forward\/1/_1/g' | sed 's/_Forward\/1/_1/g' # > /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_1.fq && rm -f /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_11.fq
sed 's/_R\/2/_2/g' /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_2.fq | sed 's/_r\/2/_2/g' | sed 's/_reverse\/2/_2/g' | sed 's/_Reverse\/2/_2/g' # > /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_2.fq && rm -f /data/projects/lross_ssa/analyses/$species/trimmomatic/$sex/$SRR\_22.fq

else echo 'Error in mode selection at command line'
fi





