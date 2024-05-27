all <- read.csv(file.choose()) #open insurance.csv
head(all)
install.packages("plot3D") # This is a cool library to draw 3D plots!
library("plot3D")
scatter3D(all$age, all$bmi, all$charges)
mat <- cbind(all$age, all$bmi, all$charges, col=NULL)
head(mat)
kmeans(mat,centers=3) # divide into 3 groups
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- km
scatter3D(all$age, all$bmi, all$charges, colvar=all$cl)

all <- read.csv(file.choose()) #open insurance.csv
head(all)
qplot(data=all, y=age)
qplot(data=all, y=bmi)
qplot(data=all, y=charges)
mat <- cbind(all$age, all$bmi, all$charges)
head(mat)
kmeans(mat,centers=3) # divide into 3 groups
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
# A bit hard to draw 4 columns
qplot(data=all, y=age, color=cl)
qplot(data=all, y=bmi, color=cl)
qplot(data=all, y=charges, color=cl)
qplot(data=all, x=charges,y=age, color=cl)
qplot(data=all, x=charges,y=bmi, color=cl)
qplot(data=all, x=bmi, y=charges, color=cl)

all <- read.csv(file.choose()) #open insurance.csv
head(all)
qplot(data=all, y=bmi) # All over the place!!
kmeans(all$bmi,centers=3) # divide into 3 groups based on bmi
# lets draw it
km = kmeans(all$bmi,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
qplot(data=all, y=bmi, color=charges)
qplot(data=all, y=bmi, color=cl)
qplot(data=all, y=age) # All over the place!!
kmeans(all$age,centers=3) # divide into 3 groups based on Internet Usage
# lets draw it
km = kmeans(all$age,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
qplot(data=all, y=age, color=charges)
qplot(data=all, y=age, color=cl)

all <- read.csv(file.choose()) #open insurance.csv
head(all)
qplot(data=all, x=age, y=charges) # kind of Obvious!!!
#convert to a matrix as clustering works better on a matrix
mat <- cbind( all$age, all$charges)
head(mat)
kmeans(mat,centers=3) # All that output!!!
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
head(all)
summary(all)
qplot(data=all, x=age,y=charges, color=cl)