# BLOBTOOLS

#https://blobtools.readme.io/

# extracting coverage from kallisto's abundance TSV
for dir in kallisto/SRR*; do echo $dir; cut -f1,5 $dir/abundance.tsv | grep -v target > $dir.cov; done

# Activate blob tools virtenv
source /exports/virt_env/python/blobtools/bin/activate

# deactivate blob tools virtenv
deactivate

# Creating a blobDB  
/exports/software/blobtools/blobtools create -i trinity/Trinity1k.fasta -t blast/anoplophora_glabripennis_blastn_sorted.out -c kallisto/SRR1799851.cov -c kallisto/SRR1799852.cov -o blobplot/anoplophora_glabripennis

# Extracting a "view" table
/exports/software/blobtools/blobtools view -i blobDB.json --rank all --hits

# Getting a distribution of kingdoms/phyla
# Phylum
grep -v '^#' blobDB.table.txt | cut -f15 | sort | uniq -c
# Kingdom
grep -v '^#' blobDB.table.txt | cut -f11 | sort | uniq -c

# Look at those that were annotated as Viruses 
awk '$11=="Viruses"' blobDB.table.txt | less
awk '$11=="Streptophyta"' blobDB.table.txt | less
# Filtering abundance before SLEUTH
grep -v -wFf blobDB.table.Viruses.txt kallisto/SRR1799851/abundance.tsv > kallisto/SRR1799851/abundance.filtered.tsv
