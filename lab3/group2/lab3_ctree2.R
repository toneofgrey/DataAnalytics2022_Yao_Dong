# Conditional Inference Tree for Mileage
View(cu.summary)

cu.summary$Type <-c(1,2,3,4,5,6, cu.summary$Type)[match(cu.summary$Type,c("Compact","Small","Sporty","Large","Medium","Van"))]
cu.summary
fit2M <- ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
summary(fit2M)
# plot tree
fit2M
plot(fit2M, uniform=TRUE, main="CI Tree Tree for Mileage ")
text(fit2M, use.n=TRUE, all=TRUE, cex=.8)

