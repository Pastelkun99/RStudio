# 추가 설명
# 연속변수, 범주변수
# 연속변수(성적, 값 등)
a <- c(10, 20, 30, 10, 20, 30, 10, 10, 10)
b <- factor(c(10, 20, 30, 10, 20, 30, 10, 10, 10))
a
b


# 외부데이터를 불러오는 법을 습득해보자.
# 해당 프로젝트폴더의 git에 가서 excel_exam.xlsx 파일을 다운로드하여 저장한다.

# 아래와 같이 excel파일을 r로 가져오기 위해 패키지 readxl을 install한다.
# 그리고 r로 로딩(library()) 한다.

install.packages("readxl")
library(readxl)

# readxl패키지에 있는 read_excel()함수를 이용해서 excel파일을 불러올 수 있다.
# df_exam데이터프레임 변수에 excel_exam.xlsx파일의 내용을 데이터프레임 형식으로 저장한다.
df_exam <- read_excel("excel_exam.xlsx")
# 같은 프로젝트 폴더에 있다면 "파일명"
# 다른 폴더에 있다면 절대경로를 적어주면 된다. 단 양 옆에 "" 를 붙여야 함.
df_exam
View(df_exam)   # 새창에서 데이터프레임 불러옴
head(df_exam)   # 앞에서부터 몇개 불러옴
tail(df_exam)   # 끝에서부터 몇개 불러옴



mean(df_exam$english)     # 영어 점수 평균
mean(df_exam$science)     # 과학 점수 평균

# 통상 read_excel()함수는 첫번째 행을 컬럼명(속성)으로 인식하여 불러온다.
# 하지만, 컬럼명 없이 데이터가 바로 첫 행부터 존재한다면 첫 번째 행은 컬럼명으로 지정되어
# 1행의 데이터 누실이 발생한다. 이때, col_names라는 read_excel()함수의 인자값을 설정하면
# 문제점을 해결할 수 있다.
# 아래와 같이 읽어들이니 첫번째 행이 컬럼값으로 나온다.
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
View(df_exam_novar)

# col_names라는 read_excel()함수의 인자값을 설정하였다.
# 여기서 false는 거짓이라는 논리형 벡터 변수이다.
# 프로그래밍 언어에서 배운 boolean타입과 같다고 보면 된다. 단 대문자로 써야함.
# 덧붙여, F라고 써도 무방하다.
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = FALSE)
View(df_exam_novar)

# 데이터 프레임의 행과 열의 갯수를 return함 
dim(df_exam_novar)

# excel파일에는 여러개의 sheet 가 존재한다. sheet 별로 불러올 수도 있다.
# 이때, sheep라는 인자값을 사용하면 된다.
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

# 범용 데이터 파일로 많이 쓰이는 확장자가 csv(comma-separated values)인 파일을 보았을 것이다.
# csv파일을 읽어오기 위해서는 read.csv()함수를 이용하면 된다.
df_csv_exam <- read.csv("csv_exam.csv")
View(df_csv_exam)

# 문자가 들어있는 csv파일을 불러올때에는 아래와 같이 stringAsFactors를 설정하자.
df_exam_csv <- read.csv("csv_exam.csv", stringsAsFactors = FALSE)
df_exam_csv

# 이제는 R에서 만든 dataframe을 csv파일로 만드는 것을 알아보자.

# df_midterm변수에 데이터 프레임을 만들고 저장하고 있다.
df_midterm <- data.frame( english = c(90,80,60,70),
                          math = c(10, 55, 33, 70),
                          class = c(1, 1, 2, 2)
                        )
View(df_midterm)

# R의 기본 내장 함수인 write.csv()의 file인자값을 이용하여 코딩하면 파일로 내보내어진다.
write.csv(df_midterm, file = "df_midterm.csv")

# Rdata파일 활용하기
# RData(.rda 또는 .rdatag확장자)는 R 전용 데이터 파일이다. 따라서 다른 파일에 비해 R에서 
# 읽고 쓰는 속도가 빠르며, 용량이 작다는 장점이 있다. R을 사용하는 사용자와 작업시에는
# RData파일을 이용하는 것이 가급적이면 좋고, 혹여 사용하지 않는 사용자와 작업시에는 CSV파일을
# 사용하자.

# 내장함수인 save()를 이용하여 R파일로 해당 프로젝트에 저장한다.
save(df_midterm, file = "df_midterm.rda")

# x <- 15
# rm()내장함수는 변수를 삭제할 수 있다.
rm(df_midterm)
#rm(x)

# 삭제했으니 찾을 수 없다는 에러가 표시된다.
df_midterm

# 이제는 앞서 저장한 R파일을 불러오도록 하자. load()함수를 이용하면 된다.
# 다시 Data탭을 보면 df_midterm 목록에 보인다.
load("df_midterm.rda")
df_midterm

# 기억할 사실은 read.csv()나 read.excel()함수는 파일을 불러와서 또 다른 변수에 할당해야 하는 작업이 
# 생기나, load()함수는 저장할 당시에 데이터프레임 형태로 바로 가져오기 때문에 새로운 변수를 지정할
# 번거로움을 제거해준다는 장점이 있다는 것이다.

