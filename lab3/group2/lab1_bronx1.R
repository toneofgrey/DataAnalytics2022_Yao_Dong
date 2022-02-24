#library(gdata) 
#faster xls reader but requires perl!
#bronx1<-read.xls(file.choose(),pattern="BOROUGH",stringsAsFactors=FALSE,sheet=1,perl="<SOMEWHERE>/perl/bin/perl.exe") 
#bronx1<-bronx1[which(bronx1$GROSS.SQUARE.FEET!="0" & bronx1$LAND.SQUARE.FEET!="0" & bronx1$SALE.PRICE!="$0"),]

#alternate
library("xlsx")
bronx1<-read.xlsx("rollingsales_bronx.xls",pattern="BOROUGH",stringsAsFactors=FALSE,sheetIndex=1,startRow=5,header=TRUE)
View(bronx1)
#
attach(bronx1) # If you choose to attach, leave out the "data=." in lm regression
#help("sub")
SALE.PRICE<-sub("\\$","",SALE.PRICE) 
SALE.PRICE<-as.numeric(gsub(",","", SALE.PRICE)) 
GROSS.SQUARE.FEET<-as.numeric(gsub(",","", GROSS.SQUARE.FEET)) 
LAND.SQUARE.FEET<-as.numeric(gsub(",","", LAND.SQUARE.FEET)) 
plot(log(GROSS.SQUARE.FEET), log(SALE.PRICE))

SP_mod <- SALE.PRICE[!(SALE.PRICE==0 | GROSS.SQUARE.FEET==0 | LAND.SQUARE.FEET==0)]
summary(SP_mod)
GSF_mod <- GROSS.SQUARE.FEET[!(SALE.PRICE==0 | GROSS.SQUARE.FEET==0 | LAND.SQUARE.FEET==0)]
summary(GSF_mod)
plot(log(GSF_mod), log(SP_mod))
LSF_mod <- LAND.SQUARE.FEET[!(SALE.PRICE==0 | GROSS.SQUARE.FEET==0 | LAND.SQUARE.FEET==0)]
summary(LSF_mod)
N_mod <- NEIGHBORHOOD[!(SALE.PRICE==0 | GROSS.SQUARE.FEET==0 | LAND.SQUARE.FEET==0)]
BCC_mod <- BUILDING.CLASS.CATEGORY[!(SALE.PRICE==0 | GROSS.SQUARE.FEET==0 | LAND.SQUARE.FEET==0)]

m1<-lm(log(SP_mod)~log(GSF_mod))
summary(m1)
abline(m1,col="red",lwd=2)
plot(resid(m1))


# Model 2

m2<-lm(log(SP_mod)~log(GSF_mod)+log(LSF_mod)+factor(N_mod))
summary(m2)
plot(resid(m2))
# Suppress intercept - using "0+ ..."
m2a<-lm(log(SP_mod)~0+log(GSF_mod)+log(LSF_mod)+factor(N_mod))
summary(m2a)
plot(resid(m2a))

# Model 3
m3<-lm(log(SP_mod)~0+log(GSF_mod)+log(LSF_mod)+factor(N_mod)+factor(BCC_mod))
summary(m3)
plot(resid(m3))

# Model 4
m4<-lm(log(SP_mod)~0+log(GSF_mod)+log(LSF_mod)+factor(N_mod)*factor(BCC_mod))
summary(m4)
plot(resid(m4))

