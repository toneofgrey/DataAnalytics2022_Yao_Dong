data(promotergene)
ind <- sample(1:dim(promotergene)[1],20)
genetrain <- promotergene[-ind, ]
genetest <- promotergene[ind, ]

gene <-  ksvm(Class~.,data=genetrain,kernel="rbfdot", kpar=list(sigma=0.015),C=70,cross=4,prob.model=TRUE)

genetype <- predict(gene,genetest,type="probabilities")
genetype <- predict(gene,genetest)

table(predict=genetype, truth=genetest$Class)
