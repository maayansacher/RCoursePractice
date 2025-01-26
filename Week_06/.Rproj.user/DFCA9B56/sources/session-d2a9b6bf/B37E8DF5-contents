#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

load("df.rdataHW6A")

library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggpubr)

age_range <- range(df$age)
age_mean <- mean(df$age)
age_sd <- sd(df$age)

df |>
  group_by(gender) |> 
  summarise(
    num_subjects = n(),
    min_age = min(age), 
    max_age = max(age), 
    mean_age = mean(age), 
    sd_age = sd(age)
  )

#Using plot() - base
plot(df$x,df$y, main = "Scatterplot of x vs y with Regression Line", xlab = "x", ylab = "y", col = "blue", pch = 16)
abline(lm(y ~ x), col = "red", lwd = 2)  # הוספת קו רגרסיה

#Using geom_points and geom_smooth - ggplot
ggplot(data = data.frame(x, y), aes(x = x, y = y)) +
  geom_point(color = "blue", size = 1.7) + #color and size fo the dots
  geom_smooth(method = "lm", color = "red", lwd = 1) +  # קו רגרסיה ליניארי
  labs(
    title = "Scatterplot of X and Y with Regression Line", 
    x = "X values", 
    y = "Y values"
  ) +
  theme_minimal()

#using ggscatter() - ggpubr
ggscatter(data = data.frame(x, y), x = "x", y = "y")
ggscatter(
  data = data.frame(x, y), 
  x = "x", 
  y = "y", 
  add = "reg.line",           # הוספת קו רגרסיה ליניארי
  add.params = list(color = "red", linetype = "solid"),  # עיצוב הקו
  conf.int = TRUE,            # הוספת רצועת ביטחון סביב קו הרגרסיה
  cor.coef = TRUE,            # הצגת מקדם המתאם (correlation coefficient)
  cor.method = "pearson"      # סוג המתאם (ברירת המחדל: Pearson)
)

# שמירת הקובץ
save(data, file = "df.rdataHW6B")
