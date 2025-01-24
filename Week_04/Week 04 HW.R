# R course for beginners 
# Week 4
# Assignment by Maayan Sacher, ID 302308283

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

gender = factor(gender)
depression = factor(depression, levels = c(0,1), labels = c('no', 'yes'))

#add to data.frame
df <- data.frame(subject, gender, age, iq, sleep_duration, depression)

#save
save(df, file = "df.rdata")
