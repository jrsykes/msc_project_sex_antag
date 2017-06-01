#!/bin/bash​
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 4
#$ -l h_vmem=10G
#$ -cwd

echo hello world

#Mdify the species name variable
#For every fastq file to be downloaded, unhash the necesary lines and modify the vlaues for the SSR# and sex variables.
#IMPORTANT. Go to fastqc qsub script at /data/projects/lross_ssa/scripts/fastqc.sh and edit acordingly before running this script.

species_name=rhipicephalus_pulchellus
mkdir /data/projects/lross_ssa/raw/$species_name
mkdir /data/projects/lross_ssa/raw/$species_name/male
mkdir /data/projects/lross_ssa/raw/$species_name/female

mkdir /data/projects/lross_ssa/analyses/$species_name
mkdir /data/projects/lross_ssa/analyses/$species_name/fastqc
mkdir /data/projects/lross_ssa/analyses/$species_name/fastqc/male
mkdir /data/projects/lross_ssa/analyses/$species_name/fastqc/female

SRR=SRR521835
sex=male
/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID1=$!

SRR=SRR521944
sex=male
/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID2=$!

SRR=SRR521951
sex=female
/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID3=$!

wait $PID1
wait $PID2
wait $PID3

SRR=SRR521953
sex=female
/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR && echo "Download complete" && qsub /data/projects/lross_ssa/scripts/fastqc.sh & PID4=$!

SRR=SRR1239358
sex=male
#/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID5=$!

SRR=SRR1239354
sex=female
#/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID6=$!

wait $PID4
wait $PID5
wait $PID6

SRR=SRR4043739
sex=male
#/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID7=$!

SRR=SRR4043738
sex=male
#/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID8=$!

SRR=SRR4043738
sex=male
#/exports/software/sratoolkit/sratoolkit.2.8.2-1-ubuntu64/bin/fastq-dump --outdir /data/projects/lross_ssa/raw/$species_name/$sex --defline-seq '@$sn[_$rn]/$ri' --split-files $SRR & PID9=$!

wait $PID7
wait $PID8
wait $PID9

cp /data/projects/lross_ssa/scripts/*.sh.* /data/projects/lross_ssa/raw/$species_name
