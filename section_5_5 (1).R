#######################################################
# section 5.5 An Example: Transactions in a Grocery Store
#######################################################

install.packages('arules')
install.packages('arulesViz')
library('arules')
library('arulesViz')

##########################################
# section 5.5.1 The Groceries Dataset
##########################################

data(Groceries)
print(Groceries)
summary(Groceries)
class(Groceries)

# Display the first 20 grocery labels
print(Groceries@itemInfo[1:20,])

# Display the 10th to 20th transactions
print(apply(Groceries@data[,10:20], 2, 
            function(r) paste(Groceries@itemInfo[r,"labels"], collapse=", ")
))

##########################################
# section 5.5.2 Frequent Itemset Generation
##########################################

# Frequent 1-itemsets
itemsets <- apriori(Groceries, parameter=list(minlen=1, maxlen=1, support=0.02, target="frequent itemsets"))
summary(itemsets)
inspect(head(sort(itemsets, by = "support"), 10))

# Frequent 2-itemsets
itemsets <- apriori(Groceries, parameter=list(minlen=2, maxlen=2, support=0.02, target="frequent itemsets"))
summary(itemsets)
inspect(head(sort(itemsets, by ="support"),10))

# Frequent 3-itemsets
itemsets <- apriori(Groceries, parameter=list(minlen=3, maxlen=3, support=0.02, target="frequent itemsets"))
inspect(sort(itemsets, by ="support"))

# Frequent 4-itemsets
itemsets <- apriori(Groceries, parameter=list(minlen=4, maxlen=4, support=0.02, target="frequent itemsets"))
inspect(sort(itemsets, by ="support"))

# Run Apriori without setting the maxlen parameter
itemsets <- apriori(Groceries, parameter=list(minlen=1, support=0.02,
                                              target="frequent itemsets"))
inspect(sort(itemsets, by = "support"))

##########################################
# section 5.5.3 Rule Generation and Visualization
##########################################

rules <- apriori(Groceries, parameter=list(support=0.001,
                                           confidence=0.6, target = "rules"))
summary(rules)

# Basic plot of the rules
plot(rules)
plot(rules@quality)

# Displays rules with top lift scores
inspect(head(sort(rules, by="lift"), 10))

# Select confident rules
confidentRules <- rules[quality(rules)$confidence > 0.9]
confidentRules

# Plot confident rules with matrix method and proper reorder method
plot(confidentRules, method="matrix", measure=c("lift", "confidence"),
     control=list(reorder="support/confidence"))

# Select the 5 rules with the highest lift
highLiftRules <- head(sort(rules, by="lift"), 5)

# Plot high lift rules using graph method
plot(highLiftRules, method="graph", control=list(type="items"))
