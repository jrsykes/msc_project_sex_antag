# BLOBTOOLS

#https://blobtools.readme.io/

# Activate blob tools virtenv
source /exports/virt_env/python/blobtools/bin/activate

# extracting coverage from kallisto's abundance TSV
for dir in kallisto/SRR*; do echo $dir; cut -f1,5 $dir/abundance.tsv | grep -v target > $dir.cov; done

#Ensure that the arguments trinity/*, blast/* and -c *.cov in the following line are correct.
# Creating a blobDB  
/exports/software/blobtools/blobtools create -i trinity/Trinity1k.fasta -t blast/tetranychus_urticae_blastn_sorted.out  -o blobplot -c kallisto/SRR4043743.cov -c kallisto/SRR4043742.cov #-c kallisto/SRR949075.cov #-c kallisto/SRR3934333.cov -c kallisto/SRR3934334.cov -c kallisto/SRR3934335.cov -c kallisto/SRR3934336.cov -c kallisto/SRR3934337.cov -c kallisto/SRR3934326.cov -c kallisto/SRR3934327.cov -c kallisto/SRR3934328.cov -c kallisto/SRR3934329.cov -c kallisto/SRR3934330.cov -c kallisto/SRR3934331.cov -c kallisto/SRR3934338.cov -c kallisto/SRR3934339.cov #-c kallisto/SRR1566026.cov -c kallisto/SRR1566025.cov 

# Extracting a "view" table
/exports/software/blobtools/blobtools view -i blobplot.blobDB.json --rank all --hits

# Making blobplots (not really necessary)
#/exports/software/blobtools/blobtools plot -i blobplot.blobDB.json && rm -f *[0-9].png

mkdir blobtools
mv blob* blobtools/
cd blobtools

# deactivate blob tools virtenv
deactivate

#Open blobplot.blobDB.table.txt useing less and find the numbers next to superkingdom.t and phylum.t
#Use these numbers to edit the following six lines of code accordingly.

# Getting a distribution of kingdoms/phyla
# Kingdom
grep -v '^#' blobplot.blobDB.table.txt | cut -f8 | sort | uniq -c | less ### superkingdom.t.
# Phylum
grep -v '^#' blobplot.blobDB.table.txt | cut -f12 | sort | uniq -c | less ### phylum.t.

# Look at those that were annotated as Viruses 
awk '$8=="Viruses"' blobplot.blobDB.table.txt | less
awk '$12=="Streptophyta"' blobplot.blobDB.table.txt | less


# Filtering abundance before SLEUTH
awk '$8=="Viruses"' blobplot.blobDB.table.txt | cut -f1 > viruses.contig_ids.txt
awk '$12=="Streptophyta"' blobplot.blobDB.table.txt | cut -f1 > streptophyta.contig_ids.txt

a=SRR4043743
b=SRR4043742
#c=SRR949075
#d=SRR3934333
#e=SRR3934334
#f=SRR3934335
#g=SRR3934336
#h=SRR3934337
#i=SRR3934326
#j=SRR3934327
#k=SRR3934328
#l=SRR3934329
#m=SRR3934330
#n=SRR3934331
#o=SRR3934338
#p=SRR3934339
#q=SRR1566026
#r=SRR1566025

grep -v -wFf viruses.contig_ids.txt ../kallisto/$a/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$a/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$b/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$b/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$c/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$c/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$d/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$d/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$e/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$e/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$f/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$f/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$g/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$g/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$h/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$h/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$i/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$i/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$j/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$j/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$k/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$k/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$l/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$l/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$m/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$m/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$n/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$n/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$o/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$o/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$p/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$p/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$q/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$q/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$r/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$r/abundance.filtered.tsv



