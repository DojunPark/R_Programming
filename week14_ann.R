#step1
install.packages('neuralnet')
install.packages('MASS')
library(neuralnet)
library(MASS)
head(Boston)

#step2
data <- Boston[, c(1, 2, 4, 5, 9, 14)]  # 6개의 feature 선택 (독립변수 5개, 종속변수 1개)
head(data)

# step3
na <- apply(data, 2, is.na)  # 열 기준으로(2) is.na함수를 적용
head(na)
apply(na, 2, sum)   # 열별 결측치 누적 갯수 확인

# step4
maxs <- apply(data, 2, max)   # 각 열의 최대값을 구함
mins <- apply(data, 2, min)  # 각 열의 최소값을 구함
data.scaled <- scale(data, center=mins, scale=maxs-mins)  # 데이터에서 mins 만큼 빼고, maxs-mins 만큼 나눔

# step5
n <- nrow(data.scaled)
set.seed(1234)
index <- sample(1:n, round(0.8*n)) 
train <- as.data.frame(data.scaled[index,])
test <- as.data.frame(data.scaled[-index,])

#step6
names.col <- colnames(train)
var.dependent <- names.col[6]
var.independent <- names.col[-6]
f.var.independent <- paste(var.independent, collapse=" + ")  # 입력 변수를 +로 연결
f <- paste(var.dependent, '~', f.var.independent)

#step7
model <- neuralnet(f, data=train, hidden=c(3,2), linear.output = T)
plot(model)

#step8
predicted <- compute(model, test[, var.independent])
predicted.real <- predicted$net.result * (maxs[6] - mins[6]) + mins[6]  # 원래 스케일로 복원
test.real <- test$medv * (maxs[6] - mins[6]) + mins[6]

#step9
plot(test.real, predicted.real,
    xlim=c(0, 50), ylim=c(0, 50),
    main='실제 값 대비 예측 값 분포',
    xlab='실제 값', ylab='예측 값',
    col='red', pch=18, cex=0.7)
abline(0, 1, col='blue', lty=2)

MAPE.nn <- sum(abs(test.real-predicted.real)/test.real*100)/nrow(as.data.frame(test.real))
print(MAPE.nn)


