library(ggplot2)
library(dplyr)
View(mpg)
# 문제 1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# 문제 2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

# 문제 3
mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 문제 4
mpg %>% 
  filter(class == "compact") %>%
  group_by(manufacturer) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count)) %>% 
  head(5)