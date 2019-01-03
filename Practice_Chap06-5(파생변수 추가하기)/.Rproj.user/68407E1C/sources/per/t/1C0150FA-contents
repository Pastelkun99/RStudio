# 이번 장에서는 앞서 좀 다루었던 파생변수를 함수를 통해 추가하는 법을 알아보자.
# 앞에서 다룰 때에는 $를 이용해서 데이터프레임에 파생변수를 만들었다.
# 하지만, 코드량이 길어징때는 이 장에서 공부하게 될 mutate()함수를 적절히 이용하면 편리하다.

exam <- read.csv("csv_exam.csv")
library(dplyr)
exam

# exam에 있는 변수의 값들을 다 더하는 총합 변수를 추가해보도록 하겠다.
# 앞서 배운 방법
exam$total = exam$math + exam$english + exam$science
exam

# mutate() 함수 이용방법
exam %>% 
    mutate(total = math + english + science) %>% head(5)

# 또 다른 차이점은 앞서 배운 방법은 데이터 프레임에 total이라는 변수를 만들어 버리지만
# mutate()를 이용하면 그 순간만 결과값을 볼 수가 있다는 것이다.

# exam에 여러 파생변수를 한번에 추가하는 것을 보도록 하자.
exam %>% 
    mutate(total = math + english + science, # 총합 변수 추가
           mean = (math + english + science) / 3.0) %>% # 평균 변수 추가
          head()
exam

# mutate()에 조건문 적용하기
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
        head()

# mutate() 통해 생성된 변수를 기준으로 바로 정렬해보기
exam %>% 
  mutate(total = math + english + science) %>% 
        arrange(total) %>% 
        head()