script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/map.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script tetranychus_urticae SRR4043745 female paired
qsub $script tetranychus_urticae SRR4043744 female paired
qsub $script tetranychus_urticae SRR4043743 female paired
qsub $script tetranychus_urticae SRR4043742 female paired
qsub $script tetranychus_urticae SRR4043741 male paired
qsub $script tetranychus_urticae SRR4043740 male paired
qsub $script tetranychus_urticae SRR4043739 male paired
qsub $script tetranychus_urticae SRR4043738 male paired
