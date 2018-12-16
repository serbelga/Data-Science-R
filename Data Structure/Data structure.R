# List
list <- 1:12

# Vector
v <- c("a", "b")
l <- c(3, 2, 1, 4)

# Maximum
max(l)

# Minimum
min(l)

# Range
range(l)

# Length
length(l)

# Product
prod(l)

# Sum
sum(l)

# Median
median(l)

# Variance
var(l)

# Mean
mean(l)

# Sort
sort(l)

# Sequence
seq (1, 5, 0.5)

# Repetition
rep(c(6,2,4),4)

# Matrix
matrix(1:15, 5, 3, byrow = TRUE)

rep(1:2, each = 2)
rep(c(1, 4), each = 2)
rep(1:4, c(2,1,2,1))
rep(c(9, 2, 5), c(6, 5, 4))


column_names<-c("height", "shoesize", "gender", "population")
data<-read.table("data1-1.txt", sep = " ", header = FALSE, col.names = column_names)