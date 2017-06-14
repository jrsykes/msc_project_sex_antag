#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 24
#$ -l h_vmem=100G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/trinity

#parallel -j4 '/exports/software/readbasecount/readbasecount.py {}' ::: *.fq

SPECIES=$1
MODE=$2


mkdir /scratch/jsykes/trinity_$SPECIES


if [ $MODE == 'paired' ]
then

########### both paired ###########

LEFT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*_1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*_1.fq); do readlink -f $file; done | paste -sd "," - )
echo $LEFT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
RIGHT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*_2.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*_2.fq); do readlink -f $file; done | paste -sd "," - )
echo $RIGHT >> /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt

PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy ; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --left $LEFT --right $RIGHT --CPU 32 --max_memory 100G --output /scratch/jsykes/paired_trinity_$SPECIES && rsync -a /scratch/jsykes/paired_trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired

###### filter < 1000 bp ##########

/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity_1k.fasta && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta

###### busco ##########

module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta -o busco_paired_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_paired_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries/run_busco_paired_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries/run_busco_paired_$SPECIES/busco_paired_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_$SPECIES.png && rm -rf /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries


########## blast ##########

mkdir /data/projects/lross_ssa/analyses/$SPECIES/blast 

module load blast
blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn_paired_$SPECIES.out && mv /scratch/jsykes/blastn_paired_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_paired_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/$SPECIES\_blastn_paired_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_paired_$SPECIES.out && touch paired_blast_$SPECIES.done

######### indexing #########

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i paired_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/paired_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/

elif [ $MODE == 'single' ]
then

########### both single ############

INPUT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*\_s.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq); do readlink -f $file; done | paste -sd "," - )
echo $INPUT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt

PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --single $INPUT --CPU 32 --max_memory 100G --output /scratch/jsykes/single_trinity_$SPECIES && rsync -a /scratch/jsykes/single_trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/single


###### filter < 1000 bp ##########

/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity.fasta

###### busco ##########

module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta -o busco_single_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_single_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries/run_busco_single_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries/run_busco_single_$SPECIES/busco_single_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_$SPECIES.png && rm -rf /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries


########## blast ##########

module load blast
blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn_single_$SPECIES.out && mv /scratch/jsykes/blastn_single_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_single_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/$SPECIES\_blastn_single_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_single_$SPECIES.out && touch single_blast_$SPECIES.done

######### indexing #########

/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i single_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/single_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/

fi

rm -rf /scratch/jsykes/trinity_$SPECIES












