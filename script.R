# ----------------------------------

# EXPLICATION 

# This dataset is related to wine.
# It is about a white variants of the Portuguese "Vinho Verde".
# Vinho verde is a unique product from the Minho (northwest) region of Portugal. 
# Medium in alcohol, is it particularly appreciated due to its freshness (specially in the summer).

# The goal is to model wine quality based on physicochemical tests.
# We only have physicochemical and sensory.
# There is no data about grape types, brand, selling price, etc.
# As the class is ordered, you could choose to do a regression instead of a classification.

# The prediction will have to be uploaded in one of your public repository in your github

# 5.30pm is the dead line !

# Every minute late will see your final accuracy decreasing by 0.05
# Example : 20 minutes late = 0.1 x 20 = 2
# If your final accuracy was 86%, it will be decreased to 84%

# But enought talking, let's start !

# ----------------------------------

# Import Libraries
library(rstudioapi)
library(ggplot2)
library(caret)

# Load the data
setwd(dirname(getActiveDocumentContext()$path))
df <- read.csv("data/training.csv", sep = ",", header = TRUE)

# See row and columns numbers
dim(df)

# Look at the classes of the features
str(df)

# Look at the name of the features
names(df)

# Look for missing values
sum(is.na(df))

# Change the dependent variable as factor
df$quality <- as.factor(df$quality)

# Look at the distribution of the dependent variable
ggplot(df, aes(quality)) +
  geom_bar()  +
  labs(title=" Dependent variable distribution",
        x ="Quality of the wine",
        y = "")
  
# Run a dump model
t.control <- trainControl(method = "cv", number = 10)
model <- train(quality ~ ., data = df, methode = "rf", trcontrol = t.control)

model$results # ~ 65% accuracy

# Once you have your predicsion, load the validation and fill the quality feature
validation <- read.csv("data/validation.csv", sep = ",", header = TRUE)

print(validation$quality)

# Good luck