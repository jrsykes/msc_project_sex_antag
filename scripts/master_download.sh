

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

 
#qsub $script rhizoglyphus_robini SRR3934324 female single
#qsub $script rhizoglyphus_robini SRR3934325 female single
#qsub $script rhizoglyphus_robini SRR3934332 female single
#qsub $script rhizoglyphus_robini SRR3934333 female single
#qsub $script rhizoglyphus_robini SRR3934334 female single
#qsub $script rhizoglyphus_robini SRR3934335 female single
#qsub $script rhizoglyphus_robini SRR3934336 female single
#qsub $script rhizoglyphus_robini SRR3934337 female single
#qsub $script rhizoglyphus_robini SRR946953 female paired
#qsub $script rhizoglyphus_robini SRR3934326 male single
#qsub $script rhizoglyphus_robini SRR3934327 male single
#qsub $script rhizoglyphus_robini SRR3934328 male single
#qsub $script rhizoglyphus_robini SRR3934329 male single
#qsub $script rhizoglyphus_robini SRR3934330 male single
qsub $script rhizoglyphus_robini SRR3934331 male single
qsub $script rhizoglyphus_robini SRR3934338 male single
qsub $script rhizoglyphus_robini SRR3934339 male single












