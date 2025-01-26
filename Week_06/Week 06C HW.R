#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

load("df.rdataHW6B")

#unscaled regression
model <- lm(y ~ x)
summary(model)
plot(model)

#Runing it on 20 participants - results from running it are: 
#Residuals:
#Min      1Q  Median      3Q     Max 
#-1.8957 -0.7500 -0.1271  0.7603  1.9922 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  49.92940    0.52014   95.99   <2e-16 ***
#  x           -19.99423    0.09076 -220.29   <2e-16 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 1.124 on 18 degrees of freedom
#Multiple R-squared:  0.9996,	Adjusted R-squared:  0.9996 
#F-statistic: 4.853e+04 on 1 and 18 DF,  p-value: < 2.2e-16

model <- lm(y ~ x)
summary(model)
plot(model)

#Runing it on 200 participants - results from running it are: 
#Residuals:
#  Min       1Q   Median       3Q      Max 
#-1.29241 -0.56699  0.08072  0.64404  1.27733 

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  50.89718    0.45274   112.4   <2e-16 ***
#  x           -20.16325    0.07618  -264.7   <2e-16 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.8427 on 18 degrees of freedom
#Multiple R-squared:  0.9997,	Adjusted R-squared:  0.9997 
#F-statistic: 7.006e+04 on 1 and 18 DF,  p-value: < 2.2e-16

#The differences are mainly between the x values, the standard error, and the F-statistic

correlation <- cor(x, y, method = "pearson")
correlation

#Scaled
x_scaled <- scale(x)
y_scaled <- scale(y)

model_scaled <- lm(y_scaled ~ x_scaled)

summary(model_scaled)

correlation <- cor(x, y, method = "pearson")

correlation #אם זה קרוב ל-1 אז יש קשר חיובי חזק ואם מינוס 1 אז קשר שלילי חזק

# שמירת הקובץ
save(data, file = "df.rdataHW6C")