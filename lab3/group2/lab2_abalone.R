library(e1071)
library(class)# read data in
aba<-read.csv("abalone.csv")
naba<-dim(aba)[1]
aba$isMale <- replace(aba$Sex, aba$Sex == "M", 1)
aba$isMale <- replace(aba$isMale, aba$isMale != 1, 0)
aba$isFemale <- replace(aba$Sex, aba$Sex == "F", 1)
aba$isFemale <- replace(aba$isFemale, aba$isFemale != 1, 0)
aba$isIndeter <- replace(aba$Sex, aba$Sex != "I", 1)
aba$isIndeter <- replace(aba$isIndeter, aba$isIndeter != 1, 0)
View(aba)
#90% to train
sampling.rate=0.9
#remainder to test
num.test.set.labels=naba*(1.-sampling.rate)
#construct a random set of training indices (training)
training <-sample(1:naba,sampling.rate*naba, replace=FALSE)
#build the training set (train)
train<-subset(aba[training,],select=c("Length","Diameter","Height","Whole.weight","Shucked.weight","Viscera.weight","Shell.weight","isMale","isFemale","isIndeter"))
#construct the remaining test indices (testing)
testing<-setdiff(1:naba,training)
#define the test set
test<-subset(aba[testing,],select=c("Length","Diameter","Height","Whole.weight","Shucked.weight","Viscera.weight","Shell.weight","isMale","isFemale","isIndeter"))
#construct labels for another variable (Rings) in the training set
crings<-aba$Rings[training]
#construct true labels the other variable in the test set
true.labels<-aba$Rings[testing]


#run the classifier, can change k
classif<-knn(train,test,crings,k=5,prob = FALSE)
#view the classifier
classif
#looks at attributes
attributes(.Last.value)

#now do bayes.
model <- naiveBayes(Rings ~ ., data = aba[training,])
table(predict(model, aba[testing,]))
