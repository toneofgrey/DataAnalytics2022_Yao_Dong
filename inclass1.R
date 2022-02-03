library(ggplot2)
library(dplyr)

my_diamonds <- diamonds %>% filter(between(carat, 0, 100))
View(diamonds)
help(diamonds)
carat <- diamonds$carat
price <- diamonds$price
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = price), binwidth = 100)
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = price), binwidth = 50)
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = price), binwidth = 1)

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) + geom_point()
ggplot(data = diamonds) + geom_bar(mapping = aes(x = color))
ggplot(data = diamonds) + geom_bar(mapping = aes(x = clarity))
