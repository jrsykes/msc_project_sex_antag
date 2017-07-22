
tail -n +10 gfold_out | sed 's/\#GeneSymbol/GeneSymbol/g' | sed 's/GFOLD(0.01)/GFOLD/g' | sed 's/1stRPKM/female_RPKM/g'| sed 's/2ndRPKM/male_RPKM/g' > gfold_R


data<-read.table("gfold_R",head=T)

expression<-(data[,c(6,7)])

expression<-(subset(expression, male_RPKM>1 | female_RPKM>1))

### plot ditributions
pdf("distribution_boxplot.pdf", width=14, height=7)
boxplot(log2(expression), outline=F, notch=F, col=rainbow(8), ylab="Log2(RPKM)")
dev.off()

####### correlations
sink('correlations.txt')
cor(expression, method="pearson")
sink()

expression$col<-"grey"
expression[(expression$male_RPKM) & expression$male_RPKM > 2*expression$female_RPKM,"col"] <- "steelblue"
expression[(expression$female_RPKM) & expression$female_RPKM > 2*expression$male_RPKM,"col"] <- "steelblue"
expression[(expression$male_RPKM) & expression$male_RPKM > 4*expression$female_RPKM,"col"] <- "tan1"
expression[(expression$female_RPKM) & expression$female_RPKM > 4*expression$male_RPKM,"col"] <- "tan1"
expression[(expression$male_RPKM) & expression$male_RPKM > 6*expression$female_RPKM,"col"] <- "forestgreen"
expression[(expression$female_RPKM) & expression$female_RPKM > 6*expression$male_RPKM,"col"] <- "forestgreen"
expression[(expression$male_RPKM) & expression$male_RPKM > 8*expression$female_RPKM,"col"] <- "darkmagenta"
expression[(expression$female_RPKM) & expression$female_RPKM > 8*expression$male_RPKM,"col"] <- "darkmagenta"

library(ggplot2)

pdf("scatter.pdf", width=14, height=7)

ggplot(expression, aes(x = log2(expression$male_RPKM), y = log2(expression$female_RPKM), color = col)) + geom_point(size=0.7) + xlab("Log2 Male RPKM") + ylab("Log2 Female RPKM") + scale_color_identity() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"))

dev.off()


expression<-(data[,c(3,6,7)])
expression<-(subset(expression, male_RPKM>1 | female_RPKM>1))

pdf("GFOLD_histogram_frankliniella_occidentalis.pdf", width=14, height=7)

hist(expression$GFOLD)
dev.off()

expression<-(subset(expression, male_RPKM>1 | female_RPKM>1))

###### Sex biased transcripts

male_biased<-(subset(expression, GFOLD > 1))
female_biased<-(subset(expression, GFOLD < -1))

dim(male_biased)
dim(female_biased)



####### Sex limited transcripts

male_limited<-(subset(expression, male_RPKM>1 & female_RPKM<1))
female_limited<-(subset(expression, female_RPKM>1 & male_RPKM<1))

dim(male_limited)
dim(female_limited)

##### n transcribed

male_n<-(subset(expression, male_RPKM>1))
female_n<-(subset(expression, female_RPKM>1))

dim(male_n)
dim(female_n)




