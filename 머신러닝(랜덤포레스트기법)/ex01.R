# 60~80%를 훈련용 데이터 셋으로 가져갑니다.
# 20~40%를 테스트 용도로 가져갑니다.

# 머신러닝이란 Data Science영역에 속하는 인공지능의 한 분야로서
# 컴퓨터 프로그램이 어떤 것에 대한 학습을 통해 기존의 모델이나
# 결과물을 계산하거나 예측(predict) 하게끔 구축하는 과정을 말한다.
# 그 머신러닝 기법중 랜덤포레스트에 대해 기초를 공부해 볼 것이다.
# 랜덤포레스트를 임의의 숲이라는 뜻으로 데이터 분류목적의 머신러닝에도 사용되고 수치 예측에도 사용된다.
# 즉 랜덤포레스트는 앙상블 기법 중 하나로써 의사결정트리 분석의 예측 정확도를 높이기 위해,
# 하나의 의사결정트리를 사용하는 대신에 다수의 의사결정트리 집합을 사용하여 결과를 예측하게 된다.
# 따라서 일반화와 예측의 성능이 좋은 것으로 알려져 있다.
install.packages("randomForest")
install.packages("tree")
install.packages("ggplot2")
install.packages("GGally")

library(randomForest)
library(tree)
library(ggplot2)
library(GGally)

# 여기서는 내장 데이터 셋인 iris를 이용해 랜덤포레스트 기법을 알아보도록 한다.
# iris는 5개의 속성을 지니고 있다. 구글에서 petal sepal로 검색하면 상세 내용을 볼 수 있다.
# iris는 백합의 붓꽃의 한 속을 의미하며, sepal은 큰 잎사귀이고 petal은 상대적으로 작은 잎사귀이다.
head(iris)
dim(iris)
View(iris)
# 랜덤포레스트는 결정트리(decision_tree)에서 출발한 개념인데 결정트리란 한마디로 어떤 주어진 환경을 보고
# 의사결정을 하는 개념이다.
# 예를 들면, "일기예보에서 내일 날씨가 추울거라고 해서, 패딩을 입고 가야지, 혹은 실내근무를 하니까 조금 얇게 입어야겠다" 와 같은 결정이라고 생각하면 된다.
# 따라서 iris 데이터 셋을 보면 sepal.length, sepal.width, petal.length, petal.width를 날씨라고 보고
# species를 뭘 입고 갈것인가로 생각하면 편하다.

# 결정 트리(decision tree)
# tree()의 매개값은 species부터 속성을 다 쓰겠다는 것이다.
decision_tree <- tree(Species ~ . , data = iris)
summary(decision_tree)
plot(decision_tree)      # 결정 트리 구조를 그림
text(decision_tree)      # text를 붙임

# 위에서 나오는 tree를 보면 petal.length 등 4개의 속성변수를 이용해서 Species(종)을 분류하는 것이다.
# 구글에서 random forest를 찾아보면 위에서 본 그림과 비슷하게 여러개의 트리들을 볼 수 있다.
# 그래서 임의의 숲이라고 불린다.
# 여러개의 트리를 만들어서 평균을 내고, 가장 최적의 모델을 선정하는 방식이라고 보면 된다.

# ggpairs()는 속성간의 관계도를 도식화 시킨 그래프를 보여준다.
# 앞서 트리에서 봤듯이 petal.length와 petal.width속성이 species에 영향을 많이 주는 것을 볼 수 있다.
ggpairs(iris[, 1:5])

# 훈련 데이터 세트와 테스트 데이터 셋을 만들자
# 왜 이렇게 만드는가? 머신러닝은 무엇을 보여주던가, 입력하던가 해서 계속 기계가 학습하도록 해야한다.
# 따라서 훈련 데이터 셋과 테스트 데이터 셋을 나눠서 만든다. 보통 60~80% 정도를 훈련용으로 만들고
# 20~40%를 테스트 평가용 셋으로 만든다.
# sample()은 iris에서 2개로 나누고, prob은 비율을 의미한다.

index_row <- sample(2, nrow(iris), replace = T, prob = c(0.7, 0.3))
# 확인해보면 1로 된게 훈련용이고 70%, 2는 테스트용이다.

