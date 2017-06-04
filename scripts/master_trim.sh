

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim_assemble.sh

qsub $script bemisia_tabaci SRR5086009 female paired 
qsub $script bemisia_tabaci SRR5086010 male paired
qsub $script bemisia_tabaci SRR1523522 female paired