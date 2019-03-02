Gain <- function(X,feature,targetId) {
  # Information Gain Algorithm: Calculates the expected reduction in entropy when choosing one feature
  # 
  # Args:
  #  X: data frame or Matrix
  #  feature: feature selected 
  #  targetId: response/outcome/target/class feature column number
  
  # Returns:
  #  the information gain when splitting X by using feature
  if ( is.character(X[, feature]) | is.factor(X[, feature]) ) {
    u.x <- unique(X[, feature])
    n<-nrow(X)
    r<-c()
    for (i in u.x) {
      Xi<-X[X[, feature] == i,]
      entF<-Entropy(Xi, targetId)
      nXi<-nrow(Xi)
      a<-nXi/n * entF
      r<-c(r,a)
    }
    entP<-Entropy(X, targetId)
    sumF<-sum(r)
    return(entP-sumF)
  }
}