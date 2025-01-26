# R course for beginners 
# Week 6
# Assignment by Maayan Sacher, ID 302308283

#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

#### CREATE DATAFRAME ----
N = 200
subject = seq(1:N)
age = runif(N, 18, 60)
gender = sample(c("female", "male"), N, replace = TRUE)

#y ~ norm(mean, sigma)
#mean = b0 + b1*x
#sigma = 25

b0 = 50
b1 = -20

x = runif(N, 0, 10)
y = rnorm(N, mean = b0 + b1*x, sd = 1)

df = data.frame(subject, age, gender, x, y) 

plot(df$x,df$y, main = "Scatterplot of x vs y", xlab = "x", ylab = "y")

head(df)

model <- lm(y ~ x, data = df)
print(model)

if (!dir.exists("data")) {
  dir.create("data")  # יצירת התיקייה במידה והיא לא קיימת
}

# שמירת הקובץ
save(data, file = "df.rdataHW6A")

   