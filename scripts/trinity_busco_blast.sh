#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 24
#$ -l h_vmem=100G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/trinity


SPECIES=$1
MODE=$2

# OUTPUT in /scratch/jsykes/ 
# when successfully finished, rsync back
# use ln -s where possible
# use LEFT=$(for file in $(ls -1); do readlink -f $file ;done | paste -sd "," -)
# uncouple download/fastqc 
#parallel -j4 '/exports/software/readbasecount/readbasecount.py {}' ::: *.fq

alias rsyncdel='rsync -a --remove-source-files'
mkdir /scratch/jsykes/trinity_$SPECIES
#SCRATCH=/scratch/jsykes/
#-outdir=$SCRATCH/trinity  

ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq /data/projects/lross_ssa/analyses/temp_out/trinity
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*.fq /data/projects/lross_ssa/analyses/temp_out/trinity

if [ $MODE == 'paired' ]
then

mkdir /scratch/jsykes/trinity_links_$SPECIES_left_$SPECIES
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*1.fq /scratch/jsykes/trinity_links_$SPECIES_left_$SPECIES
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*1.fq /scratch/jsykes/trinity_links_$SPECIES_left_$SPECIES
LEFT=$(for file in $(ls -1 /scratch/jsykes/trinity_links_$SPECIES_left_$SPECIES); do readlink -f $file ;done | paste -sd "," -)

mkdir /scratch/jsykes/trinity_links_$SPECIES_right_$SPECIES
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*2.fq /scratch/jsykes/trinity_links_$SPECIES_right_$SPECIES
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*2.fq /scratch/jsykes/trinity_links_$SPECIES_right_$SPECIES
RIGHT=$(for file in $(ls -1 /scratch/jsykes/trinity_links_$SPECIES_right_$SPECIES); do readlink -f $file ;done | paste -sd "," -)

mkdir /scratch/jsykes/$SPECIES
PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy ; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --left $LEFT --right $RIGHT --CPU 32 --max_memory 100G --output /scratch/jsykes/trinity_$SPECIES && rsync -a /scratch/jsykes/trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/
rm -rf /scratch/jsykes/trinity_links_$SPECIES_*
fi

if [ $MODE == 'single' ]
then

mkdir /scratch/jsykes/trinity_links_$SPECIES
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/.fq /scratch/jsykes/trinity_links_$SPECIES
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/.fq /scratch/jsykes/trinity_links_$SPECIES
INPUT=$(for file in $(ls -1 /scratch/jsykes/trinity_links_$SPECIES); do readlink -f $file ;done | paste -sd "," -)

mkdir /scratch/jsykes/$SPECIES
PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --single $INPUT --CPU 32 --max_memory 100G --output /scratch/jsykes/trinity_$SPECIES && rsync -a /scratch/jsykes/trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/
rm -rf /scratch/jsykes/trinity_links_$SPECIES
fi

rm -f /data/projects/lross_ssa/analyses/temp_out/trinity/*.fq
rm -rf /scratch/jsykes/trinity_$SPECIES
###### trim and busco ##########

/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta && module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta -o busco_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && rsync -a /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_$SPECIES/* /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/busco_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/busco_$SPECIES.png && gzip /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/* && gzip /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*
rsyncdel /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_$SPECIES/ /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries
########## blast ##########

mkdir /data/projects/lross_ssa/analyses/$SPECIES/trinity/blast 

module load blast
blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn.out && rsyncdel -avhP /scratch/jsykes/blastn.out /data/projects/lross_ssa/analyses/$SPECIES/trinity/blast/blast_out && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/trinity/blast/blast_out > /data/projects/lross_ssa/analyses/$SPECIES/trinity/blast/blast_out_sorted && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/blast/blast_out && touch blast.done

######### indexing #########

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i $SPECIES\_indexed.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta && rsync -a /data/projects/lross_ssa/analyses/temp_out/trinity_$SPECIES\_indexed.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/



