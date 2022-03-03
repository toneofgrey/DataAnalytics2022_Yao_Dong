data(Titanic)
summary(Titanic)
mdl <- naiveBayes(Survived ~ ., data = Titanic)
mdl
pred <- predict(mdl, as.data.frame(Titanic)[,1:3])
table(pred)
# etc.

