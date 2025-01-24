# R course for beginners 
# Week 2
# Assignment by Maayan Sacher, ID 302308283

#### CREATE DATAFRAME ---- 

#generate vectors
N = 100
subject = seq(1, N, 1)
gender = sample(c('female', 'male'), N, replace = T)
age = runif(N, 15, 40)
depression = rbinom(N, 1, 0.5)

#add to data.frame
df <- data.frame(subject, gender, age, depression)

#save
write.csv(df, "df.csv", row.names = FALSE)

#generate IQ variable from a normal distribution with a mean 100 and sd 15
iq = rnorm(N, mean = 100, sd = 15)

#### DESCRIPTIVE STATISTICS ---- 

#add to data.frame
df <- data.frame(subject, gender, age, depression, iq)

#features of our data.frame
dim(df) #תאור גודל הטבלה
names(df) #הצגת שמות המשתנים

#describing a single var
max(df$age)
min(df$age)
mean(df$iq, na.rm = TRUE)
median(df$depression, na.rm = TRUE)

library(dplyr)

#Change the value for depression
df <- df|>
  mutate(depression = ifelse(depression == 1, 100, 0))

#Under 18
df|>
group_by(gender)|>
select(age, iq, depression)|>
  filter(age < 18)
summarize(
  mean_age = mean(age, na.rm = TRUE),
  mean_iq = mean(iq, na.rm = TRUE), 
  mean_depression = mean(depression, na.rm = TRUE)
)

#Above 18
df|>
  group_by(gender)|>
  select(age, iq, depression)|>
  filter(age > 18)
summarize(
  mean_age = mean(age, na.rm = TRUE),
  mean_iq = mean(iq, na.rm = TRUE), 
  mean_depression = mean(depression, na.rm = TRUE)
)

#save
write.csv(df, "df.csv", row.names = FALSE)


#### SOLUTION FOR WEEK 2 - only the descriptive statistics portion---- 

#use based package
names(df)
range (df$age)
median(df$age)
mean(df@depression)

#use tidyverse
df = df|> mutate(depression + depression * 100)

df|>
filter(age <= 18)
group_by(gender)|>
summarise(n(), mean(iq), mean(age), mean(depression))

df|>
filter(age > 18)|>
group_by(gender)|>
summarise(n(), mean(iq), mean(age), mean(depression))  