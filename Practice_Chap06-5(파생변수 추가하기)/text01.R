# 1번 문제
library(ggplot2)

mpg_copy <- mpg
mpg_copy <- mpg %>% mutate(var1 = cty + hwy) %>% head(5)
mpg_copy

# 2번 문제
mpg_copy <- mpg %>% mutate(var1 = cty + hwy, varavg = (cty + hwy) / 2.0) %>% head(5)
mpg_copy

# 3번 문제
mpg_copy <- mpg %>% mutate(var1 = cty + hwy, varavg = (cty + hwy) / 2.0) %>% head(5)
mpg_copy %>% arrange(desc(varavg)) %>% head(3)

# 4번 문제
mpg_copy2 <- mpg %>% mutate(var1 = cty + hwy, varavg = var1/2.0) %>% 
              arrange(desc(varavg)) %>% head(3)
mpg_copy2
