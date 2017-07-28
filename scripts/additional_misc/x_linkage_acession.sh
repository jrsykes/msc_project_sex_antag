
# How many x-linked genes are there?

grep -v '^#' NR55E280014-Alignment.txt | cut -f4 | sort | uniq -c | less

# Getting x-linked contig ids

grep TRINITY* NR55E280014-Alignment.txt | grep -v Query > blast.out

awk '$4=="NC_006157.1"' blast.out | cut -f1 > x-linked_contig_ids.txt

# Filtering out non-x-linked contigs from abundance .tsv file

grep -v -wFf x-linked_contig_ids.txt ../kallisto/SRR1824579/abundance.tsv > ../kallisto/SRR1824579/x-linked_abundance.tsv
