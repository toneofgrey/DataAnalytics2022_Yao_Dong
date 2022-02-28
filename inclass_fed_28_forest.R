library(randomForest)


data1 <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data"),header=TRUE)
View(data1)

colnames(data1) <- c("BuyingPrice", "Maintenance", "NumDoors","NumPersons","BootSpace","Safety","Condition")
head(data1)

str(data1)
levels(data1$Condition)

set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
TrainSet <- data1[train,]
ValidSet <- data1[-train,]
summary(TrainSet)
summary(ValidSet)

#help(randomForest)

model1 <- randomForest(Condition~., data = TrainSet, importance = TRUE)
