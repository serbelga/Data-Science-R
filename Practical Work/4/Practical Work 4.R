setwd("Desktop/dasresources/")

auto<-read.csv("auto.txt", header = FALSE, sep = "")

auto[complete.cases(auto),]->auto



sample(1:nrow(auto), nrow(auto)*0.75)->trainingv
auto[trainingv,]->trainingauto
auto[-trainingv,]->testauto
nrow(auto) == nrow(testauto) + nrow(trainingauto)

qplot(cyl,hp,data=trainingauto,colour=mpg,main="")+ geom_point()	+ geom_smooth(method="lm")

qplot(hp,wt,data=trainingauto,colour=mpg,main="")+ geom_point()	+ geom_smooth(method="lm")

lm(mpg ~ hp + wt, data = trainingauto)->fitlm
predict(fitlm, trainingauto)->trainingautolm
predict(fitlm, testauto)->testautolm
testauto$mpglm<-testautolm
gof(testauto$mpg, testauto$mpglm)

######################

rpart(mpg ~ wt + hp + acc + disp, data = trainingauto, method = 'anova')->fittree
plotcp(fittree)
prune(fittree, cp=0.018)->fitprune
rpart.plot(fittree)
rpart.plot(fitprune)
predict(fittree, testauto)->testautotree
testauto$tree<-testautotree
gof(testauto$mpg, testauto$tree)

nnet(mpg ~ wt + hp + acc + disp, data = trainingauto, size = 12, linout = TRUE, skip = TRUE)->fitnnet
predict(fitnnet, testauto)->testautonn
as.vector(testautonn)->testautonn
testauto$nn<-testautonn
gof(testauto$nn, testauto$mpg)
