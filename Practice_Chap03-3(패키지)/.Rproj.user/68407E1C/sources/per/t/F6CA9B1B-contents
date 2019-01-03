# 함수를 앞서 배웠다. 여기서는 패키지에 대해서 알아보는데, 쉽게 생각하자.
# 패키지는 함수들을 모아놓은 꾸러미라고 생각하면 이해하기 쉬울 것이다.

# 데이터를 그래프로 표현하는 작업을 할 때 가장 많이 쓰는 패키지인 ggplot2 인스톨한다.
install.packages("ggplot2")

# 인스톨 된 ggplot2 패키지를 R스튜디오에 로딩하는 명령어임.
library(ggplot2)

# 변수 저장
x <- c("a", "b", "c", "d")
# x <- c("a", "b", "c", "d", "a")
x

# qplot()는 인자값의 빈도수를 그래프로 보여주는 함수이다.
qplot(x)

# 아래 내용은 mpg(Mile Per Gallon)라는 것은 미국에서 그냥 공개한 데이터이다.
# 여기서는 앞서 말했듯이 인자값이 어떻게 변하느냐에 따라 기능이 달라진다는 것을 확인하고 인지하자.
# 자세한건 뒤에서 더 다루도록 한다.
qplot(data = mpg, x = hwy)

qplot(data = mpg, x = cty)

# x축을 drv, y축을 hwy로 설정
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# 박스로 보이기 
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# 함수의 기능이 궁금하면 help를 이용하면 편리하다.
?qplot

# 색상 변경
qplot(data = mpg, x = drv, y=hwy, geom="boxplot", colours=drv)