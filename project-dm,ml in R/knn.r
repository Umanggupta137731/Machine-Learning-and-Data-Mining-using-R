set.seed(1234)
library(class)
show(iris)
ind<-sample(2,nrow(iris),replace = TRUE,prob = c(0.67,0.33))
iris.training<-iris[ind==1,1:4]
iris.test<-iris[ind==2,1:4]
iris.trainlabel<-iris[ind==1,5]
iris.testlabel<-iris[ind==2,5]
library("e1071",lib.loc = "~/R/win-library/3.3")
iris_pred<-knn(train = iris.training,test = iris.test,cl=iris.trainlabel,k=3)
xtab=table(iris_pred,iris.testlabel)
library("caret",lib.loc = "~/R/win-library/3.3")
confusionMatrix(xtab)

