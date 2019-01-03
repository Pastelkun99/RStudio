# R툴을 이용하여 차트를 그려보자.

# pie()
# 패키지 : graphics
# 사용법 : pie(x, labels, clockwise, init.angle, col, min)
# 설명 : 파이차트 출력

# 매개 변수
# x : 음수가 아닌 수치 벡터(부채꼴의 크기로 표현)
# labels : 부채꼴에 대응하는 이름
# clockwise : 부채꼴(x)의 출력방향, 디폴트는 FALSE로 반시계방향
# init.angle : 디폴트는 3시 방향에서 부채꼴 출력
# col : 색깔
# main : 그래프에 대한 전체 제목

# 단순 파이차트
# 차트 생성하기 위해 벡터 값 생성
x <- c(9, 15, 20, 6)
label <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")

# 파이차트 출력
pie(x, labels=label, main="부서별 영업 실적")

# 기준선 변경
# init.angle=90은 기준선을 수직으로 설정하겠다는 것
pie (x, init.angle = 90, labels = label, main = "부서별 영업 실적")

# 색과 라벨 수정
pct <- round(x/sum(x)*100) # 각 항목의 비율 구함
pct

label <- paste(label, pct) # label에 pct를 붙임
label <- paste(label, "%") # label에 %를 붙임
pie(x, labels = label, init.angle = 90, col = rainbow(length(x)), main = "부서별 영업 실적")

# 3d 파이 차트
install.packages("plotrix")
library(plotrix)

# explode는 부채꼴의 간격, labelcex는 라벨문자의 크기 (0.8배로 축소)
pie3D(x, labels = label, explode = 0.1, lebelcex = 0.8, main = "부서별 영업 실적")




# barplot()
# 패키지 : graphics
# 사용법 : barplot(height, width, names.arg, horiz, col, main, sub, xlab, ylab, xlim, ylim)
# 설명 : 수평, 수직의 막대그래프 출력

# 매개변수
# height : 막대의 크기를 나타내는 벡터
# width : 막대의 너비
# names.arg : 각 막대 아래 출력될 이름에 대한 벡터
# horiz : 수직, 수평 설정
# col : 막대에 대한 색, 디폴트는 회색임.
# main : 제목
# xlab, ylab : x, y축 라벨
# xlim, ylim : x, y 축 크기

height <- c(9, 15, 20, 6)
name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
barplot(height, names.arg = name, main = "부서별 영업 실적")

# 막대의 색 지정
barplot(height, names.arg = name, main = "부서별 영업 실적", col=rainbow(length(height)))

# x, y축의 라벨과 크기
# col = rainbow(length(height)) : 막대그래프의 막대 색을 부서의 수만큼 무지개색으로 설정
barplot(height, names.arg = name, main = "부서별 영업 실적",
        col = rainbow(length(height)), xlab = "부서", ylab="영업실적 (억원)")

# ylim = c(0,25) : y 축의 크기( 최소숫자, 최대숫자 )
barplot(height, names.arg = name, main = "부서별 영업 실적",
        col=rainbow(length(height)), xlab="부서", ylab="영업실적 (억원)", ylim=c(0,25))

# 데이터 라벨 출력
bp <- barplot(height, names.arg = name, main="부서별 영업 실적",
              col = rainbow(length(height)), xlab="부서", ylab="영업실적 (억원)", ylim=c(0,25))

# 그래프 각 막대의 문자 데이터 추가, labels는 문자, pos는 문자의 상대적 위치값
# pos가 1이면 막대끝 선의 아래쪽
# pos가 2이면 막대끝 선의 왼쪽
# pos가 3이면 막대끝 선의 위쪽,
# pos가 4이면 막대끝 선의 오른쪽
text(x=bp, y=height, labels=round(height, 0), pos=3)
bp <- barplot(height, names.arg = name, main = "부서별 영업 실적",
              col = rainbow(length(height)), xlab="부서", ylab="영업실적 (억원)", ylim=c(0, 25))

text(x=bp, y=height, labels=round(height, 0), pos=2)

# 바 차트의 수평 회전 (가로 막대)
# horiz = TRUE는 수평으로 나타내어라.
barplot(height, names.arg = name, main = "부서별 영업 실적",
        col= rainbow(length(height)), xlab = "영업실적 (억원)", ylab="부서", horiz=TRUE, width=50)




# 스택형 바 차트 (stacked bar chart)
height1 <- c(4, 18, 5, 8)
height2 <- c(9, 15, 20, 6)

# 행으로 합침(matrix)
height <- rbind(height1, height2)
height
class(height)

