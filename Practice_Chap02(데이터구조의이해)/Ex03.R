# 행렬(matrix)은 행과 열로 구성되어 있는 2차원 배열을 ㅡ이미한다.
# 행렬을 만들기 위해서 사용하는 함수가 matrix()이다.

# matrix()
# 패키지 : base
# 사용법 : matrix(data, nrow, ncol | byrow, [dimnames])
# 설명 : 행렬 생성
# 반환 값 : 행렬

# 매개 변수
# data : 벡터 자료
# nrow : 행 요소의 개수
# ncol : 열 요소의 개수
# byrow : data를 행 단위로 배치할지에 대한 여부, 디폴트는 FALSE이며, 열 단위로 배치
# dimnames : 행과 열의 이름 list

# 행렬 만들기
# 1~6사이의 정수를 행의 수가 2인 행렬로 만듦(원소 값의 할당 순서는 열기준)
x <- matrix(seq(1:6), nrow = 2)
x

# byrow를 TRUE로 주면서 값의 할당 순서는 행 기준
x <- matrix(seq(1:6), nrow = 2, byrow = TRUE)
x

x[1, 3] # 1행 3열 값 출력

# 행과 열에 이름 설정( 행과 열이름을 갖는 두 벡터로 리스트 생성)
names <- list(c("1행", "2행"), c("1열", "2열", "3열"))
# names를 입력할 행과 열의 개수가 안맞으면 에러.

x <- matrix(seq(1:6), nrow = 2, byrow = TRUE, dimnames = names)
x

# 벡터 결합에 의한 행렬 만들기
v1 <- c(1, 2, 3, 4)
v2 <- c(5, 6, 7, 8)
v3 <- c(9, 10, 11, 12)
x <- cbind(v1, v2, v3) # cbind()는 column bind의 약자로 열 단위로 합치겠다는 뜻
x
class(x)

# 행과 열에 이름 주기
rownames(x) <- c("1행", "2행", "3행", "4행")
x
colnames(x) <- c("1열", "2열", "3열")
x

# rbind는 row bind의 약자 행 단위로 합침
x <- rbind(v1, v2, v3)
x
rownames(x) <- c("1행", "2행", "3행")
x
colnames(x) <- c("1열", "2열", "3열", "4열")
x

