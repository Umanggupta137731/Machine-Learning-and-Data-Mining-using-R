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
iris_pred<-ctree(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,data = iris[ind==1,1:5])
predict(iris_pred,iris.test)
xtab=table(predict(iris_pred,iris.test),iris.testlabel)
confusionMatrix(xtab)
