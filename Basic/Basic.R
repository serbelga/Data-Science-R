# Assign
1->a
a<-1
a=1
assign("a", 1)

# Infinite: Inf
# We can operate normally with them

# Undefined: NaN
# Denotes a numeric number that is not a number: 0/0

# Missing: NA
# Denotes a not available value
# It is independent of the data type

# Empty: NULL
# Denotes an empty object, is skipped (i.e., removed) for Vectors

# Conversion
# 0
as.numeric(FALSE)
# 1
as.numeric(TRUE)
as.numeric("1")
as.numeric("A")

# FALSE
as.logical(0)
as.logical("FALSE")
as.logical("F")

# TRUE
as.logical(1)
as.logical("TRUE")
as.logical("T")

# Type (double, character, logical, ...)
typeof(a)

# Mode (numeric, logical, character)
mode(a)

# Length
length(a)

# Sum
s<-1+1

# Substraction
r<-2-1

# Product
p<-1*2

# Division
d<-4/2