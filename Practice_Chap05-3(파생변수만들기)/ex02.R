# 변수를 이용해 파생변수를 만들수도 있지만, 조건문함수를 이용해서도 만들 수 있다.

# 기준값을 정하기 위해 합격여부를 지을 수 있는 내용은 중앙값과 평균이 될 것이다.
summary(mpg$total)

# 히스토그램으로 연비의 빈도를 연비로 볼 수 있다.
# 히스토그램으로 보면 20~25에 데이터가 많이 분포되어 있고 또한 연비의
# 중앙값과 평균은 약 20정도로 보면 된다. 기준을 20으로 잡아보자.
hist(mpg$total)

# mpg$test파생변수에 total(통합연비)값이 20이상이면 합격, 이하면 불합격을 저장한다.
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)

# 합격과 불합격의 데이터 빈도수를 쉽게 알 수 있는 함수 table()을 사용해보자.
# 합격이 128이고 불합격이 106임을 알 수 있다.
table(mpg$test)

# 이 수치를 그래프화 하면 한 눈에 들어온다.
library(ggplot2)
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성

# 중첩 조건을 이용해서 좀더 데이터를 구체적으로 분석해보자.
# grade변수를 생성하는데 total 값이 30 이상이면 A를, 20~29.9999사이는 B를, 그 이하는 C를 주자.
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))

table(mpg$grade)
qplot(mpg$grade)

# 여기서 좀 더 구체화를 하고자 한다면 중첩조건함수가 더 들어가면 될 것이다.
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C", "D")
                            )
                     )
table(mpg$grade2)
qplot(mpg$grade2)