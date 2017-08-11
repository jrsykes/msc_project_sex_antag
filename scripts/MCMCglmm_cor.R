install.packages("MCMCglmm")
installed.packages("ape")
install.packages("nlme")
library(MCMCglmm)
library(ape)
library(nlme)
library(ggplot2)
library(Rmisc)
library(grid)
library(cowplot)

tree<-read.tree("/Users/jamiesykes/Dropbox/SykesMScProject/Analyses/Laura_MCMCglmm/cladogram.tre")
dat<-read.csv("/Users/jamiesykes/Dropbox/SykesMScProject/Analyses/Laura_MCMCglmm/cor_animal_model.csv",header=T)

dat1<-summarySE(dat, measurevar='cor',groupvars=c('ploidy'))
dat2<-summarySE(dat, measurevar='cor',groupvars=c('transmission'))

#---------------MCMCglmm_phylo_models--------------------------------


p1<-ggplot(dat1, aes(x=ploidy, y=cor)) + xlab("Ploidy") + ylab("Mean r ± 1 SE") +
  geom_errorbar(aes(ymin=cor-se, ymax=cor+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + 
  theme(text = element_text(size=18), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + geom_point( size=3, shape=21, fill="white")

#######################

p2<-ggplot(dat2, aes(x=transmission, y=cor)) + xlab("Transmission") + ylab("Mean r ± 1 SE") +
  geom_errorbar(aes(ymin=cor-se, ymax=cor+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + 
  theme(text = element_text(size=18), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + geom_point( size=3, shape=21, fill="white")

plot_grid(p1,p2, labels=c("", ""), ncol = 2, nrow = 1)

#######################
#      MCMCglmm modle 

prior1<-list(R=list(V=1,nu=0.002),G=list(G1=list(V=1,nu=1, alpha.mu=0, alpha.V=1000)))

m3SMCMC<-MCMCglmm(cor~SexDeterm, random=~animal, data=dat,pedigree=tree, family="gaussian", prior=prior1,nitt=1500000, thin=1000, burnin=150000)

plot(m3SMCMC)

summary(m3SMCMC)

posterior.mode(m3SMCMC$Sol[, "SexDetermHaplodiploid"])
HPDinterval(m3SMCMC$Sol[, "SexDetermHaplodiploid"], 0.95)

posterior.mode(m3SMCMC$Sol[, "SexDetermPGE"])
HPDinterval(m3SMCMC$Sol[, "SexDetermPGE"], 0.95)

posterior.mode(m3SMCMC$VCV)

