
dat<-read.table("combined_abundance.tsv",head=T)
#dat$RPK<-(dat$est_counts/dat$eff_length)
dat1<-(subset(dat, tpm>(exp(-7))))


#################
#library(Rmisc)

#dat2<-summarySE(dat1,measurevar='RPK',groupvars=c('SexDeterm','sex'))
#dat2
########################


png("box_non-truncated.png", width=960, height=480)

ggplot(dat, aes(log(tpm))) + geom_histogram() +
ylab("Frequency") + xlab("ln TPM") +
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                       panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) +
  theme(text = element_text(size=20)) 
    
dev.off()


png("box_truncated.png", width=960, height=480)

ggplot(dat1, aes(log(tpm))) + geom_histogram() +
ylab("Frequency") + xlab("ln TPM") +
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                       panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) +
  theme(text = element_text(size=20)) + xlim(-10,5)
    
dev.off()



png("TPM_boxplot_SexDeterm.png", width=960, height=480)

ggplot(dat1, aes(x=SexDeterm, y=(log(tpm)), fill=sex)) +
  geom_boxplot() +
xlab("") + ylab("ln TPM") +
  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                       panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))  + theme(text = element_text(size=20))

dev.off()

#png("TPM_boxplot_species.png", width=1800, height=480)
#
#ggplot(dat1, aes(x=species, y=(log(tpm)), fill=sex)) +
#  geom_boxplot() +
#xlab("") + ylab("ln TPM") +
#  theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
#                       panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))  + 
#  theme(text = element_text(size=20)) + theme(axis.text.x = element_text(angle = 45, hjust = 1))
#dev.off()
#
#
#library(Rmisc)
#dat_summary<-summarySE(dat1,measurevar='tpm',groupvars=c('SexDeterm','Order','Sex','species'))


#######################
#####  Density plot
library(ggplot2)
library(grid)
library(cowplot)

dat1<-(subset(dat, tpm>(exp(-10))))

p1<-ggplot(dat1,aes(x=(log(tpm)), fill=SexDeterm)) + geom_density(alpha=0.25) + ylab("Density") + xlab("ln TPM") +
theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26)) +
xlim(-12,12) + ylim(0,0.25) + theme(plot.title = element_text(size=24)) + theme(legend.text=element_text(size=24)) + theme_bw(base_size=24) + theme_bw(base_size=24)

dat2<-(subset(dat1, SexDeterm == "Diplodiploid"))


p2<-ggplot(dat2,aes(x=(log(tpm)), fill=sex)) + geom_density(alpha=0.25) + ylab("Density") + xlab("ln TPM") + ggtitle("Diplodiploid") +
theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26)) +
xlim(-12,12) + ylim(0,0.25) + theme(plot.title = element_text(size=24)) + theme(legend.text=element_text(size=24)) + theme_bw(base_size=24)

dat2<-(subset(dat1, SexDeterm == "Haplodiploid"))

p3<-ggplot(dat2,aes(x=(log(tpm)), fill=sex)) + geom_density(alpha=0.25) + ylab("Density") + xlab("ln TPM") + ggtitle("Haplodiploid") +
theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26)) +
xlim(-12,12) + ylim(0,0.25) + theme(plot.title = element_text(size=24)) + theme(legend.text=element_text(size=24)) + theme_bw(base_size=24)

dat2<-(subset(dat1, SexDeterm == "PGE"))

p4<-ggplot(dat2,aes(x=(log(tpm)), fill=sex)) + geom_density(alpha=0.25) + ylab("Density") + xlab("ln TPM") + ggtitle("PGE") +
theme_bw() + theme(panel.border = element_blank(), panel.grid.major = element_blank(),
                   panel.grid.minor = element_blank(), axis.line = element_line(colour = "black")) + theme(axis.text=element_text(size=20), axis.title=element_text(size=26)) +
xlim(-12,12) + ylim(0,0.25) + theme(plot.title = element_text(size=24)) + theme(legend.text=element_text(size=24)) + theme_bw(base_size=24)


png("Desnity_pannel_plot.png", width=1460, height=1460)
plot_grid(p1,p2,p3,p4, labels=c("", ""), ncol = 2, nrow = 2)

dev.off()

#################################

##  MCMCglmm modle:


m3<-MCMCglmm((log(RPK)) ~ sex + SexDeterm + SexDeterm:sex, family = ("gaussian"), nitt = 60000, burnin = 10000, thin=25, data = dat1)
(full)

m4<-MCMCglmm((log(RPK)) ~ sex + SexDeterm + SexDeterm:sex, family = ("gaussian"), nitt = 6000, burnin = 1000, thin=25, data = dat1)


sex_SexDeterm<-MCMCglmm((log(RPK)) ~ sex + SexDeterm, family = ("gaussian"), nitt = 60000, burnin = 10000, thin=25, data = dat1)

SexDeterm<-MCMCglmm((log(RPK)) ~ SexDeterm, family = ("gaussian"), nitt = 60000, burnin = 10000, thin=25, data = dat1)

sex<-MCMCglmm((log(RPK)) ~ sex, family = ("gaussian"), nitt = 60000, burnin = 10000, thin=25, data = dat1)








