

species=$1
mode=$2

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


## one = species, two = SRR, three = sex

if [ $mode == 'paired' ]
	then
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2026341 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028030 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028033 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028036 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028037 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028038 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028039 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028040 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028041 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028242 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028243 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2028244 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2030782 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2030783 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2031386 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2031386 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2031929 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR2031931 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR1852640 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR1852639 male
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR650709 male
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR317125 male
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/paired_download_qc.sh cimex_lectularius SRR317124 male
fi

if [ $mode == 'single' ]
	then
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2026341 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028030 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028033 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028036 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028037 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028038 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028039 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028040 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028041 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028242 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028243 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2028244 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2030782 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2030783 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2031386 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2031386 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2031929 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR2031931 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR1852640 female
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR1852639 male
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR650709 male
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR317125 male
bash /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/single_download_qc.sh cimex_lectularius SRR317124 male
fi



#cp /data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/*.sh.* /data/projects/lross_ssa/raw/$species

#qsub /data/projects/lross_ssa/scripts/fastqc.sh
