# 문자로 된 데이터에서 가치 있는 정보를 얻어내는 분석기법을 텍스트마이닝(text mining) 이라고 한다.
# 텍스트마이닝에서 가장 먼저 해야 할일은 바로 형태소 분석, 즉 어떤 품사들로 이루어져 있는지를 분석해야 한다.
# 텍스트 마이닝 할 준비를 해보자.

# 벡터를 이용해 워드클라우딩을 해보자.
install.packages("wordcloud")
library(wordcloud)

# wordcloud()
# 패키지 : wordcloud
# 사용법 : wordcloud(words, freq, scale, min.freq, max.words, random.order, random.color,
#                     ror.per, colors)
# 설명 : 워드 클라우드 그리기

# 매개변수
# words : 단어
# freq : 단어들의 빈도
# scale : 가장 빈도가 큰 단어과 가장 빈도가 작은 단어 폰트 사이의 크기 차이
# min.freq : 출력될 단어들의 최소 빈도
# max.words : 출력될 단어들의 최대 빈도(Inf : 최대제한이 없을을 의미)
# random.order : TRUE 이면 랜덤으로 단어 출력, FALSE이면 빈도수가 큰 단어를 중앙에 배치하고 작은 순으로 배치함.
# random.color : TRUE이면 색은 랜덤순으로 정해지며, FALSE이면 빈도순으로 정해짐
# rot.per : 90도 회전된 각도로 출력되는 단어 비율
# colors : 가장 작은 빈도부터 큰 빈도까지의 단어 색

# 지역명 할당
word <- c("인천광역시", "강화군", "옹진군")

# 전입과 전출을 고려한 지역의 순이동 인구수
frequency <- c(651, 85, 61)

# 워드 클라우드 출력
wordcloud(word, frequency, colors = "blue", random.order = FALSE)
wordcloud(word, frequency, random.order = FALSE, random.color = FALSE, colors = rainbow(length(word)))

# 다양한 단어 색 출력을 위한 팔레트 패키지
install.packages("RColorBrewer")
library(RColorBrewer)
# brewer.pal()
# 패키지 : RColorBrewer
# 사용법 : brewer.pal(n, name)
# 설명 : 팔레트를 만듦

# 매개변수
# n : 팔레트의 색의 수(최소색은 3, 최대수는 팔레트 유형에 따라 다름)
# name : 팔레트 이름
#        팔레트 유형
#           1. Sequential Palettes : 낮은 쪽에서 높은 쪽으로 색상 밝기가 변함
#           2. Qualitative palettes : 색조의 변화로 시각 차이를 만듦
#           3. Diverging palettes : 가운데 색은 밝고 양 끝은 어두운 색으로 강조

# displat.brewer.all()
# 패키지 : RColorBrewer
# 사용법 : display.brewer.all(type = "all")
# 설명 : 팔레트 유형에 해당하는 팔레트를 출력

# 매개변수
# type : 팔레트 유형
#       1. "seq" : sequantial palettes
#       2. "div" : Diverging palettes
#       3. "qual" : Qualitative palettes

# 모든 팔레트 출력
display.brewer.all()

# display.brewer.pal()
# 패키지 : RColorBrewer
# 사용법 : display.brewer.pal(n, name)
# 설명 : 지정한 팔레트 출력

# 매개 변수
# n : 팔레트 색의 수(최소 3개, 최대 수 팔레트 유형에 따라 다름)
# name : 팔레트 이름

display.brewer.pal(8, name = "Dark2")



# 1. 힙합 음악 가사를 통한 텍스트 마이닝

# 패키지 준비, 먼저 한글 자연어 분석 채키지인 KoNLP(Korean natural language Processing)를 이용
# 하면 한글 데이터로 형태소 분석을 할 수 있다. 단, 자바가 설치되어 있어야 한다.
# 이미 자바가 설치되어 있기 때문에 아래 패키지는 별 문제 없이 설치가 될 것이다.
# 하나하나씩 설치를 하자. KoNLP는 설치가 오래 걸린다.

install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

