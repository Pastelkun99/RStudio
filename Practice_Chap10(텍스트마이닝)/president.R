install.packages("wordcloud")
library(wordcloud)

install.packages("RColorBrewer")
library(RColorBrewer)

install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_131") 
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")

library(KoNLP)
library(dplyr)

useNIADic()

presidenttxt <- readLines("President.txt", encoding = "UTF-8")
presidenttxt

install.packages("stringr")
library(stringr)

presidenttxt <- str_replace_all(presidenttxt, "\\W", " ")

prenouns <- extractNoun(presidenttxt)
class(prenouns)

prewordcount <- table(unlist(prenouns))

class(prewordcount)

df_preword <- as.data.frame(prewordcount, stringsAsFactors = F)
View(df_preword)

df_preword <- rename(df_preword, 
                     word = Var1,
                     freq = Freq)

df_preword <- filter(df_preword, nchar(word)>=2)
View(df_preword)

pretop_50 <- df_preword %>% 
  arrange(desc(freq)) %>% 
  head(50)

prepal <- brewer.pal(8, "Dark2")

set.seed(9999)

wordcloud(words = df_preword$word,
          freq = df_preword$freq,
          min.freq = 2,
          max.words = 300,
          random.order = F,
          rot.per = .1,
          scale = c(6, 0.4),
          colors = prepal)