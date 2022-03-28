data("iris")
library(ggplot2)
library(e1071)

svm_poly <- svm(Species~., data = iris, kernel = "polynomial")
summary(svm_poly)

plot(svm_poly, data=iris, Petal.Width~Petal.Length, slice = list(Sepal.Width = 3, Sepal.Length = 4))

pred_poly <- predict(svm_poly, iris)

table_poly <- table(Predicted = pred_poly, Actual = iris$Species)
table_poly

ModelPoly_acc = sum(diag(table_poly))/sum(table_poly)
ModelPoly_acc
ModelPoly_mis = 1 - ModelPoly_acc
ModelPoly_mis
