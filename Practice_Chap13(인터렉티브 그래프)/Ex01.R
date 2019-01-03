# plotly 패키지로 인터랙티브 그래프 그리기
# 인터랙티브(interactive graph) 그래프는 마우스 움직임에 반응을 하여 실시간으로 형태가 변하는 그래프이다.
# 인터랙티브 그래프를 자유롭게 조작하면서 관심있는 부분을 자세히 살펴볼 수 있는 장점이 있다.
# 그리고 그래프를 HTML포맷으로 저장하면, 일반 사용자들도 웹브라우저를 통해 그래프 조작이 가능하다.

# 인터랙터에 필요한 plotly패키지를 설치하고 로딩하자.
install.packages("plotly")
library(plotly)
library(ggplot2)

# ggplot로 만든 ggplotly()에 매개변수로 주면 인터랙티브 그래프가 만들어진다.
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
p

# 배기량에 따른 고속도로 연비를 산점도로 나타낸 것을 인터랙티브 그래프로 나타내었다.
# 마우스로 드래그하면 그 부분을 확대해서 볼 수 있고 다시 화면을 더블클릭을 하면 원상복귀된다.
# 크롬으로 열면 깨질 수도 있으니 인터넷 웹브라우저로 열자.
ggplotly(p)
# diamonds 데이터는 ggplot2에 내장된 데이터이며, 다이아몬드 5만여개의 캐럿, 커팅방식, 가격 등의 속성을 담음
diamonds
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")

ggplotly(p)

# 13-2 dygraphs 패키지로 인터랙티브 시계열 그래프 만들기
# 이번에는 시간에 따른 데이터의 변화를 표현한 인터랙티브 시계열 그래프를 만들어보자.
# 인터랙티브 시계열 그래프를 이용하면 마우스로 시간축을 움직이면서 시간에 따라 데이터가 어떻게 변하는지
# 자세히 살펴볼 수 이다.

# 인터랙티브 시계열 그래프 만들기위해서 dygraph패키지를 설치하고 로딩하자.
install.packages("dygraphs")
library(dygraphs)
library(xts)

# 데이터는 내장 데이터셋인 economics를 이용하자.
economics

# dygraphs패키지를 이용해 인터랙티브 시계열 그래프를 만들려면 데이터가 시간 순서속성을 지니는
# xts(extensible time-series)데이터 타입으로 되어 있어야 한다.
eco <- xts(economics$unemploy, order.by = economics$date)
head(eco)

# dygraph()를 이용하여 인터랙티브 그래프를 만들자
# 선위에 마우스 커서를 올리면 그래프 오른쪽 위에 날짜와 실업자 수가 표시된다.
# 역시 마우스 드래그하면 특정기간만 확대할 수 있고, 더블클릭하면 원래대로 돌아온다.
dygraph(eco)

# dyRangeSelector()를 파이프 연산해서 추가하면, 그래프 아래에 날짜 범위 선택 기능이 추가된다.
# 버튼을 움직여 특정 기간만 선택할 수 있고, 범위를 정한 뒤 좌우로 움직이면 
# 시간에 따라 데이터가 어떻게 변하는지 알 수 있다.
library(dplyr)
dygraph(eco) %>% 
  dyRangeSelector()

# 인터랙티브 시계열 그래프에 여러 값들을 동시에 표현할 수 있다. economics데이터의 unemploy(실업자수)와
# psavert(저축률)를 그래프에 함께 표현해보자.
# 먼저, unemploy변수와 psavert변수를 xts타입으로 바꾸고 unemploy변수는 1000명 단위로 되어있으니
# psavert와 비교해 보기 쉽고록 1000으로 나눠 100만명 단위로 수정하다.

# 저축률
eco_a <- xts(economics$psavert, order.by = economics$date)
eco_a

eco_b <- xts(economics$unemploy/1000, order.by = economics$date)
eco_b

# 위에서 만든 두 xts타입의 두 변수를 cbind()를 이용하여 합치자.
eco2 <- cbind(eco_a, eco_b)
View(eco2)
class(eco2)

# eco2는 xts타입이므로 rename를 적용 못하니 colnames()를 통해 변수명을 알아보기 쉽게 바꾸도록 하자.
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

# 그래프 그리기
dygraph(eco2) %>% 
  dyRangeSelector()
