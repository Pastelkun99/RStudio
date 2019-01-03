library(dplyr)
library(ggplot2)

mpg <- as.data.frame(ggplot2 :: mpg)
mpg

# df_mpg변수에 mpg데이터프레임에서 구동별(drv) 로 그룹하여 고속도로 연비(hwy)의 평균값 지정
df_mpg <- mpg %>% 
  group_by(drv) %>% 
 summarise(mean_hwy = mean(hwy))

df_mpg
str(df_mpg)

# data.frame구조를 가지고 있는 df_mpg데이터를 바차트로 나타내기 위해서 벡터로 값을 변환한다.
drv <- as.character(df_mpg$drv)
drv
mean_hwy <- as.numeric(df_mpg$mean_hwy)
mean_hwy

# 벡터로 나타낸 바차트
barplot(mean_hwy, names.arg = drv, main = "구동별 평균연비:", 
        col = rainbow(length(mean_hwy)), xlab = "구동", ylab = "평균연비")

# 이제 위에 만들어진 df-mpg를 이용하여 막대그래프를 그려보자.
# 앞서 했지만, aes의 x축에 범주를 나타내는 변수를 지정하고 y축에 평균값을
# 나타내는 변수를 지정한다. + 기호로 연결해 막대그래프를 만드는 함수인 geom_col()을 추가한다.
library(ggplot2)

# 막대그래프는 기본적으로 해당 범주의 알파벡 순으로 정렬된다.
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

# reorder()에 xㅊ의 매개값으로 준 막대의 값이 크기순으로 오름차순 정렬한다.
ggplot(data = df_mpg, aes(reorder(x = drv, mean_hwy), y = mean_hwy)) + geom_col()

# 내림차순으로 하고자 할때는 x축의 mean_hwy의 앞에 - 를 붙이면 된다.
ggplot(data = df_mpg, aes(reorder(x = drv, -mean_hwy), y = mean_hwy)) + geom_col()

# 변수의 값이 숫자와 문자로 함께 구성되어 있으면 숫자 오름차순, 알파벳 오름차순으로 정렬된다.

# 막대그래프는 빈도별로도 만들 수 있다. 빈도별로 그리자면 로우데이터를 이용해야하며, y축은 필요없다.
# 왜냐면 빈도를 표시할 것이기 때문이다.
ggplot(data = mpg, aes(x = drv)) + geom_bar()

# x축에 연속변수를 지정하면 값은 분포를 쉽게 파악할 수 있다.
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

# 보통 geom_col()은 데이터를 가공 즉 요약해서 프레임을 만드어 표식할때 쓰이며,
# geom_bar()는 원자료 즉 , 로우데이터를 이용해서 바로 표시하고자 할 때 쓰인다.