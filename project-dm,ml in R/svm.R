
set.seed(1234)
library(class)
show(iris)
ind<-sample(2,nrow(iris),replace = TRUE,prob = c(0.67,0.33))
iris.training<-iris[ind==1,1:4]
iris.test<-iris[ind==2,1:4]
iris.trainlabel<-iris[ind==1,5]
iris.testlabel<-iris[ind==2,5]
library("e1071",lib.loc = "~/R/win-library/3.3")
library("party",lib.loc = "~/R/win-library/3.3")
library("caret",lib.loc = "~/R/win-library/3.3")
library(neuralnet)
tune <- tune.svm(Species~., 
                 data=iris[ind==1,1:5], 
                 gamma=10^(-6:-1), 
                 cost=10^(1:4))
 iris_pred<-svm(Species~., 
                data=iris[ind==1,1:5], 
                method="C-classification", 
                kernel="radial", 
                probability=T, 
                gamma=0.001, 
                cost=10000)
predict(iris_pred,iris.test)
xtab=table(predict(iris_pred,iris.test),iris.testlabel)
plot(iris_pred)
confusionMatrix(xtab)
