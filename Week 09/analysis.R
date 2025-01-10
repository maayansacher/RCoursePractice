#R course for beginners 
# Week 9
# Assignment by Maayan Sacher, ID 302308283

#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

#### CREATE DATAFRAME ----
N = 200
subject = seq_len(N)  # מספר נבדק can also use seq(1:N)
age = sample(18:60, N, replace = TRUE) #can also use age = runif(N, 18, 60)
gender = factor(
  sample(c("Male", "Female", "Other"), N, replace = TRUE),
  levels = c("Male", "Female", "Other")
)
#can also use this for the gender (if dont' want to use levels) - gender = factor(sample(c("Male", "Female", "Other"), N, replace = TRUE))
avg_response_time = runif(N, 200, 6000)
depression = runif(N, 0, 100)
sleep = runif(N, 2, 12)

df <- data.frame(
  subject = subject,
  age = age,
  gender = gender,
  avg_response_time = avg_response_time,
  depression = depression, 
  sleep = sleep
)

print(head(df))

####שימוש בפונקציה----
source("functions.R")

print(results)
View(results)

#save
save(data, file = "df.rdataHW09A")
