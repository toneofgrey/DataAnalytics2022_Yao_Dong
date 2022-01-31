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

#Exercise 1 for DALY
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


#Exercise 1 for ENVHEALTH
ENVHEALTH <- epi2010$ENVHEALTH
summary(ENVHEALTH) #stat
fivenum(ENVHEALTH, na.rm = TRUE)
stem(ENVHEALTH)
hist(ENVHEALTH)
hist(ENVHEALTH, seq(0, 100, 1), prob=TRUE)
lines(density(ENVHEALTH,na.rm = TRUE,bw=1.))
lines(density(ENVHEALTH,na.rm = TRUE,bw="SJ"))
rug(ENVHEALTH)

plot(ecdf(ENVHEALTH), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(ENVHEALTH); qqline(ENVHEALTH)

#Exercise 1 for ECOSYSTEM
ECOSYSTEM <- epi2010$ECOSYSTEM
summary(ECOSYSTEM) #stat
fivenum(ECOSYSTEM, na.rm = TRUE)
stem(ECOSYSTEM)
hist(ECOSYSTEM)
hist(ECOSYSTEM, seq(0, 100, 1), prob=TRUE)
lines(density(ECOSYSTEM,na.rm = TRUE,bw=1.))
lines(density(ECOSYSTEM,na.rm = TRUE,bw="SJ"))
rug(ECOSYSTEM)

plot(ecdf(ECOSYSTEM), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(ECOSYSTEM); qqline(ECOSYSTEM)


#Exercise 1 for AIR_H
AIR_H <- epi2010$AIR_H
summary(AIR_H) #stat
fivenum(AIR_H, na.rm = TRUE)
stem(AIR_H)
hist(AIR_H)
hist(AIR_H, seq(0, 100, 1), prob=TRUE)
lines(density(AIR_H,na.rm = TRUE,bw=1.))
lines(density(AIR_H,na.rm = TRUE,bw="SJ"))
rug(AIR_H)

plot(ecdf(AIR_H), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(AIR_H); qqline(AIR_H)


#Exercise 1 for AIR_E
AIR_E <- epi2010$AIR_E
summary(AIR_E) #stat
fivenum(AIR_E, na.rm = TRUE)
stem(AIR_E)
hist(AIR_E)
hist(AIR_E, seq(10, 90, 1), prob=TRUE)
lines(density(AIR_E,na.rm = TRUE,bw=1.))
lines(density(AIR_E,na.rm = TRUE,bw="SJ"))
rug(AIR_E)

plot(ecdf(AIR_E), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(AIR_E); qqline(AIR_E)


#Exercise 1 for WATER_E
WATER_E <- epi2010$WATER_E
summary(WATER_E) #stat
fivenum(WATER_E, na.rm = TRUE)
stem(WATER_E)
hist(WATER_E)
hist(WATER_E, seq(0, 100, 1), prob=TRUE)
lines(density(WATER_E,na.rm = TRUE,bw=1.))
lines(density(WATER_E,na.rm = TRUE,bw="SJ"))
rug(WATER_E)

plot(ecdf(WATER_E), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(WATER_E); qqline(WATER_E)


#Exercise 1 for BIODIVERSITY
BIODIVERSITY <- epi2010$BIODIVERSITY
summary(BIODIVERSITY) #stat
fivenum(BIODIVERSITY, na.rm = TRUE)
stem(BIODIVERSITY)
hist(BIODIVERSITY)
hist(BIODIVERSITY, seq(0, 100, 1), prob=TRUE)
lines(density(BIODIVERSITY,na.rm = TRUE,bw=1.))
lines(density(BIODIVERSITY,na.rm = TRUE,bw="SJ"))
rug(BIODIVERSITY)

plot(ecdf(BIODIVERSITY), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(BIODIVERSITY); qqline(BIODIVERSITY)


#Exercise 2 Practice
EPI <- epi2010$EPI
EPILand <- EPI[!epi2010$Landlock]
Eland <- EPILand[!is.na(EPILand)]
fivenum(Eland)
hist(Eland)
hist(Eland, seq(30.,95.,1.0), prob=TRUE)
lines(density(Eland,na.rm = TRUE,bw=1.))
lines(density(Eland,na.rm = TRUE,bw="SJ"))
rug(Eland)

plot(ecdf(Eland), do.points = FALSE, verticals = TRUE)
par(pty="s")
qqnorm(Eland); qqline(Eland)


#Exercise 2 filtering by geo_subregion
EPI_S_Asia <- EPI[epi2010$GEO_subregion=="South Asia"]
