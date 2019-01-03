library(ggplot2)
library(dplyr)
exam01 <- mpg %>% select(class, cty)
head(exam01)

exam02 <- exam01 %>% filter(class == 'compact')
exam03 <- exam01 %>% filter(class == 'suv')
mean(exam02$cty)
mean(exam03$cty)

mpg
exam04 <- mpg %>% filter(manufacturer == 'audi') %>% arrange(desc(hwy))
head(exam04, 5)
