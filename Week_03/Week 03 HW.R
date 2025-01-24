# R course for beginners 
# Week 3
# Assignment by Maayan Sacher, ID 302308283

# טעינת חבילת tidyverse (הכוללת את dplyr)
library(tidyverse)

#### CREATE DATAFRAME ---- 

#generate vectors
N = 100
subject = seq(1, N, 1)
gender = sample(c('female', 'male'), N, replace = T)
age = runif(N, 15, 40)
iq = rnorm(N, 100, 15)
depression = rbinom(N, 1, 0.5)

#add to data.frame
df <- data.frame(subject, gender, age, iq, depression)

#save
write.csv(df, "subject_data.csv", row.names = FALSE)

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
