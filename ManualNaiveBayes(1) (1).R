#Manual Naive Bayes 

 
## Read the data


banktrain <- read.csv(file.choose()) #bank-sample.csv

## drop a few columns to simplify the model
drops<-c("balance", "day", "campaign", "pdays", "previous", "month")
banktrain <- banktrain [,!(names(banktrain) %in% drops)]
summary(banktrain)

 


## manually compute the conditional probabilities

maritalCounts <- table(banktrain[,c("subscribed", "marital")])
maritalCounts 
rowSums(maritalCounts)
maritalCounts <- maritalCounts/rowSums(maritalCounts)
maritalCounts

maritalCounts["yes","divorced"]

jobCounts <- table(banktrain[,c("subscribed", "job")])
jobCounts <- jobCounts/rowSums(jobCounts)
jobCounts

educationCounts <- table(banktrain[,c("subscribed", "education")])
educationCounts <- educationCounts/rowSums(educationCounts)
educationCounts

defaultCounts <- table(banktrain[,c("subscribed", "default")])
defaultCounts <- defaultCounts/rowSums(defaultCounts)
defaultCounts

housingCounts <- table(banktrain[,c("subscribed", "housing")])
housingCounts <- housingCounts/rowSums(housingCounts)
housingCounts

loanCounts <- table(banktrain[,c("subscribed", "loan")])
loanCounts <- loanCounts/rowSums(loanCounts)
loanCounts

contactCounts <- table(banktrain[,c("subscribed", "contact")])
contactCounts <- contactCounts/rowSums(contactCounts)
contactCounts

poutcomeCounts <- table(banktrain[,c("subscribed", "poutcome")])
poutcomeCounts <- poutcomeCounts/rowSums(poutcomeCounts)
poutcomeCounts