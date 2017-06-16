# BLOBTOOLS

#https://blobtools.readme.io/

# Activate blob tools virtenv
source /exports/virt_env/python/blobtools/bin/activate

# extracting coverage from kallisto's abundance TSV
for dir in kallisto/SRR*; do echo $dir; cut -f1,5 $dir/abundance.tsv | grep -v target > $dir.cov; done

# Creating a blobDB  
/exports/software/blobtools/blobtools create -i trinity/Trinity1k.fasta -t blast/blastn_varroa_destructor_sorted.out -c kallisto/SRR5377268.cov -c kallisto/SRR5377268.cov -c kallisto/SRR5377268.cov -o blobplot

# Extracting a "view" table
/exports/software/blobtools/blobtools view -i blobplot.blobDB.json --rank all --hits

# Making blobplots (not really necessary)
/exports/software/blobtools/blobtools plot -i blobplot.blobDB.json && rm -f *[0-9].png

# Getting a distribution of kingdoms/phyla
# Phylum
grep -v '^#' blobplot.blobDB.table.txt | cut -f13 | sort | uniq -c | less ### phylum.t.
# Kingdom
grep -v '^#' blobplot.blobDB.table.txt | cut -f9 | sort | uniq -c | less ### superkingdom.t.

# Look at those that were annotated as Viruses 
awk '$9=="Viruses"' blobplot.blobDB.table.txt | less
awk '$13=="Streptophyta"' blobplot.blobDB.table.txt | less

awk '$9=="Viruses"' blobplot.blobDB.table.txt | cut -f1 > viruses.contig_ids.txt
awk '$13=="Streptophyta"' blobplot.blobDB.table.txt | cut -f1 > streptophyta.contig_ids.txt

# Filtering abundance before SLEUTH
grep -v -wFf viruses.contig_ids.txt kallisto/SRR5377268/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > kallisto/SRR5377268/abundance.filtered.tsv


# deactivate blob tools virtenv
deactivate


