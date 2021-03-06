fit2M <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
head(cu.summary)
summary(fit2M)

plot(fit2M, uniform=TRUE, main="CI Tree Tree for Mileage ")
text(fit2M, use.n=TRUE, all=TRUE, cex=.8)

