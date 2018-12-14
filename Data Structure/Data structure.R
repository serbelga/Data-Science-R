list <- 1:12

v <- c("a", "b")
l <- c(3, 2, 1, 4)

max(l)

min(l)

range(l)

length(l)

prod(l)

sum(l)

median(l)

var(l)

mean(l)

sort(l)

seq (1, 5, 0.5)

rep(c(6,2,4),4)

matrix(1:15, 5, 3, byrow = TRUE)
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
[4,]   10   11   12
[5,]   13   14   15

rep(1:2, each = 2)
[1] 1 1 2 2
rep(c(1, 4), each = 2)
[1] 1 1 4 4
rep(1:4, c(2,1,2,1))
[1] 1 1 2 3 3 4
rep(c(9, 2, 5), c(6, 5, 4))
[1] 9 9 9 9 9 9 2 2 2 2 2 5 5 5 5


column_names<-c("height", "shoesize", "gender", "population")
data<-read.table("data1-1.txt", sep = " ", header = FALSE, col.names = column_names)