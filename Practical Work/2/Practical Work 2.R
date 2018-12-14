# Load Resources
setwd('/Users/sergiobelda/Desktop/dasresources/')

# Airquality
airquality <- read.csv('airquality.csv', sep = ',', header = TRUE)
# Cars
cars <- read.csv('cars.csv', sep = ',', header = TRUE)
cars <- subset(cars, select =- X)
# Titanic
titanic <- read.csv('titanic.csv', sep = ',', header = TRUE)
titanic <- subset(titanic, select =- X)

# 2 Transformations of variables and datasets.
# 2.1 Construct a new data frame with data speed = 21, 34 dist = 47, 87
matrix(c(21,47,34,87), ncol=2, byrow = TRUE)->carsn
carsn<-as.data.frame(carsn)
colnames(carsn)<-c('speed', 'dist')

#2.2 Add the constructed data frame to the cars data frame
rbind(cars, carsn)

#2.3 Sort the data
# Ascending
cars[order(cars$speed),]
# Descending
cars[order(-cars$speed),]

# 3 Data manipulation.
# 3.1 Extract the first 2 rows of the data frame and print them to the console. 
airquality[1:2,]

# 3.2 How many observations (i.e. rows) are in this data frame?
nrow(airquality)

# 3.3 What is the value of Ozone in the 40th row?
airquality$Ozone[40]

# 3.4 How many missing values are in the Ozone column of this data frame?
nrow(airquality[is.na(airquality$Ozone),])

# 3.5 What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.
airquality[!is.na(airquality$Ozone),]->airqualityWoNA
mean(airqualityWoNA$Ozone)

# 3.6 Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
subset(airquality, airquality$Ozone > 31 & airquality$Temp > 90)->airqualityFormat
mean(airqualityFormat$Solar.R)

# 4 Data transformation.
# Package arules
# 4.1 Discretise the Ozone column into five bins (‘bin1’, ‘bin2’, ...) of equal width and a sixth bin (‘binNA’) for NA.
discretize(airquality$Ozone, method = "interval", breaks = 5, labels = c("bin1", "bin2", "bin3", "bin4", "bin5"))->airquality$Ozone
factor(airquality$Ozone,levels=c("bin1", "bin2", "bin3", "bin4", "bin5", "binNA"))-> airquality$Ozone
airquality$Ozone[is.na(airquality$Ozone)]<-"binNA"

# 4.2 Discretise the Solar column into four bins of equal size and a fifth bin for NA.
discretize(airquality$Solar.R, method = "interval", breaks = 4, labels = c("bin1", "bin2", "bin3", "bin4"))->airquality$Solar.R
factor(airquality$Solar.R,levels=c("bin1", "bin2", "bin3", "bin4", "binNA"))-> airquality$Solar.R
airquality$Solar.R[is.na(airquality$Solar.R)]<-"binNA"

# 4.3 Create a new column AbsDay from the columns Month and Day such that counts the number of days passed from Month=5 and Day=1.
as.Date(with(airquality, paste(airquality$Day, airquality$Month, sep = "-")), "%d-%m")->airqualityDate
difftime(strptime(airqualityDate, "%Y-%m-%d"), strptime("2018-05-01", "%Y-%m-%d"), units = 'day')->absday
airquality$AbsDay = absday

#5 Data transformation.
#5.1 Numerise the class column, where Crew=4, 1st=3, 2nd=2 and 3rd=1
titanic$Class<-factor(titanic$Class, labels = c(3,2,1,4))

#5.2 Transform the titanic data frame into a new data frame (titanic2) with as many examples as passengers using the Freq column
# repeat Freq times each row of data-frame and select this rows
titanic[rep(rownames(titanic), titanic$Freq),1:2]->titanic2

#6 Data selection
# 6.1 Using the data frame ‘air’, perform a simple random sampling of 50 examples
sample(nrow(airquality), 50)
airquality[sample(nrow(airquality), 50), ]

# Package splitstackshape
# 6.2 Using the data frame ‘air’, perform a stratified random sampling of 5 examples of each month
stratified(airquality, group = 'Month', size = 5)