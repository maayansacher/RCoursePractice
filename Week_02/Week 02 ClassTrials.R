N = 100
rnorm(100, 0, 1)
random_values <- rnorm(n = 100)
print(random_values)
df <- data.frame(
  subject = c(1, 2, 3, 4, 5),
  age = c(23, 25, 31, 22, 35),
  score = c(85, 90, 78, 88, 92)
)

head(df, 10)
tail(df,10)
namges(df)
dim(df)
nrow(df)
ncol(df)
summary(df)

print(df$subject)
length(df$age)
unique(df$subject)
mean(df$age)
median(df$age)
sd(df$age)
unique(df$age)
max(df$age)
min(df$age)
quantile(df$age, 0.75)

rowSums(df)
rowMeans(df)
colSums(df)
colMeans(df)
print(df[1,1])
print(df[2:4,3])
print(df[2:4, 'age'])
print(df[2:4, ])

head(df, 10)$age
mean(head(df,10)$age)

