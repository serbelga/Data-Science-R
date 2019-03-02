setwd("Desktop/dasresources/")

auto<-read.csv("auto.txt", header = FALSE, sep = "")

auto[complete.cases(auto),]->auto

auto[!duplicated(auto$carname),]->auto

auto[, "cyl"] <- as.factor(auto[, "cyl"])
auto[, "myear"] <- as.factor(auto[, "myear"])
auto[, "orig"] <- as.factor(auto[, "orig"])

sample(1:nrow(auto), nrow(auto)*0.75)->trainingv
auto[trainingv,]->trainingauto
auto[-trainingv,]->testauto
nrow(auto) == nrow(testauto) + nrow(trainingauto)

qplot(cyl,hp,data=trainingauto,colour=mpg,main="")+ geom_point()	+ geom_smooth(method="lm")

qplot(hp,wt,data=trainingauto,colour=mpg,main="")+ geom_point()	+ geom_smooth(method="lm")

fit<-""
rpart(mpg ~ wt + hp + acc + disp, data = trainingauto, method = 'anova')->fit
rpart.plot(fit)
plotcp(fit)
prune(fit, cp=0.03)->fitprune
rpart.plot(fitprune)

######################Predict over Test Dataset

lm(mpg ~ wt + hp + acc + disp, data = trainingauto)->fitlm
predict(fitlm, testauto)->testautolm
testauto$mpglm<-testautolm
gof(testauto$mpg, testauto$mpglm)

rpart(mpg ~ wt + hp + acc + disp, data = trainingauto, method = 'anova')->fittree
plotcp(fittree)
prune(fittree, cp=0.03)->fitprune
rpart.plot(fittree)
rpart.plot(fitprune)
predict(fitprune, testauto)->testautotree
testauto$tree<-testautotree
gof(testauto$mpg, testauto$tree)

nnet(mpg ~ wt + hp + acc + disp, data = trainingauto, size = 12, linout = TRUE, skip = TRUE)->fitnn
predict(fitnn, testauto)->testautonn
as.vector(testautonn)->testautonn
testauto$nn<-testautonn
gof(testauto$nn, testauto$mpg)




######################Predict over Training Dataset

lm(mpg ~ wt + hp + acc + disp, data = trainingauto)->fitlm
predict(fitlm, trainingauto)->trainingautolm
trainingauto$mpglm<-trainingautolm
gof(trainingauto$mpg, trainingauto$mpglm)

rpart(mpg ~ wt + hp + acc + disp, data = trainingauto, method = 'anova')->fittree
plotcp(fittree)
prune(fittree, cp=0.018)->fitprune
rpart.plot(fittree)
rpart.plot(fitprune)
predict(fitprune, trainingauto)->trainingautotree
trainingauto$tree<-trainingautotree
gof(trainingauto$mpg, trainingauto$tree)

nnet(mpg ~ wt + hp + acc + disp, data = trainingauto, size = 12, linout = TRUE, skip = TRUE)->fitnn
predict(fitnn, trainingauto)->trainingautonn
as.vector(trainingautonn)->trainingautonn
trainingauto$nn<-trainingautonn
gof(trainingauto$nn, trainingauto$mpg)