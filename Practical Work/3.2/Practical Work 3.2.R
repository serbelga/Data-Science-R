setwd('/Users/sergiobelda/Desktop/dasresources/')
dat<-read.csv('lenses.data.txt', sep=";")

dat<-read.csv('lenses.data.txt', sep = "", header = FALSE)
dat<-subset(dat, select=-V1)
colnames<-c("age of the patient", "spectacle prescription", "astigmatic", "tear production rate", "class")
colnames(dat)<-colnames
dat

factor(dat$`age of the patient`, labels = c("young", "pre-presbyopic", "presbyopic"))->age_of_the_patient
dat$`age of the patient`<-age_of_the_patient

factor(dat$`spectacle prescription`, labels = c("myope", "hypermetrope"))->spectacle_prescription
dat$`spectacle prescription`<-spectacle_prescription

factor(dat$astigmatic, labels = c("no", "yes"))->astigmatic
dat$`astigmatic`<-astigmatic

factor(dat$`tear production rate`, labels = c("reduced", "normal"))->tear_production_rate
dat$`tear production rate`<-tear_production_rate

factor(dat$class, labels = c("hard_lenses", "soft_lenses", "not_lenses"))->class
dat$class<-class

source('Entropy.R')
Entropy(dat, 1)

source('Gain.R')
Gain(dat,4,5)


