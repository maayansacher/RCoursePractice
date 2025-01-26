# R course for beginners 
# Week 10
# Assignment by Maayan Sacher, ID 302308283

#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

#### LOAD AND HOUSEKEEPING ----

library(readr)
library(tidyverse)

# retrieve file
df <- read_csv("Titanic.csv")

#gender factor
df = df |> mutate(gender = factor(Sex))
contrasts(df$gender) <- c(1,0) 
#ANOTHER OPTIONS IS DOING THIS df$gender <- factor(df$gender, levels = c("male", "female")) - 0 is male and 1 is female in this case
contrasts(df$gender)

colnames(df)

#class factor
####DIDN'T WORK = CREATING A FACTOR FOR CLASS----
df$class_first_other <- ifelse(df$PClass == "1st", "First", "Other")
df = df |> mutate(class_factor = factor(class_first_other))
contrasts(df$class_factor) <- c(1,0)
contrasts(df$class_factor)
#df$class_factor <- factor(df$PClass_factor, levels = c("First", "Other"))
summary(df)

df_clean <- na.omit(df) # הסרת שורות עם NA
df <- df_clean

#Summarizing statistics on survival rate depending on class-gender
summary_table <- df |> #omitting all the of NA's in the data and proceeding with the selection of the rest
  group_by(class_factor, gender) |>
  summarise(
    Total = n(), 
    survived = sum(Survived == 1), 
    survival_Rate = round(100 * mean(Survived), 2) #round to the 2 integers after the dot
  ) |>
  ungroup()
print(summary_table)

####LOGISTIC REGRESSION ----
model1 <- glm(Survived ~ 1, data = df, family = binomial)
model2 <- glm(Survived ~ 1 + gender, data = df, family = binomial)
model3 <- glm(Survived ~ 1 + gender + class_factor, data = df, family = binomial)

summary(model1)
summary(model2)
summary(model3)
# 
# odds ratio
exp(coef(model1))
exp(confint(model1))

exp(coef(model2))
exp(confint(model2))

exp(coef(model3))
exp(confint(model3))


#### ROC ----
library(pROC)
df$predict_model1 <- predict(model1, type = "response")
df$predict_model2 <- predict(model2, type = "response")
df$predict_model3 <- predict(model3, type = "response")

roc_model1 <- roc(df$Survived, df$predict_model1)
roc_model2 <- roc(df$Survived, df$predict_model2)
roc_model3 <- roc(df$Survived, df$predict_model3) 

# Confusion matrix
threshold <- 0.5
table(Predicted = (df$predict_model1 > threshold)*1, Actual = df$Survived)
table(Predicted = (df$predict_model2 > threshold)*1, Actual = df$Survived)
table(Predicted = (df$predict_model3 > threshold)*1, Actual = df$Survived)

# AUC
auc(roc_model1)
auc(roc_model2)
auc(roc_model3)

auc_value_model3 <- auc(roc_model3)

print(auc_value_model3)

# Plot ROC curves
plot(roc_model1, col = "blue", main = "ROC Curve Comparison")
plot(roc_model2, add = TRUE, col = "red")
plot(roc_model3, add = TRUE, col = "green")
legend("bottomright", legend = c("Model 1", "Model 2", "Model 3"), col = c("blue","red", "green"), lwd = 2)
