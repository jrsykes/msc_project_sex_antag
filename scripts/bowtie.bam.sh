
#!/bin/bash
#$ -S /bin/bash
#$ -q main.q
#$ -pe smp 8
#$ -l h_vmem=40G
#$ -wd /data/projects/lross_ssa/analyses/temp_out/gfold

#SPECIES=agrilus_planipennis
#SRR1=$SRR1
#SRR2=$SRR2

#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2

#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16

SPECIES=anoplophora_glabripennis
SRR1=SRR1799851
SRR2=SRR1799852

mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2

PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right //data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16


SPECIES=leptinotarsa_decemlineata
SRR1=SRR1827565
SRR2=SRR1827566

mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2

PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16

#SPECIES=pachypsylla_venusta
#SRR1=SRR1824579
#SRR2=SRR1824580
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2
#
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/Trinity1k.fasta --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16
#
#SPECIES=planococcus_citric
#SRR1=SRR1
#SRR2=SRR2
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2
#
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired_assembly_1k.fa --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired_assembly_1k.fa --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16
#
#SPECIES=planococcus_ficus
#SRR1=SRR3
#SRR2=SRR4
#
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1
#mkdir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2
#
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired_assembly_1k.fa --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/female/$SRR1\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR1 --thread_count 16
#PATH=$PATH:/exports/software/bowtie/bowtie-1.2-legacy:/exports/software/rsem/RSEM-1.3.0:/exports/software/samtools/samtools-1.1; /exports/software/trinity/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --transcripts /data/projects/lross_ssa/analyses/$SPECIES/trinity/paired_assembly_1k.fa --seqType fq --left /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_1.fq --right /data/projects/lross_ssa/analyses/$SPECIES/trimmomatic/male/$SRR2\_2.fq --est_method RSEM --aln_method bowtie --trinity_mode --coordsort_bam --prep_reference --output_dir /data/projects/lross_ssa/analyses/$SPECIES/rsem_outdir/$SRR2 --thread_count 16






