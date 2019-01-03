# 통상 데이터를 수집할때, 우리가 생각했던 범주에서 크게 벗어난 값을 '이상치(outlier)' 라고 한다.
# 현장에서 만들어진 실제 데이터는 이상치가 포함될 수 있다. 오류는 아니나, 극단적인 값이 존재가능하다.
# 이런 이상치가 존재한다면 분석결과가 왜곡될 수 있으므로 데이터 분석에 앞서 이런 이상치를 제거할
# 필요가 있다.

# 아래코드는 논리적으로 보여도 존재할 수 없는 값이 데이터에 포함되어 있다.
# 남자는 1, 여자는 2로 되어 있는 성별 변수에 3이라는 값은 존재하면 안된다.
# 이는 분명한 오류이므로, 결측치로 변환한 후 분석에서 제외해야만 한다.

# outlier변수에는 벡터가 2개 존재하는데
# sex에는 1과 2가 있어야 하며, score에는 1~5까지만 존재하여야 한다.
# 하지만, 3, 6이라는 이상치가 존재한다.
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier

install.packages("dplyr")
library(dplyr)

# 먼저 이상치를 확인하기위해 table()을 이용해 빈도표를 생성해보자.
table(outlier$sex)
table(outlier$score)

# 그럼 이상치를 어떻게 제거해야 하나? 우선, ifelse를 이용해 결측치로 변경하여 NA를 부여한다.

# sex 가 3이면 NA를 할당.
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

# 위와 똑같은 방법으로 score에도 NA를 할당
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

# 이제 이상치를 결측치로 변경했으니, 분석할 때 결측치를 제외하고
# filter를 이용해서 남녀별로 score를 구해보자.
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

# 그리고 논리적으로 존재할 수 있지만 극단적으로 크거나 작은 값을
# 극단치라고 한다. 몸무게가 200kg라면, 존재할 수는 있겠지만
# 상대적으로 굉장히 드문 경우에 해당한다.
# 극단치 역시 분석결과를 왜곡할 수 있으므로, 분석하기전에는 제거를 해야할 것이다.
# 통게적으로 상하위 0.3% 또는 +-3 표준편차에 해당핢만큼 극단적으로 크거나 작으면
# 극단치로 간주한다.
# 또는 boxplot을 이용해 중심에서 크게 벗어난 값을 극단치로 볼 수도 있다.
install.packages("ggplot2")

mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
mpg
View(mpg)
# 아래 결과를 분석해보면 
# 1인덱스는 아래쪽 극단치 경계, 2 인덱스는 1사분위수, 
# 3번째 인덱스는 중앙값, 4번째 인덱스는 3사분위수, 
# 5번째 인덱스는 위쪽 극단치 경계를 의미한다.
# 이런 분석을 통해서 12~37을 벗어나면 통상 극단치로 분류한다.
boxplot(mpg$hwy)$stats

# 그럼 위에서 극단치를 알아냈으니, 극단치를 결측치로 대체하자.
# 대체되는 극단치는 3개이다.
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

# 이제 결측치로 대체가 되었으니 결측치를 제외하고 hwy의 평균을 구해보자.
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = "TRUE"))
View(mpg)

# 1. 결측치 정제하기
# 결측치 확인
table(is.na(df$score))

# 결측치 제거
df_nomiss <- df %>% filter(!is.na(score))

# 여러 변수 동시에 결측치 제거
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))

# 함수의 결측치 제외 기능 이용하기
mean(df$score, na.rm = T)
exam %>% summarise(mean_math = mean(math, na.rm = T))

# 2. 이상치 정제하기
# 이상치 확인
table(ourlier$sex)

# 결측 처리
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)

# boxplot으로 극단치 기준 찾기
boxplot(mpg$hwy)$stats

# 극단치 결측 처리
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)