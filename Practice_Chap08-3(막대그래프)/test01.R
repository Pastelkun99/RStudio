# 문제 1
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()

# 문제 2
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_point() + 
  xlim(0, 500000) + 
  ylim(0, 10000)