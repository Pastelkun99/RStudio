# 변수명 바꾸기
# 이 내용을 배우는 궁극적인 이유는 빅데이터 분석가가 편하기 위함이다.
# 여러 데이터를 수집해서 분석하다보면 남성, 여성 이런 데이터의 속성이 알아볼 수 없게 H_901
# 이런식으로 되어 있는 것을 sex로 바꾸면 분석하기가 용이할 것이다.

# 원본 데이터 프레임 생성
df_raw <- data.frame( var1 = c(1, 2, 1),
                      var2 = c(2, 3, 2)
                    )
df_raw

# 복사본 만들기
df_new <- df_raw
df_new

# 위와 같이 복사본을 만드는 이유는 통상 원본의 데이터를 보존하기 위해 복사본을 만들어 작업한다.
# 잘못된 분석을 하게 되면 다시 원상복구시키기가 매우 까다롭기 때문이다.

# 이제 변수명을 바꿔보도록 하자. 먼저 rename()함수를 사용하기 위해 dplyr패키지를 설치하고 로드하자.
install.packages("dplyr")
library(dplyr) #R로 로딩

# rename()함수는 인자값으로 대상데이터프레임, 바뀌어져야할 변수명 = 기존변수명으로 주면
# 원하는 변수명으로 바꿀 수 있다.
df_new <- rename(df_new, v2 = var2)
df_new

# 2개의 데이터를 비교해 보자. 변수명이 바뀐 것을 확인 가능하다.
df_raw
df_new

# 112 페이지 실습
rm(df_new)
rm(df_raw)