#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 24
#$ -l h_vmem=100G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/trinity


# OUTPUT in /scratch/jsykes/ 
# when successfully finished, rsync back
# use ln -s where possible
# use LEFT=$(for file in $(ls -1); do readlink -f $file ;done | paste -sd "," -)
# uncouple download/fastqc 
#parallel -j4 '/exports/software/readbasecount/readbasecount.py {}' ::: *.fq

SPECIES=$1
MODE=$2

alias rsyncdel='mv'
mkdir /scratch/jsykes/trinity_$SPECIES
#SCRATCH=/scratch/jsykes/
#-outdir=$SCRATCH/trinity  

if [ $MODE == 'paired' ]
then
mkdir /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_1
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_1
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_1
LEFT=$(for file in $(ls -1 /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_1); do readlink -f $file ;done | paste -sd "," -)

mkdir /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_2
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*2.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_2
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*2.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_2
RIGHT=$(for file in $(ls -1 /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined_2); do readlink -f $file ;done | paste -sd "," -)

ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq /data/projects/lross_ssa/analyses/temp_out/trinity/
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*.fq /data/projects/lross_ssa/analyses/temp_out/trinity/

echo $LEFT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
echo $RIGHT >> /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt


PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy ; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --left $LEFT --right $RIGHT --CPU 32 --max_memory 100G --output /scratch/jsykes/trinity_$SPECIES && rsync -a /scratch/jsykes/trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/

fi

if [ $MODE == 'single' ]
then

mkdir /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined
ln -s /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined
INPUT=$(for file in $(ls -1 /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combined); do readlink -f $file ;done | paste -sd "," -)


PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --single $INPUT --CPU 32 --max_memory 100G --output /scratch/jsykes/trinity_$SPECIES && rsync -a /scratch/jsykes/trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/

fi


rm -rf /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/combine*
rm -rf /scratch/jsykes/trinity_$SPECIES

###### trim and busco ##########

/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta && module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta -o busco_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/run_busco_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/run_busco_$SPECIES/busco_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_$SPECIES.png


########## blast ##########

mkdir /data/projects/lross_ssa/analyses/$SPECIES/blast 

module load blast
blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn_$SPECIES.out && mv /scratch/jsykes/blastn_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES\_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES.out && touch blast_$SPECIES.done

######### indexing #########

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i $SPECIES\_indexed.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/$SPECIES\_indexed.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/



