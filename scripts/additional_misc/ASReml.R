

library(asreml)
data<-read.table("/scratch/jsykes/combined_abundance_unique_id.tsv", header=TRUE)
dat<-subset(data, tpm>exp(-7))

dat$SSD<-factor((paste(dat$sex, dat$SexDeterm)))

dat<-dat[order(dat$SSD),]

m1.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_id:species, rcov=~units:at(sex), data=dat, workspace=1e+10)

m2.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_id:species, rcov=~units:at(SSD, data=dat, workspace=1e+10)

m2.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex), rcov=~units:at(SSD), data=dat, workspace=1.8e+10)

m2.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex, rcov=~units:at(SSD), data=dat, workspace=1.8e+10)
This works!! ^^

###########################################

m3.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id:species, rcov=~units:at(SSD), data=dat, workspace=1.95e+10)
This works!! ^^
4212510.0618
sex            1     156.2          156.2 < 2.2e-16 ***

m4.asreml<-asreml(log(tpm)~sex, rcov=~units:at(SSD), data=dat, workspace=1.99e+10)
4476064.1384
Interaction term is highly significant

m7.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:id:species, data=dat, workspace=1.95e+10)
4220013.5500
SSD is highly significant

###########################

m8.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id:species + SexDeterm, rcov=~units:at(SSD), data=dat, workspace=1.8e+10)
Does not converge
4210371.1982

m5.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corv(sex), rcov=~units:at(SSD), data=dat, workspace=1.8e+10)
Does not work

m6.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):cor(sex), rcov=~units:at(SSD), data=dat, workspace=1.8e+10)
Does not work.


##########################

m9.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):target_id, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
3417276.4540
sex            1       822            822 < 2.2e-16 ***

#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################

m10.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
Works. 
3424932.6850
sex            1      1335           1335 <2.2e-16 ***


m4.asreml<-asreml(log(tpm)~sex, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
4476064.1384
Sex:SexDeterm interaction term is highly significant

m15.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
4390625.1590

m16.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:species, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
4210910.7958
sex            1     0.029          0.029    0.8656

m18.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id:species, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
Wont run

m17.asreml<-asreml(log(tpm)~sex, random=~SRR, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
4182507.8585

m19.asreml<-asreml(log(tpm)~sex, random=~target_id, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
3417493.8256

m20.asreml<-asreml(log(tpm)~sex, random=~species, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)


m21.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_id:species, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)


#########################################################################################################################################
#########################################################################################################################################
#########################################################################################################################################


m11.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id:species, rcov=~units:at(SSD), data=dat, workspace=1.9e+10)
Does not work


m12.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id:species, rcov=~units:at(sex), data=dat, workspace=1.9e+10)
Does not work

m13.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):sex:target_id, rcov=~units:at(sex), data=dat, workspace=1.9e+10)
This works
sex            1      1479           1479 < 2.2e-16 ***
3442675.1305

m14.asreml<-asreml(log(tpm)~sex, rcov=~units:at(sex), data=dat, workspace=1.9e+10)




library(asreml)
dat<-read.table("/scratch/jsykes/combined_abundance.tsv", header=TRUE)
dat<-subset(dat, tpm>exp(-7))

dat<-dat[order(dat$sex),]

m1.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_id:species, rcov=~units:at(sex), data=dat, workspace=1e+10)





i<-16

mi.asreml<-asreml(log(tpm)~sex, random=~corh(sex):target_target_id, rcov=~units:at(sex), data=subset(dat, species==levels(species)[i]), workspace=2e+10



m2.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_id:species, rcov=~units:at(sex):SexDeterm, data=dat, workspace=1e+10)

m2.asreml<-asreml(log(tpm)~sex, data=dat, workspace=1e+10)


m<-asreml(log(tpm)~sex, random=~SexDeterm + SexDeterm:sex, data=dat, workspace=1e+10)
4401317

m<-asreml(log(tpm)~sex, random=~SexDeterm:sex, data=dat, workspace=1e+10)
4401319

m<-asreml(log(tpm)~sex, random=~SexDeterm, data=dat, workspace=1e+10)
435690.9852

sex = no significant

SexDeterm = not significant

sex:SexDeterm = highly significant



m2.asreml<-asreml(log(tpm)~sex, random=~at(SexDeterm):corh(sex):target_target_id:species,  data=dat, workspace=1e+10)

