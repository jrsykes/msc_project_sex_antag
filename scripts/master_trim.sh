

script=/data/projects/lross_ssa/scripts/msc_project_sex_antag/scripts/trim.sh

### 1 =species. 2 = SRR, 3 = sex, 4 = paired/single end mode

qsub $script teleopsis_dalmanni SRR1738676 male paired
qsub $script teleopsis_dalmanni SRR1738677 female paired
qsub $script teleopsis_dalmanni SRR1184536 female paired
qsub $script teleopsis_dalmanni SRR1184535 female paired
qsub $script teleopsis_dalmanni SRR1184534 female paired
qsub $script teleopsis_dalmanni SRR1184541 male paired
qsub $script teleopsis_dalmanni SRR1184537 male paired
qsub $script teleopsis_dalmanni SRR1184533 male paired