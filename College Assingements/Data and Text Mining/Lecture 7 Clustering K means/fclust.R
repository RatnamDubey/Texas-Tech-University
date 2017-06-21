library(fclust)

s = c(-1,-2,1,3) 
b = c(-2,-1,3,2) 

df = data.frame(s, b)
m <- matrix(c(0.2,0.8,0.2,0.8,0.8,0.2,0.8,0.2),nrow=4,ncol=2)
a = FKM(df,k=2,m=2,stand=m,Rs=2)

plot(a)
plot(a$H)