name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
legend_lbl <- c("2014년", "2015년") # 범례를 만듦

barplot(height, main = "부서별 영업 실적", names.arg=name, xlab="부서", ylab="영업실적 (억원)",
        col=c("darkblue", "red"), # 그룹별 색
        legend.text=legend_lbl,    # 그룹별 라벨(범례)
        ylim=c(0, 35))

# 그룹형 바 차트(grouped bar chart)
barplot(height, main = "부서별 영업 실적",
        names.arg=name,
        xlab = "부서", ylab = "영업실적 (억원)",
        col=c("darkblue", "red"),
        legend.text=legend_lbl,
        ylim= c(0, 30),
        beside = TRUE, # 막대들을 옆으로 배치
        args.legend=list(x="top"))

# 일반적인 x-y 플로팅
# 인치, 파운드로 
data(women)
View(women)
class(women)

# women의 weight를 벡터로 추출
weight <- (women$weight) * 0.45 # kg표시 전환
height <- (women$height) * 2.54 # cm표시 전환
class(weight) # numeric타입
weight
height

# plot()
# 패키지 : graphics
# 사용법 : plot(x, y, ...)
# 설명 : R객체의 그래프 출력을 위한 일반적인 기능 제공

# 매개변수
# x : x좌표값
# y : y좌표값
# 설명 : R객체의 그래프 출력을 위한 일반적인 기능 제공

# plot그래프 그리기
plot(weight)
plot(height, weight, xlab="키", ylab="몸무게", xlim = c(145, 190), ylim = c(50, 80))

# 플로팅 문자의 출력
# type이 "p"이면 점, type가 "l"이면 선
# type이 "b"이면 점과 선, type이 "o"이면 점위의 선
# type이 "s"이면 계단
plot(height, weight, xlab="키", ylab="몸무게", col="blue", type="s")

# 지진의 강도에 대한 히스토그램
# quake는 내장 데이터 세트임.
head(quakes)
class(quakes)
View(quakes)

# mag는 지진 감도 데이터임
mag <- quakes$mag
mag

# hist() -> 도수 분포(히스토그램)
# 패키지 : graphics
# 사용법 : hist(x, breaks, freq, probability, main, xlim, xlab, col)
# 설명 : 히스토그램을 출력하는 일반적인 기능 제공

# 매개변수
# x : 히스토그램을 위한 벡터데이터
# breaks : 계급구간의 수
# freq : TRUE는 빈도 수
# probability : freq값의 반대
# main : 제목
# xlim, ylim : x, y의 크기
# col : 계급들의 색

hist(quakes$mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수")

# 계급 구간과 색
colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")
class(colors)
hist(mag, main = "지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors, breaks=seq(4, 6.5, by=0.5))

# 선표시
lines(density(quakes$mag))

# 박스 플롯
# boxplot()
# 패키지 : graphics
# 사용법 : boxplot(x, ...)
# 설명 : 박스플롯의 일반적인 기능 제공

# 매개 변수
# x : 박스플롯을 위한 벡터데이터
mag <- quakes$mag
min(mag)
max(mag)
median(mag)
quantile(mag, c(0.25, 0.5, 0.75))
boxplot(mag, main = "지진 발생 강도의 분포", xlab="지진", ylab="발생 건수", col="red")





# 과거 CDNow 거래 데이터의 차트 출력과 분포 파악
# CDNow는 1992년도에 설립된 닷캄의 대표적인 온라인 유통회사로서, 2002년도에 아마존에 매각되었다.
# 1997년 1월 부터 1998년 6월까지의 6919건의 거래에서 각 거래별 CD판매량(cds)에 대한 분석을 해보자.
# 데이터 소스 : http://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv

url <- "http://raw.githubusercontent.com/cran/BTYD/master/data/cdnowElog.csv"
data <- read.csv(url, header=TRUE)
dim(data)
head(data)
class(data)

# 문제 1. 거래량(cds)에 대한 빈도수 (table() 이용)을 히스토그램으로 출력

quantity <- data$cds
table(quantity)
hist(quantity, main = "거래량 분포", xlab="주문당 cd거래량", ylab="빈도 수", ylim=c(0, 5000))

hist(quantity, main = "거래량 분포", xlab="주문당 cd거래량", ylab="빈도 수", ylim=c(0, 5000))

# 문제 2. 거래량에 대한 빈도수를 박스플롯으로 출력
boxplot(data$cds)

# 문제 3. 거래량에 대한 빈도수를 막대그래프로 출력
barplot(data$cds)
