# RMySQL 설치 및 로드
install.packages("RMySQL")
library(RMySQL)

# 디비 연결
mydb <- dbConnect(MySQL(), user = "root", password = "1234", dbname = "sqldb")

class(mydb)

result <- dbGetQuery(mydb, "show tables;")
result

query <- "select * from usertbl;"
class(query)

result_select <- dbGetQuery(mydb, query)

View(result_select)

# 한글이 깨질 때는 아래와 같이 설정한다.
result_select[[2]] <- iconv(as.character(result_select[[2]]), from = 'UTF-8')
result_select[[4]] <- iconv(as.character(result_select[[4]]), from = 'UTF-8')
result_select

# 요약 정보
summary(result_select)

# 데이터 프레임의 데이터 타입 구조보기
str(result_select)

# 각 타입에 맞게 변환
result_select$mdate <- as.Date(result_select$mdate)
result_select$birthyear <- as.Date(result_select$birthyear, origin = "1950-1-1")

summary(result_select)
str(result_select)

# 접속 종료
dbDisconnect(mydb)
