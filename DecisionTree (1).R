 
install.packages("rpart.plot") # install package rpart.plot

 
library("rpart")
library("rpart.plot")

# Read the data
banktrain  <- read.csv(file.choose()) # "bank-sample.csv"
summary(banktrain)
 

# Make a  decision tree by only keeping the categorical variables
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
 

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

#too detailed, let's simplify it by removing branches
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)
 

# include a numeric variable "duration" into the model
fit <- rpart(subscribed ~ job + marital + education + default + housing + loan + contact + duration + poutcome, 
             method="class", 
             data=banktrain,
             control=rpart.control(minsplit=1),
             parms=list(split='information'))
summary(fit)

# Plot the tree
rpart.plot(fit, type=4, extra=2, clip.right.labs=FALSE, varlen=0, faclen=3)

# Predict
newdata <- data.frame(job="retired", 
                      marital="married", 
                      education="secondary",
                      default="no",
                      housing="yes",
                      loan="no",
                      contact = "cellular",
                      duration = 598,
                      poutcome="unknown")
newdata
predict(fit,newdata=newdata,type=c("class"))
 