# 단 아래와 같이 작업을 해야 하는 경우도 있다. \ 가 아니라 / 이니 이스케이프 문자를 잘 보도록 하자.
# 틀리게 되면 계속 에러를 뿜는다.
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_131") # 자바 경로 직접 설정
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")

# 패키지 로드
library(KoNLP)
library(dplyr)

# 이제 사전을 설정해야 하는데 KoNLP에서는 NIA라는 사전이 98만여 개의 단어로 구성되어 있다.
# 이 사전을 이용하자.
useNIADic() # 설치가 꽤 걸린다.

# 주의 할 점. hiphop.txt 파일을 깃 허브에서 다운받을때, Raw를 클릭하고 혹시 깨진다면
# 인코딩을 자동설정으로 해서 복사하여 메모장에 붙여넣어서 사용하길 바란다.
txt <- readLines("hiphop.txt")
txt
# 문장에 이모티콘이나 특수문자가 포함되어 있으면 분석에 오류가 발생할 수 있다.
# 하여 문자처리 패키지인 string의 str_replace_all()을 사용하여 특수문자를 빈칸으로 처리하자.
install.packages("stringr")
library(stringr)

# 오타에 주의하자. 대문자 \\W다. \\W는 정규 표현식에서 특수문자를 의미한다.
# 이것을 공백으로 바꾸는 것이다.
txt <- str_replace_all(txt, "\\W", " ")
txt

# extractNoun() 함수는 명사 (noun)만 추출한다.
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다.")

# 그럼 위의 가사에서 명사를 추출하고, 각 단어가 몇번씩 사용되었는지 빈도표를 만들자.
nouns <- extractNoun(txt)

# nouns는 현재 데이터 구조를 보니 list타입이다.
# 이렇게 되어버리면 빈도를 구할 수가 없다. 하여 벡터타입으로 변경이 불가피하다.
class(nouns)

# 앞에서 했지만 다시 상기하자.
# R의 데이터구조는 크게 5가지로 나눈다.
# 1. 벡터(vector) : 1차원이며 한 가지 변수 타입으로 구성된 것
# 2. 데이터프레임(data frame) : 2차원이며 다양한 변수타입으로 구성된 것
# 3. 매트릭스(matrix) : 2차원이며 한가지 변수 타입으로 구성된 것
# 4. 어레이(array) : 다차원이며 2차원 이상의 매트릭스로 구성된 것
# 5. 리스트(list) : 다차원이며 서로 다른 데이터 구조를 포함한 것

# 그럼 추출한 명사의 데이터구조 list를 문자열 벡터로 변환하여 단어별 빈도표를 생성하자.
wordcount <- table(unlist(nouns))

# 테이블 대로 변환되었다.
class(wordcount)
View(wordcount)

# 테이블을 데이터프레임구조로 바꾸자.
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
class(df_word)
View(df_word)

class(df_word$word)

# 확인해보니 Var1은 단어, Freq는 빈도수를 나타내고 있으니 보기 좋게 변수명을 바꾸자.
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)
# 보통 한글자로 된 단어는 의미가 없는 경우가 많아 nchar()를 이용하여 두글자 이상으로 된 단어만 추출하자.
df_word <- filter(df_word, nchar(word)>=2)
df_word

# 이제 두 글자 이상인 단어 중 빈도 순으로 정렬한 후, 상위 20개만 추출하도록 하자.
top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

View(top_20)

# 이제 이 단어들을 가지고 워드 클라우드를 만들어보자.
# 워드 크라우드는 단어의 빈도를 가지고 구름모양으로 표현한 그래프이다.
# 우리가 흔히 보는 키워드가 크고 작음에 따라 가장 많이 사용한 단어를 시각적으로 알아보기 좋다.
# 색깔도 입혀준다.

# 그럼 패키지를 설치하자.
install.packages("wordcloud")
library(wordcloud)

# 글자 색깔을 표현하는데 사용할 RcolorBrewer패키지를 로드하자. (내장함수라서 별도설치 필요없다.)
library(RColorBrewer)

# 단어의 색깔을 지정할 때 사용할 색상 코드 목록을 만들자.
# Dark2 색상 목록에서 8개 색상 추출
pal <- brewer.pal(8, "Dark2")

