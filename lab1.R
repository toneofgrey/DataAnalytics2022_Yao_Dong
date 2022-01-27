setwd("C:\\Users\\shado\\Desktop\\Data Analytics")
gpw3 <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv",header = TRUE)
View(gpw3)
epi2010 <- read.csv("2010EPI_data.csv", header = TRUE)
View(epi2010)
help(data)
data()
attach(epi2010)
fix(epi2010)
names(epi2010) = epi2010[1,]
epi2010 = epi2010[-1,]
epi2010[] <- lapply(epi2010, function(x) type.convert(as.character(x)))
View(epi2010)
EPI <- epi2010$EPI
tf <- is.na(EPI)
E <- EPI[!tf]
E
#Exercise 1 for EPI
summary(EPI) #stat
fivenum(EPI, na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm = TRUE,bw=1.))
#lines(density(EPI,na.rm = TRUE,bw="SJ"))
rug(EPI)

plot(ecdf(EPI), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(EPI); qqline(EPI)
x <- seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)

#Exercise 1 for WATER_H
DALY <- epi2010$DALY
summary(DALY) #stat
fivenum(DALY, na.rm = TRUE)
stem(DALY)
hist(DALY)
hist(DALY, seq(0, 95, 1), prob=TRUE)
lines(density(DALY,na.rm = TRUE,bw=1.))
#lines(density(DALY,na.rm = TRUE,bw="SJ"))
rug(DALY)

plot(ecdf(DALY), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(DALY); qqline(DALY)
x <- seq(0,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)

#Exercise 1 for WATER_H
WATER_H <- epi2010$WATER_H
summary(WATER_H) #stat
fivenum(WATER_H, na.rm = TRUE)
stem(WATER_H)
hist(WATER_H)
hist(WATER_H, seq(0, 105, 1), prob=TRUE)
lines(density(WATER_H,na.rm = TRUE,bw=1.))
lines(density(WATER_H,na.rm = TRUE,bw="SJ"))
rug(WATER_H)

plot(ecdf(WATER_H), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(WATER_H); qqline(WATER_H)
x <- seq(0,105,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)
