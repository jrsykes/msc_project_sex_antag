# BLOBTOOLS

#https://blobtools.readme.io/

# Activate blob tools virtenv
source /exports/virt_env/python/blobtools/bin/activate

# extracting coverage from kallisto's abundance TSV
for dir in kallisto/SRR*; do echo $dir; cut -f1,5 $dir/abundance.tsv | grep -v target > $dir.cov; done

#Ensure that the arguments trinity/*, blast/* and -c *.cov in the following line are correct.
# Creating a blobDB  
/exports/software/blobtools/blobtools create -i trinity/paired_assembly_1k.fa -t blast/dendroctonus_ponderosae_blastn_paired_sorted.out  -o blobplot -c kallisto/SRR867160.cov -c kallisto/SRR867161.cov -c kallisto/SRR867162.cov -c kallisto/SRR867179.cov -c kallisto/SRR867176.cov -c kallisto/SRR867183.cov -c kallisto/SRR867186.cov -c kallisto/SRR867188.cov -c kallisto/SRR867432.cov -c kallisto/SRR867441.cov -c kallisto/SRR867433.cov -c kallisto/SRR867434.cov -c kallisto/SRR867436.cov -c kallisto/SRR867438.cov -c kallisto/SRR867439.cov -c kallisto/SRR867440.cov #-c kallisto/SRR1566026.cov -c kallisto/SRR1566025.cov 

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
grep -v '^#' blobplot.blobDB.table.txt | cut -f22 | sort | uniq -c | less ### superkingdom.t.
# Phylum
grep -v '^#' blobplot.blobDB.table.txt | cut -f26 | sort | uniq -c | less ### phylum.t.

# Look at those that were annotated as Viruses 
awk '$22=="Viruses"' blobplot.blobDB.table.txt | less
awk '$26=="Streptophyta"' blobplot.blobDB.table.txt | less


# Filtering abundance before SLEUTH
awk '$22=="Viruses"' blobplot.blobDB.table.txt | cut -f1 > viruses.contig_ids.txt
awk '$26=="Streptophyta"' blobplot.blobDB.table.txt | cut -f1 > streptophyta.contig_ids.txt

a=SRR867160
b=SRR867161
c=SRR867162
d=SRR867179
e=SRR867176
f=SRR867183
g=SRR867186
h=SRR867188
i=SRR867432
j=SRR867441
k=SRR867433
l=SRR867434
m=SRR867436
n=SRR867438
o=SRR867439
p=SRR867440
#q=SRR1566026
#r=SRR1566025

grep -v -wFf viruses.contig_ids.txt ../kallisto/$a/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$a/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$b/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$b/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$c/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$c/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$d/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$d/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$e/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$e/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$f/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$f/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$g/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$g/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$h/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$h/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$i/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$i/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$j/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$j/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$k/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$k/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$l/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$l/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$m/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$m/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$n/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$n/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$o/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$o/abundance.filtered.tsv
grep -v -wFf viruses.contig_ids.txt ../kallisto/$p/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$p/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$q/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$q/abundance.filtered.tsv
#grep -v -wFf viruses.contig_ids.txt ../kallisto/$r/abundance.tsv | grep -v -wFf streptophyta.contig_ids.txt > ../kallisto/$r/abundance.filtered.tsv