index_row
train_data <- iris[index_row == 1,] # 훈련용 데이터 셋
train_data
dim(train_data)
test_data <- iris[index_row == 2,] # 테스트용 데이터 셋
test_data
dim(test_data)

# 랜덤 포레스트 기법으로 머신러닝을 하도록 한다.
# 물론 이것은 할때마다 조금씩 달라지는 것을 볼 수가 있다.
# 여기서 우리는 최적의 모델을 선정해 볼 수 있을 것이다.
# randomforest()는 함수로 이미 만들어진 것이고, 모든 속성을 사용하겠다는 것이며,
# importance는 어떤 속성이 영향을 많이 끼쳤는지 알아보는 인자이다.
iris_classifier <- randomForest(Species ~ ., data = train_data, importance = TRUE)
iris_classifier
# 결국 iris_classifier가 모델이 되는 것이다.

# 랜덤 포레스트를 해서 돌려보면 confusion matrix가 나오는데,
# 이것은 실제 데이터에서 보여준 것과 랜덤포레스트를 돌려 예측한 부분에 대한 차이를 보여주는 것이다.
# 오류를 보는 것이다.

# 이것을 그래프로 한번 보도록 하자.
# 그래프를 보면 예측한 내용을 한 눈에 볼 수 있다. 에러율도 같이 말이다.
# 그런데 훈련용 데이터 셋이 150개 중에 70%니까 적은 편이다. 그래서 데이터가 많으면 많을 수록
# 그 신빙성ㅇ 높아진다는 것이다.
# 이것이 바로 머신러닝의 정확한 개념이라고 보면 된다.
plot(iris_classifier)

# importance는 결정 트리를 만들떄 어떤 속성이 많은 영향을 끼쳤는지를 보는 것이다.
# 역시 각 종들의 종류에서 보면 petal.length와 petal.width가 영향을 많이 준 것으로 보인다.
importance(iris_classifier)

# varImpPlot()역시 영향을 끼친 속성들의 중요도를 그래프로 도식화 하는 함수이다. 결과는 마찬가지
varImpPlot(iris_classifier)

# 이제는 테스트 셋을 가지고 예측을 해보는데 Species를 알려주지 않고 단순 4개의 속성을 가지고 
# Species를 맞추는 것을 보는 것이다.
# 먼저 실제로 있는 값을 한번 출력해보자
test_data$Species
# 정답이 정해져 있다.

# 이제 예측을 해보도록 하자. iris_classifier 모델로 말이다.
# 테스트 데이터 셋에서 -5를 하는 것이 바로 Species를 알려주지 않는 것이다.
# iris_classifier모델을 주고 테스트 데이터 셋을 인자값으로 준 다음, predict()를 이용해 예측하는 것이다.
predicted_table <- predict(iris_classifier, test_data[,-5])
predicted_table

# 이제 실제 test_data의 값과 예측한 값 predicted를 가지고 비교를 해보자.
compare_species <- table(observed=test_data[,5], predicted=predicted_table)
compare_species
# 확인해보면 거의 다 맞추었다.

# 아래 qplot은 Species에 영향을 주는 것을 가지고 산점도를 알아보는 것이다.
# 예를 들면 Petal.Width, Petal.Length가 0.5, 2이하 라면 Species는 setosa일 것으로 모델은 예측 할 것이다.
# 또한, 상당히 데이터 분류가 잘 이루어져 있는 것을 볼 수 가 있다.
qplot(Petal.Width, Petal.Length, data = iris, colour = Species)

# 하지만 Sepal.Width, Sepal.Length의 산점도를 보면 중구난방으로 되어있다.
# 즉 데이터 분류가 정확히 이루어지지 않아 예측할때 크게 영향을 주지 않는 것으로 판단되는 것이다.
qplot(Sepal.Width, Sepal.Length, data = iris, colour = Species)

# 따라서 결론은 위와 같이 모델을 만들고 오류가 적은 모델이 선정이 되면
# 사람이 굳이 무엇이라고 판단을 하지 않아도 데이터를 입력하게 되면 모델이 예측을 해주는 것이다.
# 그러기 위해서는 모델에는 훈련용 데이터 셋 즉 계속 훈련을 시켜줘야 한다는 것이다.