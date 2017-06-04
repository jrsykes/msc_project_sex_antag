

species=$1

mkdir /data/projects/lross_ssa/raw/$species
mkdir /data/projects/lross_ssa/raw/$species/male
mkdir /data/projects/lross_ssa/raw/$species/female

mkdir /data/projects/lross_ssa/analyses/$species
mkdir /data/projects/lross_ssa/analyses/$species/fastqc
mkdir /data/projects/lross_ssa/analyses/$species/fastqc2

mkdir /data/projects/lross_ssa/analyses/$species/trinity
mkdir /data/projects/lross_ssa/analyses/$species/busco
mkdir /data/projects/lross_ssa/analyses/$species/kallisto

mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic/male
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic/female


## one = species, two = SRR, three = sex, four = paired or single end mode

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/download_qc.sh

qsub $script bemisia_tabaci SRR5086009 female paired 
qsub $script bemisia_tabaci SRR5086010 male paired
qsub $script bemisia_tabaci SRR1523522 female paired
#qsub $script cimex_lectularius SRR2028036 female paired
#qsub $script cimex_lectularius SRR2028037 female paired
#qsub $script cimex_lectularius SRR2028038 female paired
#qsub $script cimex_lectularius SRR2028039 female paired
#qsub $script cimex_lectularius SRR2028040 female paired
#qsub $script cimex_lectularius SRR2028041 female paired
#qsub $script cimex_lectularius SRR2028242 female paired
#qsub $script cimex_lectularius SRR2028243 female paired
#qsub $script cimex_lectularius SRR2028244 female paired
#qsub $script cimex_lectularius SRR2030782 female paired
#qsub $script cimex_lectularius SRR2030783 female paired
#qsub $script cimex_lectularius SRR2031386 female paired
#qsub $script cimex_lectularius SRR2031929 female paired
#qsub $script cimex_lectularius SRR2031931 female paired
#qsub $script cimex_lectularius SRR1852640 female paired
#qsub $script cimex_lectularius SRR1852639 male paired
#qsub $script cimex_lectularius SRR650709 male single
#qsub $script cimex_lectularius SRR317125 male single
#qsub $script cimex_lectularius SRR317124 male single



