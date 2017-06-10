

species=$1

if [ $species == ' ' ]
then
echo 'Enter species name at \command line'
exit 
fi

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

 
#qsub $script nasonia_giraulti SRR2773799 female single
#qsub $script nasonia_giraulti SRR2773798 female single
qsub $script nasonia_giraulti SRR2773797 female single
qsub $script nasonia_giraulti SRR2773796 female single
#qsub $script nasonia_giraulti SRR2773795 female single
#qsub $script nasonia_giraulti SRR2773794 female single
#qsub $script nasonia_giraulti SRR1566030 female single
#qsub $script nasonia_giraulti SRR1566029 female single
#qsub $script nasonia_giraulti SRR1566028 female single
#qsub $script nasonia_giraulti SRR1566024 female single
#qsub $script nasonia_giraulti SRR1566023 female single
#qsub $script nasonia_giraulti SRR1566022 female single
#qsub $script nasonia_giraulti SRR1566033 male single
#qsub $script nasonia_giraulti SRR1566032 male single
#qsub $script nasonia_giraulti SRR1566031 male single
#qsub $script nasonia_giraulti SRR1566027 male single
#qsub $script nasonia_giraulti SRR1566026 male single
#qsub $script nasonia_giraulti SRR1566025 male single





