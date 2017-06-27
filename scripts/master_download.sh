#This script is will download the SRA libraries, run fastqc on those libraries and create the directory infrastructure for the rest of the analysis.
#To run it, first amend the relevant lines beginning with qsub. Ensure that only two qsub lines are unhashed per run.
#Once this is complete run the script as follows: 'bash master_download.sh <species_name>' . 
#Once these libraries have downloaded, re-run the scrip, unhashing the next two qsub lines. 
#Repeat this process until all libraries for this this have been downloaded.
#IMPORTANT. Only download two libraries at a time otherwise you will slow the operation of the cluster for other users.
#IMPORTNT. Ensure that species name is all in lower case and the space between the genus and the species is replaced with an underscore.
#Once downloading is complete for all libraries of a given species, run master_trim.sh

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

qsub $script tetranychus_urticae SRR4043743 female paired
qsub $script tetranychus_urticae SRR4043742 female paired
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
#qsub $script rhizoglyphus_robini SRR3934331 male single
#qsub $script rhizoglyphus_robini SRR3934338 male single
#qsub $script rhizoglyphus_robini SRR3934339 male single












