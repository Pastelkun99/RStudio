# 문제 1
library(ggplot2)
exam01 <- mpg %>% filter(displ <= 4)
View(exam01)
exam02 <- mpg %>% filter(displ >= 5)
View(exam02)
mean(exam01$hwy)
mean(exam02$hwy)

# 문제 2
exam03 <- mpg %>% filter(manufacturer == 'audi')
exam03
exam04 <- mpg %>% filter(manufacturer == 'toyota')
exam04
mean(exam03$cty)
mean(exam04$cty)

# 문제 3
exam05 <- mpg %>% filter(manufacturer == 'chevrolet' | manufacturer == 'ford' | manufacturer == 'honda')
mean(exam05$hwy)
exam06 <- mpg %>% filter(manufacturer %in% c('chevrolet', 'ford', 'honda'))
mean(exam06$hwy)
