library(dplyr)
multivariate <- read.csv("multivariate.csv")
head(multivariate)
attach(multivariate)
#help(lm)
mm <- lm(Homeowners~Immigrant)
mm
summary(mm)$coef
plot(Homeowners~Immigrant)
abline(mm)
abline(mm,col=2,lwd=3)
newImmigrantdata <-data.frame(Immigrant=c(0,20))
mm %>% predict(newImmigrantdata)

abline(mm)
abline(mm,col=3,lwd=3)
attributes(mm)
mm$coefficients
#--------------------------------------------------
library(ggplot2)
ggplot(multivariate, aes(x=Immigrant, y=Homeowners)) + geom_line() + geom_point()
