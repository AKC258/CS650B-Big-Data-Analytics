# Load required libraries
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library(ggplot2)
}

# Read the CSV file using the full path
data <- read.csv("LondonBikeJourneyAug2023.csv")

# Display the data
print(data)

# Display column names to check what they are
cat("Column names in the dataset:\n")
print(names(data))

# Number of rows
cat("Number of rows: ", nrow(data), "\n")

# Number of columns
cat("Number of columns: ", ncol(data), "\n")

# First 6 rows
cat("First 6 rows:\n")
print(head(data))

# Last 6 rows
cat("Last 6 rows:\n")
print(tail(data))

# Structure of the data
cat("Structure of the data:\n")
str(data)

# Summary of the data
cat("Summary of the data:\n")
print(summary(data))

# Check for and handle missing values
numberOfNA <- sum(is.na(data))
if (numberOfNA > 0) {
  cat('Number of missing values found: ', numberOfNA, '\n')
  cat('Removing missing values...\n')
  data <- na.omit(data)
  cat('Data after removing missing values:\n')
  print(data)
}

# Assuming you identified the correct column names for 'x' and 'y'
# Replace 'Start.station.number' and 'End.station.number' with the actual column names
x_column <- "Start.station.number" # replace with actual column name
y_column <- "End.station.number" # replace with actual column name

# Convert y_column to a factor if it's not already binary
data[[y_column]] <- as.factor(data[[y_column]])

# Verify if the columns exist
if (!all(c(x_column, y_column) %in% names(data))) {
  stop(paste("Columns", x_column, "and", y_column, "must exist in the data."))
}

# Check if data is not empty after removing NAs
if (nrow(data) == 0) {
  stop("No data available after removing missing values.")
}

# Define the structure of the plotting area
par(mfrow = c(1, 2))

# Boxplot for X
boxplot(data[[x_column]], main = 'X', sub = paste('Outliers: ', paste(boxplot.stats(data[[x_column]])$out, collapse = ", ")))

# Boxplot for Y
boxplot(data[[y_column]], main = 'Y', sub = paste('Outliers: ', paste(boxplot.stats(data[[y_column]])$out, collapse = ", ")))

# Summary of X and Y
cat("Summary of X and Y:\n")
summary(data[c(x_column, y_column)])

# Logistic regression model
regressor <- glm(as.formula(paste(y_column, "~", x_column)), data = data, family = binomial)

# Summary of the logistic regression model
cat("Summary of the logistic regression model:\n")
print(summary(regressor))

# Predict probabilities
data$predicted_prob <- predict(regressor, type = "response")

# Plotting using ggplot2 with tidy evaluation
# Plotting using ggplot2 with tidy evaluation
ggplot(data, aes(x = .data[[x_column]], y = as.numeric(.data[[y_column]]) - 1)) +  # Convert factor to numeric for plotting
  geom_point(aes(color = .data[[y_column]]), size = 2) +
  geom_smooth(method = "glm", method.args = list(family = binomial), formula = y ~ x, se = FALSE, color = 'blue') +
  ggtitle(paste(x_column, 'vs', y_column, '(Logistic Regression)')) +
  xlab(x_column) +
  ylab(y_column) +
  theme_minimal()

