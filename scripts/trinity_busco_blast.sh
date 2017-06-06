#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 24
#$ -l h_vmem=100G
#$ -wd /data/projects/lross_ssa/analyses/scratch/trinity

species=$1
mode=$2


#if [ $mode == 'paired' ]
#then
#
#mkdir /data/projects/lross_ssa/analyses/scratch/$species
#mkdir /data/projects/lross_ssa/analyses/scratch/$species/links
#ln -s /data/projects/lross_ssa/analyses/$species/trimmomatic/male/* /data/projects/lross_ssa/analyses/scratch/$species/links
#ln -s /data/projects/lross_ssa/analyses/$species/trimmomatic/female/* /data/projects/lross_ssa/analyses/scratch/$species/links
#cat /data/projects/lross_ssa/analyses/scratch/$species/links/*1* > /data/projects/lross_ssa/analyses/scratch/$species/combined_1.fq
#cat /data/projects/lross_ssa/analyses/scratch/$species/links/*2* > /data/projects/lross_ssa/analyses/scratch/$species/combined_2.fq
#
#PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy ; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --left /data/projects/lross_ssa/analyses/scratch/$species/combined_1.fq --right /data/projects/lross_ssa/analyses/scratch/$species/combined_2.fq --CPU 32 --max_memory 100G --output /data/projects/lross_ssa/analyses/$species/trinity/
#
#fi
#
#if [ $mode == 'single' ]
#then
#
#mkdir /data/projects/lross_ssa/analyses/scratch/$species
#mkdir /data/projects/lross_ssa/analyses/scratch/$species/links
#ln -s /data/projects/lross_ssa/analyses/$species/trimmomatic/male/* /data/projects/lross_ssa/analyses/scratch/$species/links
#ln -s /data/projects/lross_ssa/analyses/$species/trimmomatic/female/* /data/projects/lross_ssa/analyses/scratch/$species/links
#cat /data/projects/lross_ssa/analyses/scratch/$species/links/* > /data/projects/lross_ssa/analyses/scratch/$species/combined.fq
#
#
#PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --single /data/projects/lross_ssa/analyses/scratch/$species/combined.fq --CPU 32 --max_memory 100G --output /data/projects/lross_ssa/analyses/$species/trinity/
#fi
#
#rm -rf /data/projects/lross_ssa/analyses/scratch/$species
#
####### trim and busco ##########
#
#/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$species/trinity/Trinity.fasta /data/projects/lross_ssa/analyses/$species/trinity/Trinity1k.fasta && module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$species/trinity/Trinity1k.fasta -o busco_$species -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$species/busco/busco_summaries && cp /data/projects/lross_ssa/analyses/scratch/trinity/run_busco_$species/* /data/projects/lross_ssa/analyses/$species/busco/busco_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$species/busco/busco_summaries && mv /data/projects/lross_ssa/analyses/$species/busco/busco_summaries/busco_figure.png /data/projects/lross_ssa/analyses/$species/busco/busco_summaries/busco_$species.png
#mv /data/projects/lross_ssa/analyses/scratch/trinity/run_busco_$species/ /data/projects/lross_ssa/analyses/$species/busco/busco_summaries
########### blast ##########
#
#mkdir /data/projects/lross_ssa/analyses/$species/trinity/blast 
#
#module load blast
#blastn -task megablast -query /data/projects/lross_ssa/analyses/$species/trinity/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn.out && rsync -avhP /scratch/jsykes/blastn.out /data/projects/lross_ssa/analyses/$species/trinity/blast/blast_out && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$species/trinity/blast/blast_out > /data/projects/lross_ssa/analyses/$species/trinity/blast/blast_out_sorted && rm -f /data/projects/lross_ssa/analyses/$species/trinity/blast/blast_out && touch blast.done

######### indexing #########

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i $species_indexed.idx /data/projects/lross_ssa/analyses/$species/trinity/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/scratch/trinity/$species_indexed.idx /data/projects/lross_ssa/analyses/$species/kallisto/



