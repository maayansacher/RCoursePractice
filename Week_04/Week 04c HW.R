#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

library(tidyverse)
library(dplyr)
load("df.rdata02")

set.seed(123)
sleep_duration <- rnorm(N, mean = 7, sd = 1.5)
t_test_result <- t.test(sleep_duration,
                        alternative = "two.sided",
                        mu = 3,
                        conf.level = 0.95)
print(t_test_result)

set.seed(123)
sleep_duration <- factor(rep(c("control", "depression"), each = 50))
y <- c(
  rnorm(50, mean = 5, sd = 1.5),
  rnorm(50, mean = 7, sd = 1.2) #האם יש שלב מקדים שאני צריכה לחשב את ממוצע השעות שנה לנבדקים עם דיכאון?
)

t_test_result <- t.test(y ~ sleep_duration,
                        alternative = "two.sided",
                        conf.level = 0.95)
print(t_test_result)

#ניסיתי להוריד את החבילה בכמה דרכים שונות וזה לא הצליח (גם בשלב הלמידה) אבל כתבתי את הקוד בכל זאת

install.packages("effectsize")
install.packages("effectsize", dependencies = TRUE)
install.packages("effectsize", type = "binary")
install.packages("remotes")
remotes::install_github("easystats/effectsize")

# טעינת החבילה
library(effectsize)

#  Cohen's d 
cohens_d_result <- cohens_d(y ~ sleep_duration)  # השוואה לערך 8
print(cohens_d_result)


# THIS DIDN'T WORK THE CORRECT WAY IS חישוב Cohen's d ידני - something went wrong there and I suspect it's because I couldn't calculate the mean for depression/control
mean_control <- mean(df[depression == "0", sleep_duration]) #[indexing of the rows and the columns]
mean_depressed <- mean(df[depression == "100", sleep_duration])
sd_control <- sd(df[depression == "0", sleep_duration])
sd_depressed <- sd(df[epression == "100", sleep_duration])

n_control <- sum(df[depression == "0", sleep_duration])
n_depressed <- sum(df[depression == "100", sleep_duration])
s_pooled <- sqrt(((n_control - 1) * sd_control^2 + (n_depressed - 1) * sd_depressed^2) /
                   (n_control + n_depressed - 2))

cohens_d_manual <- (mean_control - mean_depressed) / s_pooled
print(cohens_d_manual)

#ריגרסיה שכיחות
model <- lm(y ~ sleep_duration)
summary(model)
model$coefficients

###פתרון----

library(tidyverse)
library(effectsize)
load("./data/df.rdata")

#### ANOVA ----

#single t.test
t.test(df$sleep_duration, mu = 3)

#effect of depression
t.test(df$sleep_duration ~ df$depression)

#cohen's d with effectsize
cohens_d(sleep_duration ~ depression, data = df)

#cohen's d manual
df |>
  group_by(depression) |>
  summarise(mean = mean(sleep_duration), sd = sd(sleep_duration), n = n()) |>
  summarise(d = diff(mean) / sqrt(sum(((n - 1) * sd^2)) / sum(n - 1)))


#linear regression
model = lm(sleep_duration ~ depression, data = df)
summary(model)

#> Coefficients:
#> Estimate Std. Error t value Pr(>|t|)    
#> (Intercept)           6.6799     0.2347  28.462   <2e-16 ***
#> depressionDepressed   0.3430     0.3165   1.084    0.281 
