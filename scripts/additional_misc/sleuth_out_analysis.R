rm(list=ls())
library(ggplot2)
data<-read.csv('sleuth_out.csv',header = T)
data$arsin_proportion.sex.biased.transcripts<-asin(sqrt(data$proportion.sex.biased.transcripts))
hist(data$arsin_proportion.sex.biased.transcripts)
hist(data$proportion.sex.biased.transcripts)


shapiro.test(data$arsin_proportion.sex.biased.transcripts)
shapiro.test(data$proportion.sex.biased.transcripts)

head (data)
detach(data)
attach(data)
library(Rmisc)
dat<-summarySE(data,measurevar='arsin_proportion.sex.biased.transcripts',groupvars=c('SexDeterm','Order','Sex'))
dat1<-summarySE(data,measurevar='proportion.sex.biased.transcripts',groupvars=c('SexDeterm','Order','Sex'))

detach(dat)
attach(dat)
search()

dat
dim(data)


cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# Error bars represent standard error of the mean

p1<-ggplot(dat1, aes(x=SexDeterm, y=proportion.sex.biased.transcripts, fill=Order, beta=Sex)) + xlab("") + ylab("Proportion of transcriptome") +
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=proportion.sex.biased.transcripts-se, ymax=proportion.sex.biased.transcripts+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette)






asin_fit<-aov(asin(sqrt(arsin_proportion.sex.biased.transcripts))~SexDeterm+Order+Sex+SexDeterm*Sex+Order*Sex,data=data)
summary(asin_fit)


diplo_acariformes<-data[ which(data$SexDeterm=='Diplodiploid' & data$Order=='acariformes'), ]
diplo_acariformes
t.test(diplo_acariformes$arsin_proportion.sex.biased.transcripts~diplo_acariformes$Sex)

diplo_coleoptera<-data[ which(data$SexDeterm=='Diplodiploid' & data$Order=='coleoptera'), ]
diplo_coleoptera
t.test(diplo_coleoptera$arsin_proportion.sex.biased.transcripts~diplo_coleoptera$Sex)

haplo_acariformes<-data[ which(data$SexDeterm=='Haplodiploid' & data$Order=='acariformes'), ]
haplo_acariformes
t.test(haplo_acariformes$arsin_proportion.sex.biased.transcripts~haplo_acariformes$Sex)

haplo_hymenoptera<-data[ which(data$SexDeterm=='Haplodiploid' & data$Order=='hymenoptera'), ]
haplo_hymenoptera
t.test(haplo_hymenoptera$arsin_proportion.sex.biased.transcripts~haplo_hymenoptera$Sex)

haplo_parasitiformes<-data[ which(data$SexDeterm=='Haplodiploid' & data$Order=='parasitiformes'), ]
haplo_parasitiformes
t.test(haplo_parasitiformes$arsin_proportion.sex.biased.transcripts~haplo_parasitiformes$Sex)

################################
############################################
################################


dat2<-summarySE(data,measurevar='proportion.sex.biased.transcripts',groupvars=c('SexDeterm','Sex'))

p2<-ggplot(dat2, aes(x=SexDeterm, y=proportion.sex.biased.transcripts, fill=Sex)) + xlab("") + ylab("Proportion of transcriptome") +
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=proportion.sex.biased.transcripts-se, ymax=proportion.sex.biased.transcripts+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette)

################################
############################################
################################


dat3<-summarySE(data,measurevar='proportion.sex.biased.transcripts',groupvars=c('Order','Sex'))

p3<-ggplot(dat3, aes(x=Order, y=proportion.sex.biased.transcripts, fill=Sex)) + xlab("") + ylab("Proportion of transcriptome") +
  geom_bar(position=position_dodge(), stat="identity") +
  geom_errorbar(aes(ymin=proportion.sex.biased.transcripts-se, ymax=proportion.sex.biased.transcripts+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + theme(axis.text.x = element_text(angle = 45, hjust = 1))

p1
p2
p3
