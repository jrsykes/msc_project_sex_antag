#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=10G
#$ -cwd

species=$1
SRR=$2
sex=$3

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i /data/projects/lross_ssa/analyses/$species/kallisto/$species\_indexed.idx -o $SRR -b 100 /data/projects/lross_ssa/analyses/tetranychus_urticae/trimmomatic/$sex/$SRR\_1.fq.gz /data/projects/lross_ssa/analyses/tetranychus_urticae/trimmomatic/$sex/$SRR\_2.fq.gz


/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i $species\_indexed.idx /data/projects/lross_ssa/analyses/$species/trinity/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/scratch/trinity/$species\_indexed.idx /data/projects/lross_ssa/analyses/$species/kallisto/
