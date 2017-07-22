rm(list=ls())
library(ggplot2)
library(Rmisc)

data<-read.csv('sleuth_out.csv',header = T)
data$arsin_proportion.of.transcriptome.sex.biased<-asin(sqrt(data$proportion.of.transcriptome.sex.biased))
hist(data$arsin_proportion.of.transcriptome.sex.biased)
hist(data$proportion.of.transcriptome.sex.biased)
data

shapiro.test(data$arsin_proportion.of.transcriptome.sex.biased)
shapiro.test(data$proportion.of.transcriptome.sex.biased)

dat2<-summarySE(dat1,measurevar='RPK',groupvars=c('SexDeterm','sex'))

Sex determination_fit<-aov(dat$arsin_proportion.of.transcriptome.sex.biased~dat$Sex determination+dat$Sex determination*dat$Sex,data=dat)
summary(Sex determination_fit)

########## T-tests by Sex determination system #########

Diplo<-data[ which(data$Sex determination=='Diplodiploid'), ]
Diplo
t.test(Diplo$arsin_proportion.of.transcriptome.sex.biased~Diplo$Sex)

Haplo<-data[ which(data$Sex determination=='Haplodiploid'), ]
Haplo
t.test(Haplo$arsin_proportion.of.transcriptome.sex.biased~Haplo$Sex)

PGE<-data[ which(data$Sex determination=='PGE'), ]
PGE
t.test(PGE$arsin_proportion.of.transcriptome.sex.biased~PGE$Sex)

PGE_hap<-data[ which(data$Sex determination=='PGE' & data$soma=='Haplodiploid'), ]
PGE_hap
t.test(PGE_hap$arsin_proportion.of.transcriptome.sex.biased~PGE_hap$Sex)

PGE_dip<-data[ which(data$Sex determination=='PGE' & data$soma=='Diplodiploid'), ]
PGE_dip
t.test(PGE_dip$arsin_proportion.of.transcriptome.sex.biased~PGE_dip$Sex)

########## T-tests by order ##########

Acari<-data[ which(data$Order=='acariformes'), ]
Acari
t.test(Acari$arsin_proportion.of.transcriptome.sex.biased~Acari$Sex)

Cole<-data[ which(data$Order=='coleoptera'), ]
Cole
t.test(Cole$arsin_proportion.of.transcriptome.sex.biased~Cole$Sex)

Para<-data[ which(data$Order=='parasitiformes'), ]
Para
t.test(Para$arsin_proportion.of.transcriptome.sex.biased~Para$Sex)


################################
############################################
################################

#############################################################
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

data2<-read.csv('sleauth_out_means.csv',header = T)

dat4<-summarySE(data2, measurevar='mean.proportion.of.transcriptome.sex.biased',groupvars=c('Sex determination'))
dat4

p4<-ggplot(dat4, aes(x=Sex determination, y=mean.proportion.of.transcriptome.sex.biased)) + ylim(-0.25,0.25) + xlab("") + ylab("Difference in degree of sex bias (± se)") +
  geom_bar(position=position_dodge(), stat="identity", fill="white",color="black") +
  geom_errorbar(aes(ymin=mean.proportion.of.transcriptome.sex.biased-se, ymax=mean.proportion.of.transcriptome.sex.biased+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) +
  annotate("text", x = 0.83, y=0.18, label = "+ Female biased") + annotate("text", x = 0.8, y=0.16, label = "- Male biased") +
annotate("text", x = 1, y=-0.08, label = "p=0.039") + annotate("text", x = 2, y=-0.13, label = "p=0.113") + annotate("text", x = 3, y=-0.2, label = "p=0.414")


#########
dat5<-summarySE(data2, measurevar='mean.proportion.of.transcriptome.sex.biased',groupvars=c('Order'))

ggplot(dat5, aes(x=Order, y=mean.proportion.of.transcriptome.sex.biased)) + xlab("") + ylab("Difference in degree of sex bias (± se)") +
  geom_bar(position=position_dodge(), stat="identity", fill="white",color="black") +
  geom_errorbar(aes(ymin=mean.proportion.of.transcriptome.sex.biased-se, ymax=mean.proportion.of.transcriptome.sex.biased+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  annotate("text", x = 1.4, y=0.19, label = "+ Female biased") + annotate("text", x = 1.3, y=0.16, label = "- Male biased") +
annotate("text", x = 1, y=-0.3, label = "p<0.01") + annotate("text", x = 2, y=-0.11, label = "p=0.041") + annotate("text", x = 6, y=-0.23, label = "p=0.175")
####

dat6<-summarySE(data2, measurevar='mean.proportion.of.transcriptome.sex.biased',groupvars=c('Sex determination','Order'))

p6<-ggplot(dat6, aes(x=Order, y=mean.proportion.of.transcriptome.sex.biased, fill=Sex determination)) + xlab("") + ylab("Difference in degree of sex bias (± se)") +
  geom_bar(position=position_dodge(), stat="identity", color="black") +
  geom_errorbar(aes(ymin=mean.proportion.of.transcriptome.sex.biased-se, ymax=mean.proportion.of.transcriptome.sex.biased+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  annotate("text", x = 2, y=0.44, label = "+ Female biased") + annotate("text", x = 1.9, y=0.37, label = "- Male biased")

##############

dat7<-summarySE(data2, measurevar='mean.proportion.of.transcriptome.sex.biased',groupvars=c('species'))

p7<-ggplot(dat7, aes(x=species, y=mean.proportion.of.transcriptome.sex.biased)) + xlab("") + ylab("Difference in degree of sex bias (± se)") +
  geom_bar(position=position_dodge(), stat="identity", color="black", fill="white") +
  geom_errorbar(aes(ymin=mean.proportion.of.transcriptome.sex.biased-se, ymax=mean.proportion.of.transcriptome.sex.biased+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  annotate("text", x = 3.5, y=0.44, label = "+ Female biased") + annotate("text", x = 3.3, y=0.37, label = "- Male biased")


p4
p5
p6
p7



