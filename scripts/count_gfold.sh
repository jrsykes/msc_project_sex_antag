 #!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 8
#$ -l h_vmem=40G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/gfold

LD_LIBRARY_PATH="/exports/libraries/gsl/1.16/lib/:"$LD_LIBRARY_PATH

#SPECIES=agrilus_planipennis
#SRR1=$SRR1
#SRR2=$SRR2
#
## for creating read count file
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt
#
##for creating a BED file you can feed into gfold count you have to run :
#
#cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed
#
##Gfold analyse difference
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out
#
#SPECIES=anoplophora_glabripennis
#SRR1=SRR1799851
#SRR2=SRR1799852
#
#
## for creating read count file
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt
#
##for creating a BED file you can feed into gfold count you have to run :
#
#cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out
#
#SPECIES=leptinotarsa_decemlineata
#SRR1=SRR1827565
#SRR2=SRR1827566
#
## for creating read count file
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt
#
##for creating a BED file you can feed into gfold count you have to run :
#
#cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out

SPECIES=pachypsylla_venusta
SRR1=SRR1824579
SRR2=SRR1824580

# for creating read count file
samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt

#for creating a BED file you can feed into gfold count you have to run :

cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed

/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out

#SPECIES=planococcus_citric
#SRR1=SRR1
#SRR2=SRR2
#
## for creating read count file
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt
#
##for creating a BED file you can feed into gfold count you have to run :
#
#cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out
#
#SPECIES=planococcus_ficus
#SRR1=SRR3
#SRR2=SRR4
#
## for creating read count file
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt
#+path /exports/libraries/gsl-1.15/; samtools view /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam | /exports/software/gfold/gfold.V1.1.4/gfold count -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/test.bed -tag stdin -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt
#
##for creating a BED file you can feed into gfold count you have to run :
#
#cut -f1-6 /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed | grep -v gff > /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR1.read_cnt -s2 /data/projects/lross_ssa/analyses/$SPECIES/gfold/$SRR2.read_cnt -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/gfold/Trinity1k.fasta.transdecoder.gfold.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold/gfold_out



