# 데이터를 정렬하는 법을 배워보자.
# 먼저 정렬을 하려면 기준이 되는 변수가 있어야만 할 것이다.

exam <- read.csv("csv_exam.csv")

library(dplyr)

# exam 데이터 프레임에서 math변수를 중심으로 오름차순 정렬이 된다.
exam %>% arrange(math)

# 내림차순으로 정렬하려면 desc(descending) 함수를 사용하면 된다.
exam %>% arrange(desc(math))