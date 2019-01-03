# 앞에서 filter()함수에 대해서 알아보았다.
# 이제는 필요한 변수만 추출하는 select()함수에 대해서 알아보자.

library(dplyr)
exam <- read.csv("csv_exam.csv")

# exam에서 math변수 값만 추출
exam %>% select(math)

# exam에서 english변수 값만 추출
exam %>% select(english)

# exam에서 여러 변수 추출하기
exam %>% select(class, math, english)

# math만 제외하고 출력하기
exam %>% select(-math)

# math, endlish를 제외하고 출력하기
exam %>% select(-math, -english)

# dplyr패키지의 함수 조합해서 결과 추출하기
# 1반의 math만 추출
exam %>% filter(class == 1) %>% select(class, math)

# 위의 것 보다는 아래의 것이 더욱 가독성이 좋습니다.
exam %>% filter(class == 1) %>%
         select(class, math)

# 같은 결과를 도출함.
exam %>% select(id, math) %>% 
         head()

exam %>% select(id, math) %>% 
         head

# 10개의 데이터만 추출
exam %>% select(id, math) %>% 
         head(10)