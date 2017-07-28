
library(ggplot2)
library(Rmisc)

dat<-read.csv("cor_animal_model.csv")

dat1<-summarySE(dat, measurevar='cor',groupvars=c('SexDeterm'))

p1<-ggplot(dat1, aes(x=SexDeterm, y=cor)) + xlab("") + ylab("Mean r ± 1 SE") +
    geom_errorbar(aes(ymin=cor-se, ymax=cor+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(0.9)) + 
    theme(text = element_text(size=18), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black")) + 
  scale_fill_manual(values=cbPalette) + geom_point( size=3, shape=21, fill="white")

png("correlations_mean_SE.png", height=480, width=480)
p1
dev.off()

shapiro.test(dat$cor)
bartlett.test(cor~SexDeterm, data=dat)

A<-aov(cor ~ SexDeterm, data=dat)
summary()





