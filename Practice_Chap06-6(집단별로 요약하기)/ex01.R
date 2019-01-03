# 이제 데이터프레임의 내용을 집단별로 구분하여 요약한 값을 구하는 방법에 대해 알아보자.
# group_by()함수와 summarise()함수의 사용법에 대해 알아보자.

exam <- read.csv("csv_exam.csv")
exam
View(exam)

library(dplyr)

# 아래 2개의 함수의 차이점을 보면 summarise()는 math변수의 데이터를 합산하여 평균치 하나만 출력하지만
# mutate()는 math데이터의 평균치를 구하는 것은 동일하나 각 행에 다 적용이 되어 출력된다.
# 따라서 summarise()는 요약할 때, group_by()함수와 병행해서 사용하곤 한다.
exam %>% summarise(mean_math = mean(math))
exam %>% mutate(mean_math = mean(math))

# 집단별로 요약하기
# 아래 결과를 보면 class를 그룹별로 나누고 난 후, math의 평균을 mean_math변수에 할당하여 출력해준다.
# tibble은 dataframe의 상위버전이고 몇가지 기능이 더 추가된 것으로 이해하자.
# 활용형태는 dataframe과 동일하다.
# int는 정수이고 dbl은 double의 약자이다. 이미 프로그래밍 시간에 공부한 것.

exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math))

# 여러 요약 통계랑 한번에 산출하기
# 1개의 데이터를 추가해보았다.
# 출력결과는 math의 평균, 합계, 중앙값, 그리고 n()은 count와 유사한 함수인 빈도수를 구하는 것이다.
# 즉 n()함수는 행의 갯수를 구하는것과 동일하다.
exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math),
              sum_math = sum(math),
              median_math = median(math),
              n = n()
              )

mpg <- as.data.frame(ggplot2::mpg)
mpg

# 아래와 같이 mpg데이터를 가지고 group_by를 하는데 인자값이 두개 들어가게 되면
# 먼저 첫번째 인자로 분류하고 나서 두 번째 인자로 그 평균값을 구하게 된다.
# 즉, 다시 말하면 상위집단에서 하위 집단으로 나뉘는 것이다.
mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>%                  # 우선 제조사 별로 분류하고
  filter(class == "suv") %>%                  # 그 제조사별로 분류한 것에서 suv만 추출
  mutate(tot = (cty+hwy)/2) %>%               # 통합 연비 변수를 생성한다.
  summarise(mean_tot = mean(tot)) %>%         # 통합 연비의 평균을 구하고
  arrange(desc(mean_tot)) %>%                 # 내림차순 정렬한다.
  head(5)

top_5 <- mpg %>% 
  group_by(manufacturer) %>%                  # 우선 제조사 별로 분류하고
  filter(class == "suv") %>%                  # 그 제조사별로 분류한 것에서 suv만 추출
  mutate(tot = (cty+hwy)/2) %>%               # 통합 연비 변수를 생성한다.
  summarise(mean_tot = mean(tot)) %>%         # 통합 연비의 평균을 구하고
  arrange(desc(mean_tot)) %>%                 # 내림차순 정렬한다.
  head(5)

class(top_5)
top_5

height <- as.numeric(top_5$mean_tot)
name <- as.character(top_5$manufacturer)
name
height
barplot(height, names.arg = name, main = "제조사별 통합연비",
        col = rainbow(length(height)), xlab = "제조사", ylab = "통합연비",
        ylim = c(0, 25))