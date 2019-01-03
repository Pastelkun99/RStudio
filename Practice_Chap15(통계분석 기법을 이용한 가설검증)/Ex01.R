# 통계 분석은 기술통계와 추론통계로 나눌 수 있다.

# 기술통계(Descriptive statistics)
# 사람들이 받는 월급을 집계해서 전체 월급의 평균을 구한다면 이는 '기술통계분석'이라고 한다.

# 추론통계(Inferential statistics)
# 단순히 숫자를 요약하는 것을 넘어서 어떤 값이 발생할 확률을 계산하는 통계기법이다.

# 예를들면, 수집된 데이터에서 성별에 따라 월급에 차이가 있는 것으로 나타났을때, 이런 차이가 우연히 발생할 확률을 계산한다.
# 만약, 이런 차이가 우연히 나타날 확률이 작다면 성별에 따른 월급의 차이가 통계적으로 유의하다
# (statistically significant)고 결론내린다.
# 그러나, 이런 차이가 우연히 나타날 확률이 크다면 성별에 따른 월급차이가 통계적으로 유의하지 않다(not statistically significant)고 결론내린다.
# 일반적으로 통계분석을 수행했다는 것은 추론 통계를 통해 가설 검정을 했다는 것을 의미한다.
# 기술통계분석에서 집단 간 차이가 있는 것으로 나타났더라고 이는 우연에 의한 차이일 수도 있다.
# 따라서 데이터를 이용해서 신뢰할 수 있는 결론을 내리려면 유의확률을 계산하는 통계적 가설 검정 절차를 거쳐야 한다.

# 우선 유의확률(Significant probability, p-value)를 검정할 수 있는 t검정에 대해서 알아보자.

# 먼저 ggplot2에 mpg데이터를 이용해서 t검정을 수행하는 방법을 살펴보자.
# 소형차와 suv가 도시연비(cty)에서 통계적으로 유의한 차이가 있는지 보자.
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

mpg_diff <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)
# t.test()를 이용해서 t검정을 하자.
# t검정은 비교하는 집단의 분산(값이 퍼져있는 정도)이 같은지 여부에 따라 적용하는 공식이 다르다.
# 여기서는 같다고 가정하고 var.equals에 T를 지정하자.
t.test(data = mpg_diff, cty ~ class, var.equal = T)

# p-value(유의확률)는 보통 5%를 판단 기준으로 삼고 0.05미만이면 집단간 통계 차이가 유의하다라고 해석한다.
# 즉 이건 우연이라고 보기에는 어렵다는 뜻이다. 따라서 분석결과 compact, suv간 평균 도시 연비 차이는 통계적으로 유의하다.
# 왜냐하면, 2.2*10의 -16승이므로 0.05보다 작기 때문이다.

# 이번에는 일반 휘발유(regular)와 고급 휘발유(premium)을 쓰는 자동차간에 도시연비차이가 유의한지 확인해보자.
mpg_diff2 <- mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))   # r: 일반 휘발유, p: 고급 휘발유

mpg_diff2
table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)

# 분석 결과를 보면 p-value가 0.05보다 큰 0.2875이다. 
# 실제로는 차이가 없는데 우연에 의해 이런 차이가 관찰될 확률이 28.75%라는 의미이다.
# 따라서 휘발유에 의한 차이는 자동차간 도시연비차이에 통계적으로 유의하지 않다.
# 출력결과의 'sample estimates' 부분을 보면 고급 휘발유 자동차의 연비가 0.6정도 높지만
# 이런 정도는 우연히 발생했을 가능성이 크다고 해석한다.


# 상관 분석 - 두 변수의 관계성 분석
# 상관분석(Correlation Analysis) 은 두 연속변수가 서로 관련이 있는지 검정하는 통계분석이다.
# 상관 분석을 통해 도출한 상관계수(Correlation coefficient)로 두 변수가 얼마나 관련이 있는지 관련성 정도를 파악할 수 있다.
# 통상 상관계수는 절댓값 0~1 사이의 값을 지니며, 1에 가까울수록 관련성이 크다는 것을 의미한다.
# 상관계수가 양수면 정비례, 음수면 반비례관계이다.

# ggplot2패키지의 economics데이터를 이용하여 unemploy(실업자수)와 pce(개인소비지출)간의 통계적으로 유의한 상관관계가 있는지 살펴보자.
# R에 내장된 cor.test()를 이용하면 상관분석을 할 수 있다.
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

# 출력결과를 보면 p-value가 0.05미만이므로 실업자수와 개인소비지출의 상관이 통계적으로 유의하다.
# 출력결과 맨 아래 'cor'가 바로 상관계수이다. 0.61실업자수와 개인소비지출은 한 변수가 증가하면 다른 변수도 증가하는 정비례 관계이다.

# 상관행렬 히트맵 만들기
# 여러 변수의 관련성을 한 번에 알아보고자 할 경우, 모든 변수의 상관관계를 나타낸 상관행렬(Correlation Matrix)
# 를 만들어 봄으로서 파악할 수 있다.
# R에 내장된 mtcars 데이터를 이용해 상관행렬을 만들어보자. mtcars는 32종의 자동차의 11개 속성에 대한 정보를 담고 있는 데이터이다.
# cor()을 이용하면 상관행렬을 만들 수 있다.

head(mtcars)
car_cor <- cor(mtcars) # 상관 행렬 생성

car_cor

class(car_cor)         # matrix임을 알 수 있다.

round(car_cor, 2)      # 소수점 3번째 자리에서 반올림 해 출력

# 분석 결과를 샘플로 보면 mpg(연비) 행과 cyl(실린더수)의 열이 교차할 때 상관계수가 -0.85 이므로 연비가 높을 수록 실린더수가 작다는 반비례 관계가 성립된다.
# cyl(실린더수)와 wt(무게)의 상관계수가 0.78이므로 실린더수가 많으면 무게가 증가한다는 정비례 관계가 성립한다.

# 하지만, 이렇게 보는 것보다 그래프로 보는게 한눈에 확인이 쉽다.
# 따라서 corrplot패키지의 corrplot()을 이용해서 상관행렬 히트맵을 만들어보자.
install.packages("corrplot")
library(corrplot)

# 출력된 결과를 볼때 상관계수가 클수록 원의 크기가 크고 색깔이 진하다.
# 아울러 양수면 파란색, 음수면 빨간색 계열로 표현되어 있다.
corrplot(car_cor)

# 수치로 보고 싶으면 인자값을 number로 주면 된다.
corrplot(car_cor, method = "number")