# 워드 클라우드는 실행할때 마다 난수를 이용해서 매번 다른 모양의 워드 클라우드를 만들어 내므로
# 아래 시드값을 설정해서 동일하게 나오도록 하자.
set.seed(1234)

wordcloud(words = df_word$word, # 나타낼 단어,
          freq = df_word$freq,  # 단어 빈도
          min.freq = 5,         # 최소 단어 빈도
          max.words = 100,      # 표현 단어 수
          random.order = F,     # 고빈도 단어 중앙 배치, TRUE이면 랜덤배치
          rot.per = .1,         # 회전 단어 비율
          scale = c(4, 0.2),    # 단어 크기 비율
          colors = pal)         # 색상 목록

display.brewer.all()            # 제공 색상타입 모두 보기



# 10-2 국정원 트윗 텍스트 마이닝
# 텍스트 마이닝은 SNS에 올라온 글을 통해 사람들이 어떤 생각을 가지고 있는지에 대해 알아보기 위한 목적으로 자주 활용된다.
# 아래 예제는 2013년 6월 뉴스타파가 인터넷으로 공개한 것이다.
# 무작위로 나열되어 있지만, 텍스트 마이닝을 통해 의도가 분명한 경향성을 발견할 수 있을 것이다.

twitter <- read.csv("twitter.csv", 
                    stringsAsFactors = F,
                    fileEncoding = "UTF-8")
View(twitter)
str(twitter)
class(twitter)
dim(twitter)

twitter <- rename(twitter, no = 번호,
                  id = 계정이름,
                  date = 작성일,
                  tw = 내용)

# 특수문자 제거
twitter$tw <- str_replace_all(twitter$tw, "\\W", " ")
head(twitter$tw, 5)

# 트윗 내용에서 명사 추출
nouns <- extractNoun(twitter$tw)
nouns
class(nouns)

# 추출한 명사 list 데이터구조를 문자열 벡터로 변환, 단어별 빈도표 생성
# word <- unlist(nouns)
# class(word)
# wd <- as.data.frame(wordcount1, stringsAsFactors = F)
# class(wd)
# wd
# wordcount <- table(wd)
# class(wordcount)

# 추출한 명사 list데이터구조를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))
class(wordcount)
View(wordcount)

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
class(df_word)
str(df_word)

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

# 두 글자 이상 단어만 추출
df_word <- filter(df_word, nchar(word) >= 2)
df_word
View(df_word)

# 빈도수가 많은 순으로 상위 20개만 추출하여 변수 저장
top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

View(word)

# 아래와 같이 출력해보니 북한, 대한민국, 좌파 등등이 많이 사용된 것을 알 수가 있다.
top_20
library(ggplot2)
order <- arrange(top_20, freq)
order

# 그래프로 그려보니 무려 북한이란 단어가 대한민국의 3배나 된다. 이것은 국정원 트윗에서
# 북한이라는 용어가 많이 등장했으며, 이를 이슈화 시키려고 했다는 것을 반증하고 있다고 할 수 있다.

ggplot(data = top_20, aes(x = word, y = freq)) +
  ylim(0, 2800) + 
  geom_col(fill = "black", colour = "yellow") + 
  coord_flip() +
  scale_x_discrete(limit = order$word) + # 빈도순으로 막대 정렬
  geom_text(aes(label = freq), hjust = -0.3) # 빈도를 표시함

# 위의 자료로 워드클라우드 만들기
pal <- brewer.pal(8, "Dark2")
pal1 <- brewer.pal(9, "Blues")[5:9]
set.seed(1234)
wordcloud(words = df_word$word,         # 단어
          freq = df_word$freq,          # 빈도
          min.freq = 10,                # 최소단어 빈도
          max.words = 100,              # 최대단어 빈도
          random.order = FALSE,         # 단어 빈도 높은 것을 중앙에 배치
          rot.per = .1,                 # 회전 단어 비율
          scale = c(6, 0.2),            # 단어 크기 목록
          colors = pal)                 # 색상 목록

df_word$word <- gsub("북한", "", df_word$word)
