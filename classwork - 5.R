# read a csv file
# method 1 : select manually
stats <- read.csv(file.choose())
stats
nrow(stats) # number of rows
ncol(stats) # number of columns
head(stats) # first 6 rows
tail(stats) # last 6 rows
str(stats) #structure, Factor W/4 means 4 different values 1,2,3,4
# you can factorize a column by using factor()
summary(stats)
#---------using the $ sign in a data frame
stats[3,3] # row 3 col 3
stats[3,3, drop=F] # row 3 col 3, remember this from last week?
stats[3, "Birth.rate"] #rows do not have names in a data frame
stats$Internet.users # extract a column vector
stats[, "Internet.users"] # same thing, but not as elegant
stats$Internet.users[3] # Angola
levels(stats$Income.Group)
summary(stats$Birth.rate)
stats[1:10,]
stats[2:7,]
stats[c(4,16,100),]
stats$Birth.rate * stats$Internet.users  # meaningless, just testing math
stats$Birth.rate + stats$Internet.users  # meaningless, just testing math
# Add a column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
stats
stats$xyz <- 1:5            # add another column 
stats
# remove a column
stats$xyz <-NULL
stats$MyCalc <- NULL
stats
# -----------------------------filtering data frames
# Slow way of doing it
filter <- stats$Internet.users < 2    # which one less than 2 percent
stats[filter,]                          
#Better way of filtering
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]      # one step
stats[stats$Income.Group == "High income", ]
stats[stats$Country.Name == "Egypt", ]
?qplot
# One variable
qplot(stats$Birth.rate) #ok but not prefered
qplot(data=stats,x=Internet.users)  #better method, you get a histogram
qplot(data=stats,x=Internet.users, bins=10)  #better method
# Two variables
qplot(data=stats, x = Income.Group, y= Birth.rate)
qplot(data=stats, x = Income.Group, y= Internet.users)
# Test the different sizes
qplot(data=stats, x = Income.Group, y= Birth.rate, size=I(10)) #default size is 1
# Test the different Colors
qplot(data=stats, x = Income.Group, y= Birth.rate, size=I(6), color=I("blue")) 
# Test the different charts qplot can draw
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="boxplot")  
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="path") 
#qplot(data=stats, x = Income.Group, y= Birth.rate, geom="dotplot")  
qplot(data=stats, x = Income.Group, y= Birth.rate, geom="point") # default

qplot(data=stats, x = Internet.users, y= Birth.rate, geom="boxplot")  
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="path")  
#qplot(data=stats, x = Internet.users, y= Birth.rate, geom="dotplot")  
qplot(data=stats, x = Internet.users, y= Birth.rate, geom="point") # default

stats <- read.csv(file.choose())
stats
cont <-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
cont
head(cont)
colnames(cont) <- c("Country", "Code", "Region")
head(cont)
# another way to do it, one step
rm(cont)
cont <-data.frame(Country= Countries_2012_Dataset,Code= Codes_2012_Dataset,Region=Regions_2012_Dataset)
Head(cont)

tot <- cbind(stats, cont) # assuming same ordering
head(tot)

#better merging, more clever

merged <- merge(stats, cont, by.x= "Country.Code", by.y="Code")
head(merged)
merged$Country <- NULL
head(merged)

qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region)

#shapes  0-25
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(17))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, size = I(4), shape=I(2))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,  size = I(4), shape=I(15))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,  size = I(4), shape=I(23))
# Transparency  0---1
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region, 
      size = I(4), shape=I(19), alpha=I(0.7))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.3))
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.5))

# All four variables
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=Income.Group, alpha=I(0.5))

# Add a title
qplot(data= merged, x= Internet.users, y=Birth.rate, color=Region,
      size = I(4), shape=I(19), alpha=I(0.7),
      main="Birth rate vs Internet Users")
