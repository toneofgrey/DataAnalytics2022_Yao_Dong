data(iris)
attach(iris)

model <- svm(Species ~ ., data = iris)

#alternative svm
x <- subset(iris, select = -Species)
y <- Species
model <- svm(x, y) 

print(model)
summary(model)

#testing
pred <- predict(model, x)
#testing alternative
pred <- fitted(model)
table(pred, y)


pred <- predict(model, x, decision.values = TRUE)
attr(pred, "decision.values")[1:4,]

# visualize (classes by color, SV by crosses):
plot(cmdscale(dist(iris[,-5])),
     col = as.integer(iris[,5]),
     pch = c("o","+")[1:150 %in% model$index + 1])

#regression
x <- seq(0.1, 5, by = 0.05)
y <- log(x) + rnorm(x, sd = 0.2)

m   <- svm(x, y)
new <- predict(m, x)

plot(x, y)
points(x, log(x), col = 2)
points(x, new, col = 4)

#density estimation
X <- data.frame(a = rnorm(1000), b = rnorm(1000))
#one way
m <- svm(X, gamma = 0.1)

#another way
m <- svm(~., data = X, gamma = 0.1)

#another way
m <- svm(~ a + b, data = X, gamma = 0.1)

# testing
newdata <- data.frame(a = c(0, 4), b = c(0, 4))
predict (m, newdata)

# visualize:
plot(X, col = 1:1000 %in% m$index + 1, xlim = c(-5,5), ylim=c(-5,5))
points(newdata, pch = "+", col = 2, cex = 5)

# weights estimate
i2 <- iris
levels(i2$Species)[3] <- "versicolor"
summary(i2$Species)
wts <- 100 / table(i2$Species)
wts
m <- svm(Species ~ ., data = i2, class.weights = wts)
