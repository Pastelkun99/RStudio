library(ggplot2)

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

# 문제 1

fuel_new <- left_join(mpg, fuel, by = "fl")
fuel_new

# 문제 2
fuel_new2 <- fuel_new %>% 
  select(model, fl, price_fl) %>% 
  head(5)

fuel_new2
