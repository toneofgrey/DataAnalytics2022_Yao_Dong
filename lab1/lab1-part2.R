epi2010 <- read.csv("2010EPI_data.csv", header = TRUE)
attach(epi2010)
names(epi2010) = epi2010[1,]
epi2010 = epi2010[-1,]
epi2010[] <- lapply(epi2010, function(x) type.convert(as.character(x)))
EPI <- epi2010$EPI
DALY <- epi2010$DALY
WATER_H <- epi2010$WATER_H
WATER_E <- epi2010$WATER_E
AIR_H <- epi2010$AIR_H
AIR_E <- epi2010$AIR_E
BIODIVER <- epi2010$BIODIVERSITY
ENVH <- epi2010$ENVHEALTH
tf <- is.na(BIODIVER)
BIO <- BIODIVER[!tf]
BIO
qqplot(WATER_H,WATER_E)
qqplot(AIR_H,AIR_E)
qqplot(WATER_H,ENVH)
qqplot(AIR_H,ENVH)
qqplot(BIO,ENVH)

