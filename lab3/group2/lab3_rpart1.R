require(rpart)
Swiss_rpart <- rpart(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(swiss_rpart, uniform = TRUE, branch = 1) # try some different plot options
text(swiss_rpart,fancy = TRUE) # try some different text options

