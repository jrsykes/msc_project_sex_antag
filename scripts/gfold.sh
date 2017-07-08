#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 8
#$ -l h_vmem=40G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/gfold

SPECIES=frankliniella_occidentalis/
SRR1=SRR1791267
SRR2=SRR1791269

/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold


#SPECIES=agrilus_planipennis
#SRR1=SRR1791267
#SRR2=SRR1791269
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold
#
#SPECIES=anoplophora_glabripennis
#SRR1=SRR1799851
#SRR2=SRR1799852
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold
#
#
#SPECIES=leptinotarsa_decemlineata
#SRR1=SRR1827565
#SRR2=SRR1827566
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold
#
#SPECIES=pachypsylla_venusta
#SRR1=SRR1824579
#SRR2=SRR1824580
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold
#
#SPECIES=planococcus_citric
#SRR1=SRR1
#SRR2=SRR2
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold
#
#SPECIES=planococcus_ficus
#SRR1=SRR3
#SRR2=SRR4
#
#/exports/software/gfold/gfold.V1.1.4/gfold diff -s1 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1/bowtie.bam -s2 /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2/bowtie.bam -annf BED -ann /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta.transdecoder.bed -o /data/projects/lross_ssa/analyses/$SPECIES/gfold
