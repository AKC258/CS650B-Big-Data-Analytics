
#IF condition
x=0
count=0
if( x>= -1 & x <=1){
  count <- count+1
} else{
  count<-count-1
}
count

#For Loop
for (i in 1:5){
  print("Hello R")
}

for (m in 5:10)
  print(m)




for (i in 1:20)
{
  x<-sqrt(i)
  print(x)
}

#Vector Creating
myFirstVector <- c( 2, 5, 7, 1, 4)
myFirstVector
typeof(myFirstVector)


mySecondVector <- c( "I", "am", "Arun")
mySecondVector
typeof(mySecondVector)


myThirdVector <- c( T, F, T)
myThirdVector
typeof(myThirdVector)

X <- c(3,4,5)
Y <- c(X,X,X,X)
Y


V <- 1:10
S <- -5:30
T <- 10:1

Mix <- c( 3:6, 24, 0:4, 31, 9:7)
Mix
V
S
T

A <- seq(1,10)
B <- seq(1,10, by=5)
C <- seq(5, -5, by=-2)
A
B
C


D <- seq(0,100, length=9)
E <- seq(0,1, length=15)
D
E


A <- rep("Hello", 5)
B <- rep(A,2)
C <- rep(1:5,4)
D1 <- rep(c("A","B","C"), 3)
D2 <- rep( c("A","B","C"), each=3)
D3 <- rep( c("A","B","C"), c(2,1,3) )
A
B
C
D1
D2
D3


T <- c(3.8)
typeof(T)


X <- c(3,5,8)
typeof(X)
length(X)


w <- c ("a", "b", "c", "d","e")

w[1]
w[3]
w[-1]                             # all except number 1
w[-3]
w[c(1,3,5)]                    #get specific items
w[c(-2,-4)]                     #same thing
w[c(-3:-5)]                     # remove range 3 to 5
w[1:3]



A <- c(5,-2,51,42,-76,42)
B <- sort(A)
A
B


X <- c( 1, 2, 3)
Y <- c( 4, 5 , 6 )
Z <- X + Y
X
Y
Z


X <- c( 1, 2, 3, 4, 5, 6)
Y <- c( 4, 5 , 6, 7, 8, 9 )
Z <- X + Y
X
Y
Z



X <- c( 34,56,22,11,65,45)
Y <- mean(X)
Z <- min(X)
W <- max(X)
S <- sum(X)
V <- prod(X)
X
Y
Z
W
S
V


W <- c(32,56,44,76,89,24)

for (i in 1:6)
  if (W[i] > 50)
    print(i)

for (i in W)
  if (i <50)
    print(i)


T<-c(45,77,20,19,101,120,212)
for (T in 1:7)

