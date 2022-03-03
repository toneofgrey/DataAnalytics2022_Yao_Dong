data(swiss)
sclass <- kmeans(swiss[2:7,], 3)
sclass
table(sclass$cluster, swiss[2:7,2])
#
summary(swiss$Agriculture)
hist(swiss$Agriculture)
swiss$Agriculture_LV <- cut(swiss$Agriculture, br=c(0,10,20,30,40,50,60,70,80,90,100), labels = c("LV1","LV2","LV3","LV4","LV5","LV6","LV7","LV8","LV9","LV10"))
View(swiss)
library(e1071)
m <- naiveBayes(swiss[2:7,-2], swiss[2:7, 7])
m
table(predict(m, swiss[,-2]), swiss[,7])
