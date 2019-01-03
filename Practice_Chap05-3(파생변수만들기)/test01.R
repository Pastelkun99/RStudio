library(ggplot2)

# 문제 1
midwest1 <- as.data.frame(ggplot2 :: midwest)
head(midwest1)
dim(midwest1)
str(midwest1)

# 문제 2
library(dplyr)
midwest1 <- rename(midwest1, total=poptotal, asian=popasian)
head(midwest1)

# 문제 3
midwest1$biyul <- midwest1$asian/midwest1$total*100.0
hist(midwest1$biyul)

# 문제 4
mean(midwest1$biyul)
midwest1$rate <- ifelse(midwest1$biyul >= 0.4872462, "large", "small")
head(midwest1)

# 문제 5
table(midwest1$rate)
qplot(midwest1$rate)
