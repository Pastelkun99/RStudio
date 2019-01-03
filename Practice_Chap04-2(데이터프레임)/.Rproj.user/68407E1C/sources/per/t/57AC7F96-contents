# 데이터프레임이란? 다시 말해 표와 같은 형태로 데이터가 존재하는 것이라고 보면 이해가 빠름.

# 혹시 DB를 조금이라도 다루어 보았다면, 테이블과 같다고 보면 된다.

# 표 혹은 테이블은, 열과 행으로 이루어진다.
# 하여, 행이 많아지는 것과 열이 많아지는 것은 데이터 분석적인 측면에서 완전히 달라지는 것이다.
# 데이터의 행이 많아진다는 것은 분석기법은 변하지 않으나, 속도가 느려진다.
# 하지만, 열(column, 속성, 변수)이 많아지는 것은 데이터 분석기법 자체가 달라진다.
# 그래서 데이터 분석에 있어서는 행보다는 열이 더욱더 중요한 부분을 차지한다.

# 변수 2개를 만든다.
english <- c(90, 80, 60, 70)
english

math <- c(50, 60, 100, 20)
math

# 아래 코드 내용은 data.frame()함수를 이용하여 위에 선언한 변수들을 인자값으로 해
# 표와 같이 즉 데이터프레임으로 만들고 있다. 그리고 타 변수와 구분하기 위해 접두어로 df를 준다.
df_midterm <- data.frame(english, math)
df_midterm

# class 변수 생성
class <- c(1, 2, 3, 4)
class

# 다시 df_midterm데이터 프레임 변수에 class변수를 넣어 만들었다. 좀 번거롭다.
df_midterm <- data.frame(class, english, math)
df_midterm

# 여기서 $기호가 나오는데 이 기호는 데이터프레임 안에 있는 열(속성(컬럼))를 지정할 때 사용함.
sum(df_midterm$english)
mean(df_midterm$english)

# 위와 같이 하나하나 변수 만들어서 해도 되지만, 한번에 아래와 같이 할 수도 있다.
df_midterm <- data.frame( english = c(90, 80, 60, 70),
                          math = c(50, 60, 100, 20),
                          class = c(1, 1, 2, 2)
                        )
df_midterm

