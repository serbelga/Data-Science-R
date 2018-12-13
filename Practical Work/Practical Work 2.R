# Load Resources
setwd('/Users/sergiobelda/Desktop/dasresources/')
airquality <- read.csv('airquality.csv', sep = ',', header = TRUE)



# 3
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

# 4.1 Discretise the Ozone column into five bins (‘bin1’, ‘bin2’, ...) of equal width and a sixth bin (‘binNA’) for NA.
discretize(airquality$Ozone, method = "interval", breaks = 5, labels = c("bin1", "bin2", "bin3", "bin4", "bin5"))->airquality$Ozone
factor(airquality$Ozone,levels=c("bin1", "bin2", "bin3", "bin4", "bin5", "binNA"))-> airquality$Ozone
airquality$Ozone[is.na(airquality$Ozone)]<-"binNA"

# 4.2 Discretise the Solar column into four bins of equal size and a fifth bin for NA.


# 4.3 Create a new column AbsDay from the columns Month and Day such that counts the number of days passed from Month=5 and Day=1.
as.Date(with(airquality, paste(airquality$Day, airquality$Month, sep = "-")), "%d-%m")->airqualityDate
difftime(strptime(airqualityDate, "%Y-%m-%d"), strptime("2018-05-01", "%Y-%m-%d"), units = 'day')->absday
airquality$AbsDay = absday
