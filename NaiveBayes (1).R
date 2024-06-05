
install.packages("e1071") # install package e1071
library(e1071) # load the library

sample <- read.csv(file.choose()) #sample1.csv
print(sample)

 
# define the data frames for the NB classifier
traindata <- as.data.frame(sample[1:14,])
testdata <- as.data.frame(sample[15,])
traindata
testdata

 
model <- naiveBayes(Enrolls ~ Age+Income+JobSatisfaction+Desire,
                    traindata)

# display model
model

# predict with testdata
results <- predict (model,testdata)
# display results
results

 
