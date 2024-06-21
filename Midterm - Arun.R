# Install and load the required packages if not already installed
if (!require("readr")) {
  install.packages("readr")
  library(readr)
}

if (!require("ggplot2")) {
  install.packages("ggplot2")
  library(ggplot2)
}

if (!require("dplyr")) {
  install.packages("dplyr")
  library(dplyr)
}
# Set the correct path to your CSV file
file_path <- "C:/Users/chipp/Downloads/insurance.csv"  # Use forward slashes or double backslashes
# Alternatively: file_path <- "C:\\Users\\chipp\\Downloads\\insurance.csv"
# Read the dataset using readr
insurance_data <- read_csv(file_path)

# Display the first few rows of the dataset
head(insurance_data)

# Display the structure of the dataset
str(insurance_data)

# Summary of the dataset
summary(insurance_data)

# Linear Regression: Predicting charges based on other variables
linear_model <- lm(charges ~ age + bmi + children + smoker + region, data = insurance_data)

# Summary of the linear regression model
summary(linear_model)

# Add predicted values to the dataset
insurance_data$predicted_charges <- predict(linear_model, insurance_data)

# Plot actual vs predicted charges
ggplot(insurance_data, aes(x = charges, y = predicted_charges)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', se = FALSE, color = 'red') +
  ggtitle("Actual vs Predicted Insurance Charges (Linear Regression)") +
  xlab("Actual Charges") +
  ylab("Predicted Charges") +
  theme_minimal()
# Polynomial Regression: Adding a polynomial term for age
insurance_data <- insurance_data %>%
  mutate(age_sq = age^2)

# Perform polynomial regression
polynomial_model <- lm(charges ~ age + age_sq + bmi + children + smoker + region, data = insurance_data)

# Summary of the polynomial regression model
summary(polynomial_model)

# Add predicted values to the dataset
insurance_data$predicted_charges_poly <- predict(polynomial_model, insurance_data)

# Plot actual vs predicted charges for polynomial regression
ggplot(insurance_data, aes(x = charges, y = predicted_charges_poly)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', se = FALSE, color = 'red') +
  ggtitle("Actual vs Predicted Insurance Charges (Polynomial Regression)") +
  xlab("Actual Charges") +
  ylab("Predicted Charges") +
  theme_minimal()
# Logistic Regression: Creating a binary target variable (charges > median)
insurance_data <- insurance_data %>%
  mutate(expensive = ifelse(charges > median(charges), 1, 0))

# Perform logistic regression
logistic_model <- glm(expensive ~ age + bmi + children + smoker + region, 
                      data = insurance_data, family = binomial)

# Summary of the logistic regression model
summary(logistic_model)

# Add the predicted probabilities to the dataset
insurance_data$predicted_prob <- predict(logistic_model, insurance_data, type = "response")

# Plot the predicted probabilities
ggplot(insurance_data, aes(x = predicted_prob, fill = as.factor(expensive))) +
  geom_histogram(binwidth = 0.05, alpha = 0.6, position = 'identity') +
  ggtitle("Predicted Probabilities for Expensive Insurance Charges (Logistic Regression)") +
  xlab("Predicted Probability") +
  ylab("Count") +
  theme_minimal() +
  scale_fill_discrete(name = "Expensive", labels = c("No", "Yes"))
