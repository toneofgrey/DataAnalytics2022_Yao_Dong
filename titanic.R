data("Titanic")
head(Titanic)
str(Titanic)
library(rpart)
library(party)
library(randomForest)
reg <- rpart(Survived~., data = Titanic)
plot(reg)
text(reg, use.n=TRUE, all=TRUE, cex=.8)

dt <- ctree(Survived~., data = Titanic)
plot(dt)

#heatmap(Titanic)

rf <- randomForest(Survived~., data = Titanic)
print(rf)
importance(rf)
plot(rf)
