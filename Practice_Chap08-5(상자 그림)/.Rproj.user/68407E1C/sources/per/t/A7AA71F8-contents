# 상자그림(box plot)은 데이터의 분포(퍼져 있는 형태)를 직사각형 상자 모양으로 표현한 그래프이다.
# 상자그림은 평균만 볼때보다는 데이터의 분포를 알 수 있으므로, 데이터의 특징을 자세히 이해할 수 있다는 
# 장점이 있다.

library(ggplot2)

# x축에는 구동방식(drv), y축은 고속도로 연비(hwy)를 geom_boxplot()로 상자그림형태로 표현한다.
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot();

# 상자그림은 값을 크기 순으로 나열해 4등분 했을때, 위치하는 값인 '사분위수'를 이용하여 나타낸다.
# 상자 아래 세로선 : 아랫수염, 하위 0~25% 내에 해당하는 값
# 상자 밑면 : 1사분위수 (Q1), 하위 25%가 위치하는 값
# 상자내 굵은 선 : 2사분위수(Q2) 하위 50%가 위치하는 값(중앙값)
# 상자 윗면 : 3사분위수(Q3), 하위 75%가 위치하는 값
# 상자위 세로선 : 윗수염, 하위 75~100% 내에 해당하는 값
# 상자 밖 점 표식 : 극단치, Q1, Q3 밖 1.5IQR을 벗어난 값
# 여기서 1.5IQR은 사분위 범위 (Q1~Q3간 거리)의 1.5배를 의미한다.

# class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시연비)가 어떻게 다른지
# 비교해보려고 한다. 새 차종의 cty를 나타낸 상자그림을 그려보시오.
# 또한 그래프를 그렸다면 분석해보시오.

library(dplyr)

df_mpg <- mpg %>% 
  filter(class %in% c("compact", "subcompact", "suv"))
View(df_mpg)

ggplot(data = df_mpg, aes(x = class, y = cty)) + geom_boxplot()

ggplot(data = df_mpg, aes(x = class, y = cty)) + geom_boxplot()