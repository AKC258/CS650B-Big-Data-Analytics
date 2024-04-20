N <-1000
a <-rnorm(N)
b <- rnorm(N)

#Vectorized approach
c <- a * b
c

?norm

rnorm(N,mean=0, sd=3.14)


X <- rnorm(5)
X
X <- rnorm( 5, 10, 1)
X
X <- rnorm (5, 10)
X
X <- rnorm(5, mean=10, sd = 1)
X
X <- rnorm(5, sd=1, mean=10)
X
X <- rnorm(5, sd=1)
X

x <-rnorm(5, sd=1)
plot(x)
hist(x)


x <-rnorm(80000)
plot(x)
hist(x)
head(x)
tail(x)
range(x)
range(Y)
summary(x)
boxplot(x)


