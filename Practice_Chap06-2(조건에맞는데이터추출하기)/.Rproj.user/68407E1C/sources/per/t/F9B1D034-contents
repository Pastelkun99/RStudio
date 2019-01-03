# 우선 데이터를 분석하기 위해서는 데이터를 자유자재로 다룰 수 있어야 한다.
# 추출, 종류별로 나누거나 여러 데이터들을 합치는 작업 등을 말한다.
# 이러한 것을 데이터 전처리 (data preprocessing) 이라고 하며, 비슷한 말로 데이터 가공(data manipulation),
# 데이터 핸들링(data handling), 데이터 랭글링(data wrangling)이라고도 한다.
# 데이터 전처리 작업을 할때 가장 많이 사용하는 패키지는 바로 dplyr이다.
# 앞선 시간에서 rename()함수를 호출하기 위해 불러들였던 패키지이다.

# filter함수에 대해서 알아보자.
# filter() 함수는 dplyr패키지에 있는 함수로 원하는 데이터를 추출할 때 쓰이는 함수이다.

library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
View(exam)
dim(exam)
str(exam) # structure

# 데이터를 확인해보면, 5개의 class로 구성된 것을 볼 수 있다.
# 1 class만 추출해보자.

exam %>% filter(class == 1)

# 위에서 %>% 표식은 dplyr 패키지에 존재하며, %>% 는 파이프 연산자라고도 한다.
# 여러 함수들을 연결하는 기능을 하며, Ctrl + Shift + M 으로 사용가능하다.

# 2 class 만 추출
exam %>% filter(class == 2)

# 1 class가 아닌 것만 추출
exam %>% filter(class != 1)

# 3 class가 아닌 것만 추출
exam %>% filter(class != 3)

# 이제는 부등호를 사용해서 초과, 미만, 이상, 이하의 조건을 걸어서 데이터를 추출해보자.

# 수학점수가 50점을 초과하는 데이터
exam %>% filter(math > 50)

# 수학점수가 50점 미만인 데이터
exam %>% filter(math < 50)

# 영어점수가 80점 이상
exam %>% filter(exam$english >= 80)
exam %>% filter(english >= 80)

# 영어점수가 80점 이하
exam %>% filter(english <= 80)

# 1반이면서 수학점수가 50점 이상
# 두 개의 조건을 다 만족해야 결과가 출력되는 것은 연산자 &을 사용, 하나만 만족해도 출력하고자 한다면 |를 사용함
exam %>% filter(class == 1 & math >= 50)

# 2반이면서 영어점수가 80점 이상
exam %>% filter(class == 2 & english >= 80)

# 수학점수가 90점 이상이거나 영어점수가 90점 이상인 경우
exam %>% filter(math >= 90 | english >= 90)

# 영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
# 이렇게 조건이 주어지면 science < 50 조건은 의미가 없어진다.
# 논리적으로 보면 안맞다. 영어는 90점 미만인데, 과학이 50점이 넘을 수도 있기 때문.
exam %>% filter(english < 90 | science < 50)
exam %>% filter(english < 90)

# class가 1, 3, 5인 데이터만 추출
exam %>% filter(class == 1 | class == 3 | class == 5)

# 또 다른 방법으로 매치 연산자(match operator)인 %in%를 사용해도 좋다.
exam %>% filter(class %in% c(1, 3, 5))

# 추출한 행을 데이터로 만들수도 있다.
class1 <- exam %>% filter(class == 1) # 1반만 추출
class1

class2 <- exam %>% filter(class == 2) # 2반만 추출
class2

# 1반, 2반의 수학 평균
mean(class1$math)
mean(class2$math)