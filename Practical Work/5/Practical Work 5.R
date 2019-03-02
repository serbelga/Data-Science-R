setwd('/Users/sergiobelda/Desktop/dasresources/')

read.delim('attribute_names.txt', header = FALSE, sep = ' ')->attributes
columns<-attributes$V2
columns

read.csv('breast-cancer.data.csv', header = FALSE, col.names = columns, sep = ';')->data
typeof(data$Sample_number)
typeof(data$Clump_Thickness)
typeof(data$Cell_Size)
typeof(data$Class)

library(caret)
set.seed(100)
trainIndex <- createDataPartition(data$Sample_number, p = .7, list = FALSE, times = 1)
traindata<-data[trainIndex,]
testdata<-data[-trainIndex,]

##Naive Bayes
library(klaR)
##nnet
library(nnet)
##svmLinear
library(kernlab)
##C50
library(C50)


set.seed(100)
fitControlnb <- trainControl(
                method = "repeatedcv",
                number = 10,
                repeats = 1)

fitnb <- train(Class ~ ., data = traindata, 
                 method = "nb", 
                 trControl = fitControlnb,
                 verbose = FALSE)

set.seed(100)
fitControlc50<- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 1)

fitc50 <- train(Class ~ ., data = traindata, 
               method = "C5.0", 
               trControl = fitControlc50,
               verbose = FALSE)

set.seed(100)
fitControlknn<- trainControl(
  method = "repeatedcv",
  number = 10,
  repeats = 1)

fitknn <- train(Class ~ ., data = traindata, 
                method = "knn", 
                trControl = fitControlknn,
                verbose = FALSE)

