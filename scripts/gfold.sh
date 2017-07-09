 #!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 8
#$ -l h_vmem=40G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/gfold

LD_LIBRARY_PATH="/exports/libraries/gsl/1.16/lib/:"$LD_LIBRARY_PATH

SPECIES=$1
SRR1=$2
SRR2=$3

## Identification of likley protien-coding regions in transcripts

/exports/software/transdecoder/TransDecoder-3.0.1/TransDecoder.LongOrfs -t /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --output_dir /data/projects/lross_ssa/analyses/$SPECIES/trinity

/exports/software/transdecoder/TransDecoder-3.0.1/TransDecoder.Predict -t /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --output_dir /data/projects/lross_ssa/analyses/$SPECIES/trinity

### Bowtie

mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2

PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16

## Format .bed file 

tail -n +2 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | cut -f1,2,3,4,5,6 > /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed

# for creating read count file
/exports/software/samtools/samtools-1.3.1/samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
/exports/software/samtools/samtools-1.3.1/samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt

#for creating a BED file you can feed into gfold count you have to run :

cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed

/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out


