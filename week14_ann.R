#step1
install.packages('neuralnet')
install.packages('MASS')
library(neuralnet)
library(MASS)
head(Boston)

#step2
data <- Boston[, c(1, 2, 4, 5, 9, 14)]  # 6���� feature ���� (�������� 5��, ���Ӻ��� 1��)
head(data)

# step3
na <- apply(data, 2, is.na)  # �� ��������(2) is.na�Լ��� ����
head(na)
apply(na, 2, sum)   # ���� ����ġ ���� ���� Ȯ��

# step4
maxs <- apply(data, 2, max)   # �� ���� �ִ밪�� ����
mins <- apply(data, 2, min)  # �� ���� �ּҰ��� ����
data.scaled <- scale(data, center=mins, scale=maxs-mins)  # �����Ϳ��� mins ��ŭ ����, maxs-mins ��ŭ ����

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
f.var.independent <- paste(var.independent, collapse=" + ")  # �Է� ������ +�� ����
f <- paste(var.dependent, '~', f.var.independent)

#step7
model <- neuralnet(f, data=train, hidden=c(3,2), linear.output = T)
plot(model)

#step8
predicted <- compute(model, test[, var.independent])
predicted.real <- predicted$net.result * (maxs[6] - mins[6]) + mins[6]  # ���� �����Ϸ� ����
test.real <- test$medv * (maxs[6] - mins[6]) + mins[6]

#step9
plot(test.real, predicted.real,
    xlim=c(0, 50), ylim=c(0, 50),
    main='���� �� ��� ���� �� ����',
    xlab='���� ��', ylab='���� ��',
    col='red', pch=18, cex=0.7)
abline(0, 1, col='blue', lty=2)

MAPE.nn <- sum(abs(test.real-predicted.real)/test.real*100)/nrow(as.data.frame(test.real))
print(MAPE.nn)

