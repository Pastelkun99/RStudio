# R에서도 구글 맵을 이용하여 위성사진, 지도, Street View(360도 거리전망), 실시간 교통정보, 최적 경로
# 등의 다양한 내용을 표현할 수 있다. 구글은 2005년 Google Map API를 출시했다.
# R에서는 구글맵 활용을 위해 ggmap, RgoogleMaps, googleVis 등의 패키지를 제공하고 있다.
# 이번 장에서는 ggmap패키지를 활용하는 방법을 알아본다.

# ggmap 패키지 : 구글 맵 또는 Stamen 맵을 정적으로 보여주는 기능들의 집합체
# ggplot2 : 그래픽 출력을 위한 기능을 제공함. 데이터프레임의 다수 데이터에 대한 풍부한 그래픽 시각화가 가능

# geocode()
# 패키지 : ggmap
# 사용법 : gecode(location, ...)
# 설명 : 지역에 대한 위도와 경도 좌표를 제공
# 반환값 : 위도와 경도

# 매개변수
# location : 지역명 또는 주소에 대한 벡터

# get_googlemap()
# 패키지 : ggmap
# 사용법 : get_googlemap(center, zoom, size, maptype...)
# 설명 : 구글맵 출력을 위한 정보 생성
# 반환 값 : 구글맵 전체

# 매개변수
# center : 지도의 중심좌표
# zoom : 지도크기로써 3(대륙) ~ 21(빌딩)의 정수, 디폴트 크기는 10(도시)
# size : 지도의 가로와 세로 픽셀 크기, 최대 크기와 디폴트는 640*640 (c(640, 640))
# maptype : 출력되는 지도 유형, "terrain"(지형정도기반지도), "satellite"(위성지도), "roadmap"(도로명표시),
# "hybrid"(위성과 도로명)

# ggmap()
# 패키지 : ggmap
# 사용법 : ggmap(ggmap, extent="panel", ...)
# 설명 : 지도추력
# 반환값 : ggplot 객체

# 매개변수
# ggmap : 구글맵객체(get_googlemap()에 의해 생성된 객체)
# extent : 출력창에서 지도가 차지하는 영역의 형태, 'normal', 'device', 'panel' 의 세가지 형태로 설정가능
# 'panel' 타입이 디폴트이며, 'device'는 지도를 출력 창에 여백없이 출력함
install.packages("ggmap")
library(ggmap)
library(dplyr)
library(ggplot2)
# 한글지역명 (시단위) 를 utf-8형식으로 변환해서 위도(latitude)와 경도(longitude) 반환한다.
# 하지만 지금 시점에서는 구글에서는 API키를 요청하기 때문에 아래 코드가 먹히지 않는다.
# 'ggmap' 으로, 위도, 경도를 요청하는 쿼리는 개수 제한이 있다. (free 계정은 2500개, API키를 입력할 경우 그 이상)
# 책에도 그렇게 되어있지만 안된다.
gc <- geocode(enc2utf8('서울'))
View(gc)
gc <- geocode('seoul')

# 따라서 아래와 같이 대체적인 방법으로 위도와 경도를 알아낸다.
# 단, 영어로만 가능하다.
gc <- geocode(location = "Seoul", source = "dsk")
class(gc)

# 위도와 경도를 숫자형식으로 변환
cen <- as.numeric(gc)
cen # 위도, 경도

# 위도와 경도를 중심으로 하는 지도 정보 반환
map <- get_googlemap(center = cen, scale = 1, maptype = "roadmap", zoom = 12, markers = gc)
class(map)

# 지도 출력
ggmap(map)

# 지도 확장
ggmap(map, extent = "device")

# 임의 주소(부산) 중심의 지도 출력해보기
gc1 <- geocode(location = "Busan", source = "dsk")
cen1 <- as.numeric(gc1)
cen1

# maptype을 도로명 표시로 함, markers로 위도와 경도가 표시하는 지점 나타내기, zoom을 통해서 확대한 기본이 10이다.
map1 <- get_googlemap(center=cen1, scale = 1, maptype = "roadmap", zoom = 10, marker = gc1)
ggmap(map1, extent = "device")

map1 <- get_googlemap(center=cen1, scale = 1, maptype = "hybrid", zoom = 10, marker = gc1)
ggmap(map1, extent = "device")

map1 <- get_googlemap(center=cen1, scale = 1, maptype = "terrain", zoom = 10, marker = gc1)
ggmap(map1, extent = "device")