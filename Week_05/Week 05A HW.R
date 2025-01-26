# R course for beginners 
# Week 5
# Assignment by Maayan Sacher, ID 302308283

#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

#### CREATE DATAFRAME ----
N = 40 
df = data_frame()
subject = seq(1:N)
age = sample(18:60, N, replace = TRUE)
gender = factor(sample(c("Male", "Female", "Other"), N, replace = TRUE))
group = factor(sample(c("Clinical", "Control"), N, replace = TRUE))
treatment = factor(sample(c("TMS", "Placebo"), N, replace = TRUE))
memory_score = runif(N, 0, 100)
memory_score = rnorm(N, 50, 30)

data <- data.frame(
  subject = subject,
  age = age,
  gender = gender,
  group = group,
  treatment = treatment, 
  memory_score = memory_score
)

print(head(data))

#save
save(data, file = "df.rdataHW5A")
