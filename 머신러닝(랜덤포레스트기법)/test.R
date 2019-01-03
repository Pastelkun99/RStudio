install.packages("randomForest")
install.packages("tree")
install.packages("ggplot2")
install.packages("GGally")

library(randomForest)
library(tree)
library(ggplot2)
library(GGally)

head(iris)

treeset <- tree(Species ~ . , data = iris)
plot(treeset)
text(treeset)

iris_index <- sample(2, nrow(iris), replace = T, prob = c(0.7, 0.3))

train <- iris[iris_index == 1,] 
train

test <- iris[iris_index == 2,] 
test

iris_rf <- randomForest(Species ~ ., data = train_data, importance = TRUE)

qplot(Petal.Width, Petal.Length, data = iris, colour = Species)
