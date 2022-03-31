library(kernlab)
data(iris)

#Create a kernel function using the build in rbfdot function
rbf <- rbfdot(sigma=0.1)
rbf

irismodel <- ksvm(Species~.,data=iris,type="C-bsvc",
                  kernel=rbf,C=10,prob.model=TRUE)

irismodel


fitted(irismodel)


predict(irismodel, iris[,-5], type="probabilities")


