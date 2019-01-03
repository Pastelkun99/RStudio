library(ggplot2)
mpg %>% head(5)

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

# 문제 1
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# 문제 2
mpg_nomiss <- mpg %>% 
              filter(!is.na(hwy)) %>% 
              group_by(drv) %>% 
              summarise(mean_hwy = mean(hwy))
mpg_nomiss
