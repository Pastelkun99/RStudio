library(KoNLP)
library(stringr)
library(wordcloud)
library(RColorBrewer)
install.packages("rvest")
install.packages("googleVis")
library(googleVis)
library(rvest)
library(NIADic)
library(dplyr)

# 카톡 데이터 전처리

textdata <- file("kakaoAmmo.txt", encoding = 'UTF-8')

data <- readLines(textdata, encoding='UTF-8')
head(data)

data <- data[-1:-3]

data <- str_replace_all(data, '한 우석 쇠불고기', '여우석')
data <- str_replace_all(data, '잆싮눖', '이신우')
data <- str_replace_all(data, '경민', '김경민')
data <- str_replace_all(data, '기수', '조기수')
data <- str_replace_all(data, '임용주', '임주용')
data <- str_replace_all(data, '진영', '김진영')
data <- str_replace_all(data, '현섹판스', '배현관')
data <- str_replace_all(data, '13이동욱', '이동욱')
data <- str_replace_all(data, '윤머', '구윤모')

View(data)
head(data)

useok <- length(data[grep("\\[여우석", data)])
sinoo <- length(data[grep("\\[이신우", data)])
gaemi <- length(data[grep("\\[김경민", data)])
nojam <- length(data[grep("\\[조기수", data)])
nemo <- length(data[grep("\\[서경민", data)])
joyong <- length(data[grep("\\[임주용", data)])
soldier <- length(data[grep("\\김진영", data)])
weesunja <- length(data[grep("\\배현관", data)])
me <- length(data[grep("\\구윤모", data)])
dong <- length(data[grep("\\이동욱", data)])




# 카톡 지분율 파이 그래프 생성


katalkquantity <- c(useok, sinoo, gaemi, nojam, nemo, joyong, soldier, weesunja, me, dong)
katalkname <- c('여우석', '이신우', '김경민', '조기수', '서경민', '임주용', '김진영', '배현관', '구윤모', '이동욱')
katalkshares <- data.frame(katalkname, katalkquantity)

piechart1 <- gvisPieChart(katalkshares, options = list(width = 500, height = 500))

header <- piechart1$html$header
header <- gsub("charset=utf-8", "charset=euc-kr", header)

piechart1$html$header <- header

plot(piechart1)



# 카톡 시간대별 양상

bfnoon <- data[grep("\\[오전", data)] # 오전 데이터 값
afnoon <- data[grep("\\[오후", data)] # 오후 데이터 값

head(bfnoon)
head(afnoon)

timefunc <- function(x){
                          time1 <- x[grep("\\[가-힣]+ 1[[:punct:]]",x)] # 1시 00분 ~ 1시 59분
                          time2 <- x[grep("\\[가-힣]+ 2[[:punct:]]",x)]
                          time3 <- x[grep("\\[가-힣]+ 3[[:punct:]]",x)]
                          time4 <- x[grep("\\[가-힣]+ 4[[:punct:]]",x)]
                          time5 <- x[grep("\\[가-힣]+ 5[[:punct:]]",x)]
                          time6 <- x[grep("\\[가-힣]+ 6[[:punct:]]",x)]
                          time7 <- x[grep("\\[가-힣]+ 7[[:punct:]]",x)]
                          time8 <- x[grep("\\[가-힣]+ 8[[:punct:]]",x)]
                          time9 <- x[grep("\\[가-힣]+ 9[[:punct:]]",x)]
                          time10 <- x[grep("\\[가-힣]+ 10[[:punct:]]",x)]
                          time11 <- x[grep("\\[가-힣]+ 11[[:punct:]]",x)]
                          time12 <- x[grep("\\[가-힣]+ 12[[:punct:]]",x)]
                          return(c(length(time1), length(time2), length(time3), length(time4), length(time5),
                                   length(time6), length(time7), length(time8), length(time9), length(time10),
                                   length(time11), length(time12)))
                        }

tempfunc(afnoon)
beforenoon <- timefunc(bfnoon)
head(bfnoon)
View(beforenoon)
afternoon <- timefunc(afnoon)
timelabel <- c('1시', '2시', '3시', '4시', '5시', '6시', '7시', '8시', '9시', '10시', '11시', '12시')

beforenoon1 <- data.frame(timela45bel, beforenoon, afternoon)
View(beforenoon1)


timechart <- gvisColumnChart(beforenoon1, options= list(height=400, weight=500))
plot(timechart)
