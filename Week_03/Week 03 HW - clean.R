# R course for beginners 
# Week 3
# Assignment by Maayan Sacher, ID 302308283


#### ניקוי ה-Workspace ----
rm(list = ls())
cat("\014")  # מנקה את הקונסולה
graphics.off()  # סוגר גרפים פתוחים

#### טעינת הנתונים ----
# נתיב לקובץ subject_data.csv
df <- read.csv("subject_data.csv")

# בדיקת הנתונים
head(df)
str(df)
summary(df)

# טעינת חבילת tidyverse (הכוללת את dplyr)
library(tidyverse)

#### DESCRIPTIVE STATISTICS ---- 

#use based package
names(df)
range (df$age)
median(df$iq)
mean(df$depression)

df = df|> mutate(depression = depression * 100)

df|>
  filter(age <= 18)|>
  group_by(gender)|>
  summarise(n(), mean(iq), mean(age), mean(depression))

df|>
  filter(age > 18)|>
  group_by(gender)|>
  summarise(n(), mean(iq), mean(age), mean(depression))

#save
write.csv(df, "subject_data.csv", row.names = FALSE)

#### HISTOGRAMS, DOTPLOT BOXPLOT, DENSITY ---- 

library(ggplot2)
library(ggdist)

#histogram of iq
iq <- runif(100,50,150)
data <- data.frame(iq) #creating table
ggplot(data = data, aes(x = iq)) +
  geom_histogram(bins = 20, fill = "orange") +
  xlim(50,150) +
  xlab("IQ scores") +
  ylab("Frequency") +
  ggtitle("Histogram of IQ Scores") +
  theme_minimal()

#histogram of iq
iq <- runif(100,50,150)
data <- data.frame(iq) #creating table
ggplot(data = data, aes(x = iq)) +
  geom_dotplot(bins = 20, fill = "red") +
  xlim(50,150) +
  xlab("IQ scores") +
  ylab("Frequency") +
  ggtitle("Histogram of IQ Scores") +
  theme_minimal()

#boxplot of IQ
iq <- runif(100,50,150)
data <- data.frame(iq) #creating table
ggplot(data = data, aes(x = "", y = iq)) +
  geom_boxplot(fill = "gray") +
  ylab("IQ scores") +
  xlab("") +
  ggtitle("Boxplot of IQ Scores") +
  theme_minimal()


#Density of iq scores
iq <- runif(100,50,150)
data <- data.frame(iq) #creating table
ggplot(data = data, aes(x = iq)) +
  geom_density(fill = "skyblue") +
  xlim(50,150) +
  xlab("IQ scores") +
  ylab("Density") +
  ggtitle("Density of IQ Scores") +
  theme_minimal()


#### USE OF STAT ---- 

#פיזור רציף stat_halfeye()
library(ggplot2)
library(ggdist)
set.seed(123)
score <- runif(100, 50, 150)  # ציונים אקראיים
subject <- 1:100  # מזהי נבדקים
data <- data.frame(iq, subject)  # יצירת הטבלה
ggplot(data, aes(x = iq, y = subject)) +
  stat_halfeye(aes(fill = stat(.width)), 
               .width = c(0.7, 0.8, 0.9), 
               alpha = 0.9) +
  scale_fill_viridis_c(option = "d") +
  theme_classic() +
  ggtitle("IQ scores") +
  labs(x = "IQ Scores", y = "subjects")

#another option for the colors of the halfeye
library(ggplot2)
library(ggdist)
set.seed(123)
score <- runif(100, 50, 150)  # ציונים אקראיים
subject <- 1:100  # מזהי נבדקים
data <- data.frame(iq, subject)  # יצירת הטבלה
ggplot(data, aes(x = iq, y = subject)) +
  stat_halfeye(fill = "purple", color = "black", alpha = 0.7) +
    theme_classic() +
  ggtitle("IQ scores") +
  labs(x = "IQ Scores", y = "subjects")



#### CALCULATING DENSITY ---- 

#calculating density
dnorm(100, 100, 15)


#finding the density for a random variable between 0-200 with the following info.
dnorm(0:100, 100, 50)

#using plot for density
x <- 0:100

density_values <- dnorm(x, mean = 100, sd = 50)

plot(
  x, density_values,  # המשתנה הרציף וצפיפויותיו
  type = "l",         # "l" מייצג קו רציף
  col = "blue",       # צבע הקו
  lwd = 2,            # עובי הקו
  main = "Density Curve for Normal Distribution",  # כותרת הגרף
  xlab = "X Values",  # שם ציר X
  ylab = "Density"    # שם ציר Y
)



#using geom to show the density
library(ggplot2)
library(ggdist)

set.seed(123)
data <- data.frame(iq = rnorm(100, mean = 100, sd = 15))  # IQ עם ממוצע 100 וסטיית תקן 15

