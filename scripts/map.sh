#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=10G
#$ -cwd




/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto quant -t 16 -i transcripts_65_67_78.idx -o SRR5377265 -b 100 SRR5377265_forward_paired.fq.gz SRR5377265_reverse_paired.fq.gz