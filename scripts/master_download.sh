

species=$1

mkdir /data/projects/lross_ssa/raw/$species
mkdir /data/projects/lross_ssa/raw/$species/male
mkdir /data/projects/lross_ssa/raw/$species/female
mkdir /data/projects/lross_ssa/analyses/$species
mkdir /data/projects/lross_ssa/analyses/$species/fastqc
mkdir /data/projects/lross_ssa/analyses/$species/fastqc/male
mkdir /data/projects/lross_ssa/analyses/$species/fastqc/female
mkdir /data/projects/lross_ssa/analyses/$species/trinity
mkdir /data/projects/lross_ssa/analyses/$species/busco
mkdir /data/projects/lross_ssa/analyses/$species/kallisto
mkdir /data/projects/lross_ssa/analyses/$species/trinity
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic/male
mkdir /data/projects/lross_ssa/analyses/$species/trimmomatic/female


## one = species, two = SRR, three = sex, four = paired or single end mode

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/download_qc.sh

bash $script cimex_lectularius SRR2026341 female paired 
bash $script cimex_lectularius SRR2028030 female paired
bash $script cimex_lectularius SRR2028033 female paired
bash $script cimex_lectularius SRR2028036 female paired
bash $script cimex_lectularius SRR2028037 female paired
bash $script cimex_lectularius SRR2028038 female paired
bash $script cimex_lectularius SRR2028039 female paired
bash $script cimex_lectularius SRR2028040 female paired
bash $script cimex_lectularius SRR2028041 female paired
bash $script cimex_lectularius SRR2028242 female paired
bash $script cimex_lectularius SRR2028243 female paired
bash $script cimex_lectularius SRR2028244 female paired
bash $script cimex_lectularius SRR2030782 female paired
bash $script cimex_lectularius SRR2030783 female paired
bash $script cimex_lectularius SRR2031386 female paired
bash $script cimex_lectularius SRR2031386 female paired
bash $script cimex_lectularius SRR2031929 female paired
bash $script cimex_lectularius SRR2031931 female paired
bash $script cimex_lectularius SRR1852640 female paired
bash $script cimex_lectularius SRR1852639 male paired
bash $script cimex_lectularius SRR650709 male single
bash $script cimex_lectularius SRR317125 male single
bash $script cimex_lectularius SRR317124 male single



