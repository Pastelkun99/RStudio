# 이번 장에서는 데이터 정제에 대해서 알아보자.

# 정제란?
# 1. 정성을 들여 정밀하게 잘 만듦
# 2. 물질에 섞인 불순물을 없애 그 물질을 더 순수하게 함.
#    위와 같은 사전적 의미 중에, 2번에 가깝다고 할 수 있음.
# 즉 데이터의 오류가 있는 것을 걸러내는 작업을 의미한다고 볼 수 있다.

# 결측치를 제거하는 방법에 대해 알아보자.
# 아래 데이터 프레임을 만드는데 NA라는게 들어가있다. 이것은 곧 결측치를 의미하는 것이다.
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df

# 결측치를 찾는 것은 is.na(데이터프레임명)을 통해 알 수 있다
# 여기서 TRUE로 나온 값이 바로 결측치이다.
is.na(df)

# table()적용하면 TRUE의 빈도수를 알 수 있다.
table(is.na(df))

# 결측치를 제거하려면 데이터를 전체적으로 보는것이 아니라, 변수(컬럼)명을 알아야 한다.
table(is.na(df$sex))
table(is.na(df$score))

# 결측치가 존재하는 변수는 아래와 같이 정상적인 연산이 수행되지 않는다.
# 따라서 결측치를 제거한 후 연산을 시행해야 한다.
mean(df$score)
sum(df$score)

# 결측치를 제거해보자.
# 앞에서 배운 dplyr패키지의 함수를 이용한다.
library(dplyr)

# score열의 결측치 출력
df %>% filter(is.na(df$score))

# score열의 결측치를 제거하고 출력함 (! 기호가 붙음)
df %>% filter(!is.na(df$score))

# sex열의 결측치도 같이 제거해보자.
df %>% filter(!is.na(df$score) & !is.na(df$sex))

# 위에서 나온 결과를 또 다른 프레임 변수에 할당한다.
df_nomiss <- df %>% filter(!is.na(df$score) & !is.na(df$sex))
df_nomiss

# 데이터 프레임에 있는 결측치들을 한꺼번에 제거하는 방법에 대해서 알아보자.
df_nomiss2 <- na.omit(df)
df_nomiss2
# na.omit()는 결측치를 한꺼번에 제거한다.

# 그러나 한꺼번에 결측치를 제거하는 na.omit()이 편하기는 하지만,
# 분석을 할때에는 분석에 필요한 데이터까지도 지워버릴 우려가 있으므로,
# 상황에 맞게 사용하기를 권장한다.
# 통상 filter를 사용해서 분석한다.

# 수치 연산 함수들은 결측치를 제외하고 연산하도록 인자값으로 na.rm(na를 remove)를 지원한다.
# TRUE로 설정하면 결측치를 제거하는 절차를 건너뛰고 연산을 수행한다.
mean(df$score, na.rm = "TRUE")
sum(df$score, na.rm = "TRUE")

# dplyr패키지에 있는 summarise(요약통계량 산출)도 na.rm을 제공한다.
exam <- read.csv("csv_exam.csv")
View(exam)

# 아래 []사이의 의미는 쉼표를 기준으로 왼쪽은 행의 값, 오른쪽은 열의 값을 나타낸다.
# 즉 math열 3, 8, 15행에 NA값을 저장하라는 것이다.
exam[c(3, 8, 15), "math"] <- NA
exam

# 결측치가 math열에는 3개 있기 때문에 평균값이 나오지 않는다.
exam %>% summarise(mean_math = mean(math))

# 결측치 제외 후 평균 산출
exam %>% summarise(mean_math = mean(math, na.rm = "TRUE"))

exam %>% summarise(mean_math = mean(math, na.rm = "TRUE"),
                   sum_math = sum(math, na.rm = "TRUE"),
                   median_math = median(math, na.rm = "TRUE")
                   )

# 데이터가 크고 결측치가 얼마 없다면, 결측치를 제거하고 분석해도 무방하지만,
# 소규모 데이터이고 결측치가 많다면 결측치를 다 제거하면 많은 데이터가 손실되어
# 분석 결과가 왜곡될 가능성이 높다.
# 이 부분을 대처하기위해 결측치 대처법(imputation) 이라는 방법이 있다.

# 평균값으로 결측치 대체하는 방법
mean(exam$math, na.rm = "TRUE")      # 대충 평균 55정도로 본다.

# math열의 값이 NA이면 평균값이 55로 대체된다.
exam$math <- ifelse(is.na(exam$math), 55, exam$math)

# 확인해보니 NA값이 없다.
table(is.na(exam$math))
exam

mean(exam$math)
