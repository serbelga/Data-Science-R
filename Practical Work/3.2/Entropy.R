Entropy <- function(X,targetId) {
  # Entropy Algorithm: Calculates the entropy
  # 
  # Args:
  #  X: data frame or Matrix
  #  targetId: response/outcome/target/class feature column number
  
  # Returns:
  #  the entropy  of X
  if ( is.character(X[, targetId]) | is.factor(X[, targetId]) ) {
    u.x <- unique(X[, targetId])
    n<-nrow(X)
    r<-c()
    for (i in u.x) {
      Xi<- X[X[, targetId] == i,]
      nXi<-nrow(Xi)
      pi<-nXi/n
      ent<-(-pi*log2(pi))
      r<-c(r,ent)
    }
    return(sum(r))
  }
}