### Principal Component Analysis (PCA)
nrow(USArrests)
ncol(USArrests)
dim(USArrests)
names(USArrests)

USArr.noscale <- prcomp(USArrests, center=TRUE)
USArr.noscale

range(USArrests[,"Murder"])
range(USArrests[,"Assault"])
range(USArrests[,"UrbanPop"])
range(USArrests[,"Rape"])

USArr.scale <- prcomp(USArrests, scale=TRUE)
USArr.scale

A <- matrix(c(1,2,3,4,5,6) , ncol=3, byrow = TRUE)
A
A + c(7,11)
A + c(7,11,3)
A + c(7,11,3,13)

USArr.scale$center
USArr.scale$scale
USArr.scale$x

t(USArr.scale$rotation %*% USArr.scale$x["Alabama",])

q <- t(USArr.scale$rotation %*% USArr.scale$x["Alabama",])
q <- USArr.scale$scale * q
q

q <- q + USArr.scale$center
q
USArrests["Alabama",]

q <- USArr.scale$rotation[,1:2] %*% t( USArr.scale$x[,1:2] )
q <- q * USArr.scale$scale
q <- q + USArr.scale$center
t(q)

q <- USArr.scale$rotation[,1:3] %*% t( USArr.scale$x[,1:3] )
q <- q * USArr.scale$scale
q <- q + USArr.scale$center
t(q)

t(q) - USArrests

((t(q) - USArrests) / USArrests) * 100

