First <- rnorm(50)
Second <- First +  rnorm(50, mean=0, sd=0.4)
data <- as.data.frame(cbind(First,Second))     # making a data frame by binding

# text results
summary(data)

library(ggplot2)
# visualization
ggplot( data, aes(x=First,y=Second)) + geom_point(size=2)

data("anscombe")
anscombe
# generate levels to indicate group number
levels <- gl(4, nrow(anscombe))
mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4), mygroup=levels))
mydata
theme_set(theme_bw())
ggplot(mydata, aes(x,y)) + geom_point(size=4)  + geom_smooth(method="lm", fill=NA, fullrange=TRUE)   + facet_wrap(~mygroup)

x <- c( 1,2,3,NA,5)
x
is.na(x)
mean(x)   # NA
mean(x, na.rm=TRUE)  #2.75

DF <- data.frame( x= c(12,9,23), y=c(10,20,NA))
DF
DF1 <- na.exclude(DF)
DF1
max(DF)  #NA
max(DF, na.rm=TRUE) #23
max(DF1) #20

data(mtcars)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=0.6, main="Miles per Gallons of Car models", xlab="mpg")
barplot(table(mtcars$cyl), main="Dist of Car Cylinder Count", xlab="Number of cylinders")


x <- c( 12, 13, 21, 27, 33, 34, 35, 37, 46, 51, 51, 57)
x
stem(x)
hist(x)

barplot(x)
dotchart(x)

income <- 1000 * rlnorm(4000, meanlog = 4, sdlog = 0.7)
summary(income) 
hist( income, breaks=500, xlab="Income", main = "Histogram of Income")
rug(income)
plot(density(log10(income),adjust=0.5), main="Log10 Scale Distribution")
rug(log10(income))

library("ggplot2")
data(diamonds)
#only keep the premium and ideal cuts of diamonds
nicediamonds <- diamonds [diamonds$cut=="Premium" | diamonds$cut=="Ideal",]
summary(nicediamonds$cut)
ggplot( nicediamonds, aes(x=price, fill=cut)) + geom_density(alpha=0.3,color=NA)
ggplot( nicediamonds, aes(x=log10(price), fill=cut)) + geom_density(alpha=0.3,color=NA)

data("mtcars")
cars <- mtcars[order(mtcars$mpg),]
cars$cyl <- factor(cars$cyl)
cars$color[cars$cyl==4] <- "Red"
cars$color[cars$cyl==6] <- "Blue"
cars$color[cars$cyl==8] <- "Green"
dotchart(cars$mpg, labels=row.names(cars), cex=.7, groups=cars$cyl, main="Miles per Gallon", xlab="Miles oer Gallon", color= cars$color, gcolor="Black")

A<- matrix(1:10, nrow=5)
A
B <- matrix( 21:40, nrow=2)
B
C <- matrix(1:100,  20)
C
D <- matrix(0,4,4)
D
E <- matrix(0,10)
E
F <- matrix(c(4,5,6,2,3,4,12,34,45,10,55,32),4,3)
F

Data <- 1:20
A <-matrix(Data, 4,5)            #snake down
A
B <-matrix(Data,4,5,byrow=TRUE)  #snake right
B

C<-A+B
C

r1 <- c("I", "am","happy")
r2 <- c ("what", "a", "day")
r3 <-1:3

C <- rbind(r1,r2,r3)  #each one becomes a Row
C

D <-cbind(r1,r2,r3)      #each one becomes a column
D

A <- matrix(1:10, nrow=5)
A
nrow(A)
ncol(A)
dim(A)
typeof(A)
B <- t(A)
B

A <- matrix(1:10, nrow=5)
A
A[1,1]
A[,1]
A[1,]
A[-2,]
A[,-2]
A[-2,-2]

#named Vector
Charlie <- 7:11
Charlie
names(Charlie) <- c("a", "b","c","d","e")
Charlie
Charlie[4]
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

temp <- rep(c("a", "b","c"),each=3)
temp
Bravo <- matrix(temp,3,3)
Bravo
rownames(Bravo) <- c("Tom", "Dick", "Harry")
Bravo
colnames(Bravo) <- c("Alice", "Jane", "Mary")
Bravo

Bravo[2,3] <-0
Bravo
Bravo["Tom", "Mary"] <- 0
Bravo

rownames(Bravo)
colnames(Bravo)

x <-c("a","b","c","d","e")
x
x[c(1,4)]          #subset
x[1]                 