#SPECIES=$1
#MODE=$2
#
#
#mkdir /scratch/jsykes/trinity_$SPECIES
# 
#
#if [ $MODE == 'paired' ]
#then
#
#LEFT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*_1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*_1.fq); do readlink -f $file; done | paste -sd "," - )
#echo $LEFT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
#RIGHT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*_2.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*_2.fq); do readlink -f $file; done | paste -sd "," - )
#echo $RIGHT >> /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
#
#
#PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy ; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --left $LEFT --right $RIGHT --CPU 32 --max_memory 100G --output /scratch/jsykes/trinity_$SPECIES && rsync -a /scratch/jsykes/trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/
#
####### filter < 1000 bp ##########
#
#/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta
#
####### busco ##########
#
#module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta -o paired_busco_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_paired_busco_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/run_busco_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/run_paired_busco_$SPECIES/busco_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/paired_busco_$SPECIES.png && rm -rf /data/projects/lross_ssa/analyses/$SPECIES/busco/paired_busco_summaries
#
#
########### blast ##########
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/blast 
#
#module load blast
#blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/paired_blastn_$SPECIES.out && mv /scratch/jsykes/paired_blastn_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/$SPECIES\_blastn_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES.out && touch blast_$SPECIES.done
#
########## indexing #########
#
#/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i paired_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/paired_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/
#
#
#elif [ $MODE == 'single' ]
#then
#
#INPUT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*\_s.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq); do readlink -f $file; done | paste -sd "," - )
#echo $INPUT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
#
#
#PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --single $INPUT --CPU 32 --max_memory 100G --output /scratch/jsykes/trinity_$SPECIES && rsync -a /scratch/jsykes/trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/
#
#
####### filter < 1000 bp ##########
#
#/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta  && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta
#
####### busco ##########
#
#module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta -o busco_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/run_busco_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries/run_busco_$SPECIES/busco_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_$SPECIES.png && rm -rf /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_summaries
#
#
########### blast ##########
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/blast 
#
#module load blast
#blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn_$SPECIES.out && mv /scratch/jsykes/blastn_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/$SPECIES\_blastn_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_$SPECIES.out && touch blast_$SPECIES.done
#
########## indexing #########
#
#/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i single_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/single_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/
#
#
#elif [ $MODE == 'both']
#then
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/trinity/single
#
############ both paired ###########
#
#LEFT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*_1.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*_1.fq); do readlink -f $file; done | paste -sd "," - )
#echo $LEFT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
#RIGHT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*_2.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*_2.fq); do readlink -f $file; done | paste -sd "," - )
#echo $RIGHT >> /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
#
#PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy ; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --left $LEFT --right $RIGHT --CPU 32 --max_memory 100G --output /scratch/jsykes/paired_trinity_$SPECIES && rsync -a /scratch/jsykes/paired_trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired
#
####### filter < 1000 bp ##########
#
#/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity_1k.fasta && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity.fasta
#
####### busco ##########
#
#module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta -o busco_paired_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_paired_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries/run_busco_paired_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries/run_busco_paired_$SPECIES/busco_paired_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_$SPECIES.png && rm -rf /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_paired_summaries
#
#
########### blast ##########
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/blast 
#
#module load blast
#blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn_paired_$SPECIES.out && mv /scratch/jsykes/blastn_paired_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_paired_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/$SPECIES\_blastn_paired_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_paired_$SPECIES.out && touch paired_blast_$SPECIES.done
#
########## indexing #########
#
#/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i paired_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/paired_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/
#
############ both single ############
#
#INPUT=$(for file in $(ls /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/*\_s.fq /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/*.fq); do readlink -f $file; done | paste -sd "," - )
#echo $INPUT > /data/projects/lross_ssa/analyses/temp_out/trinity/path.txt
#
#PATH=$PATH:/exports/software/bowtie/bowtie2-2.3.2-legacy; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/Trinity --seqType fq --single $INPUT --CPU 32 --max_memory 100G --output /scratch/jsykes/single_trinity_$SPECIES && rsync -a /scratch/jsykes/single_trinity_$SPECIES/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/single
#
#
####### filter < 1000 bp ##########
#
#/data/projects/lross_ssa/scripts/faFilter -minSize=1000 /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity.fasta /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta && rm -f /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity.fasta
#
####### busco ##########
#
#module load blast ; PATH=$PATH:/exports/software/hmmer/hmmer-3.1b1/bin/ ; python /exports/software/busco/busco-v2.0.1/BUSCO.py -f -i /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta -o busco_single_$SPECIES -l /exports/software/busco/arthropoda -m tran -c 16 -sp fly && mkdir /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries && mv /data/projects/lross_ssa/analyses/temp_out/trinity/run_busco_single_$SPECIES /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries && python /exports/software/busco/busco-v2.0.1/BUSCO_plot.py -wd /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries/run_busco_single_$SPECIES && mv /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries/run_busco_single_$SPECIES/busco_single_figure.png /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_$SPECIES.png && rm -rf /data/projects/lross_ssa/analyses/$SPECIES/busco/busco_single_summaries
#
#
########### blast ##########
#
#module load blast
#blastn -task megablast -query /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta -db /exports/blast_db/nt -outfmt '6 qseqid staxids bitscore std' -culling_limit 5 -num_threads 64 -evalue 1e-25 -out /scratch/jsykes/blastn_single_$SPECIES.out && mv /scratch/jsykes/blastn_single_$SPECIES.out /data/projects/lross_ssa/analyses/$SPECIES/blast/ && sort -k 13,13 -n /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_single_$SPECIES.out > /data/projects/lross_ssa/analyses/$SPECIES/blast/$SPECIES\_blastn_single_sorted.out && rm -f /data/projects/lross_ssa/analyses/$SPECIES/blast/blastn_single_$SPECIES.out && touch single_blast_$SPECIES.done
#
########## indexing #########
#
#/exports/software/kallisto/kallisto_linux-v0.43.1/kallisto index -i single_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/trinity/single/Trinity1k.fasta && mv /data/projects/lross_ssa/analyses/temp_out/trinity/single_$SPECIES.idx /data/projects/lross_ssa/analyses/$SPECIES/kallisto/
#
#fi
#
#rm -rf /scratch/jsykes/trinity_$SPECIES