ggplot(data, aes(x = iq)) +
  geom_slabinterval(
    aes(y = 0, fill = stat(.width)), 
    .width = c(0.7, 0.8, 0.9),      # שלוש רמות CI
    orientation = "horizontal"       # צפיפות אופקית
  ) +
  scale_fill_brewer(palette = "Blues") +  # צבעים לרצועות רווח הסמך #the scale_filll_brewer creates more paletes for the blues
  theme_classic() +
  labs(
    title = "IQ Density Curve with Confidence Intervals",
    x = "IQ",
    y = "Density"
)



#using stat to find density
library(ggplot2)
library(ggdist)

set.seed(123)
data <- data.frame(iq = rnorm(100, mean = 100, sd = 15))  # IQ עם ממוצע 100 וסטיית תקן 15

# גרף מתוקן עם stat_slabinterval
ggplot(data, aes(x = iq)) +
  stat_slabinterval(
    aes(fill = stat(.width)),  # צבעים לפי רמות רווח סמך
    .width = c(0.7, 0.8, 0.90),  # רמות CI
    orientation = "horizontal"  # התפלגות אופקית
  ) +
  scale_fill_viridis_c() +  # שינוי לסולם צבעים שמתאים לערכים רציפים
  theme_classic() +
  labs(
    title = "IQ Density Curve with Confidence Intervals",
    x = "IQ",
    y = "Density"
  )


#עוד דרך עם סטט

library(ggplot2)
library(ggdist)

set.seed(123)
iq <- rnorm(100, mean = 100, sd = 15)  # התפלגות נורמלית עם ממוצע 100 וס"ת 15
data <- data.frame(iq = iq)  # טבלה עם נתוני IQ

mu <- mean(data$iq)         # ממוצע
sigma <- sd(data$iq)        # סטיית תקן

data$density <- dnorm(data$iq, mean = mu, sd = sigma)

ggplot(data, aes(x = iq, y = density)) +
  stat_slab(aes(fill = after_stat(x)), color = "black") +  # geom מחבילת ggdist
  scale_fill_gradient(low = "lightblue", high = "blue") +  # מילוי עם מעבר צבעים
  theme_minimal() +
  labs(
    title = "Density of IQ (Fitted to Normal Distribution)",
    x = "IQ Scores",
    y = "Density"
  )

#### the actual answer for this week----
#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

#### CREATE DATAFRAME ----

#generate vector
N = 100
subject = seq(1, N, 1)
gender = sample(c('female', 'male'), N, replace = T)
sleep_duration = rnorm(N, mean = 7, sd = 1.5)
age = runif(N, 15, 40)
iq = rnorm(N, 100, 15)
depression = rbinom(N, 1, 0.5)

gender = factor(N)
depression = factor(depression, labels = c('Control', 'Depressed'))

#add to data.frame
df <- data.frame(subject, gender, age, iq, sleep_duration, depression)

#save
save(df, file = "./data/df.rdata")

#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

library(tidyverse)
load("./data/df.rdata")

####DESCRIPTIVE STATISTICS ----
#use base package
names(df)
range(df$age)
median(df$iq)
mean(df$depression)

#use tidyverse
df = df |> mutate(depression = depression * 100)

df |>
  filter(age <= 18)|>
  group_by(gender) |>
  summarise(n(), mean(iq), mean(age), mean(depression))

df |>
  filter(age > 18) |>
  group_by(gender) |>
  summarise(n(), mean(iq), mean(age), mean(depression))

####PLOT IQ----

#use ggplot geom functions
library(ggplot2)
library(ggdist)

ggplot(df, aes(x = iq)) +
  geom_histogram(binwidth = 5, fill = "skyblue") +
  xlim(50, 150) +
  xlab("IQ scores") +
  theme_classic()

ggplot(df, aes(y = iq)) +
  geom_boxplot(fill = "lightblue") +
  ylim(50, 150) +
  ylab("IQ socres") +
  theme_classic()

ggplot(df, aes(x = iq)) +
  geom_density(fill = "lightpink") +
  xlim(50, 150) +
  xlab("IQ score") +
  theme_classic()

#use ggdist 
library(ggdist)

ggplot(df, aes(x = iq)) +
  stat_halfeye(.width = c(0.7, 0.8, 0.9), color = "black") +
  xlim(50, 150) +
  ylab("IQ scores") +
  theme_classic()

#use ggdist with manual density estimation
df = df |> mutate(density = dnorm(iq, mean = 100, sd = 15))

ggplot(df, aes(x = iq, thickness = density)) +
  geom_slab() +
  xlim(50,150) +
  ylab("density") +
  theme_classic()

#save
write.csv(df, "subject_data.csv", row.names = FALSE)
