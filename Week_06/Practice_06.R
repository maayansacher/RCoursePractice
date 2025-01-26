####WEEK 6----
#תקנון או scaling ידנית 
x <- rnorm(100, mean = 100, sd = 10)
z <- (x - mean(x)) / sd(x)
mean(z)
sd(z) 
#תקנון בשימוש פונקציית סקיילינג
x <- rnorm(100, mean = 100, sd = 10)
z <- scale(x) #מטרציה - מתימה יותר לניתוח מרובה משתנים
z <- as.vector(scale(x)) #מתאים יותר למשתנה יחיד
print(z)

# הצגת הגרפים זה לצד זה
par(mfrow = c(1, 2))  # חלוקת החלון לשני גרפים, בשורה אחת ושני עמודות
# גרף 1: הנתונים המקוריים
plot(x, main = "הנתונים המקוריים", xlab = "אינדקס", ylab = "ערך", col = "blue", pch = 16)
# גרף 2: הנתונים המתוקננים
plot(z, main = "הנתונים המתוקננים", xlab = "אינדקס", ylab = "ציון תקן", col = "red", pch = 16)
#######################
x <- rnorm(100, mean = 50, sd = 10)  # משתנה x מהתפלגות נורמלית
y <- rnorm(100, mean = 30, sd = 5)   # משתנה y מהתפלגות נורמלית
plot(x, y, main = "Scatterplot of x and y", 
     xlab = "x values", ylab = "y values", 
     col = "blue", #צובע את הנקודות בכחול.
     pch = 16) #משנה את צורת הנקודות כך שיהיו עיגולים מלאים.

#פיזור עם הקו ריגרסיה
x <- rnorm(100, mean = 50, sd = 10)  # משתנה x מהתפלגות נורמלית
y <- rnorm(100, mean = 30, sd = 5)   # משתנה y מהתפלגות נורמלית
plot(x, y, main = "Scatterplot with Regression Line", xlab = "x values", ylab = "y values", col = "blue", pch = 16)
abline(lm(y ~ x), col = "red", lwd = 2)  # הוספת קו רגרסיה

###############

#שימוש בGGPLOT לייצר סקאטר פלוט - 
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

x <- rnorm(100, mean = 100, sd = 20)  # משתנה x
y <- rnorm(100, mean = 100, sd = 20)  # משתנה y

ggplot(data = data.frame(x, y), aes(x = x, y = y)) +
  geom_point(color = "blue", size = 1.7) + #color and size fo the dots
  xlim(50, 150) + #range of x
  ylim(50,150) + #range of y
  geom_smooth(method = "lm", color = "red", lwd = 1.2) +  # קו רגרסיה ליניארי
  labs(
    title = "Scatterplot of X and Y", 
    x = "X values", 
    y = "Y values"
  ) +
  theme_minimal()

#If I want to make sure that all data is included - add the coord_cartesian function
ggplot(data = data.frame(x, y), aes(x = x, y = y)) +
  geom_point(color = "blue", size = 3) +  # נקודות כחולות
  coord_cartesian(xlim = c(50, 150), ylim = c(50, 150)) +  # טווח צירים
  geom_smooth(method = "lm", color = "red", lwd = 1.2) +  # קו רגרסיה ליניארי
  labs(
    title = "Scatterplot with Regression Line",  # כותרת הגרף
    x = "X values",  # כיתוב לציר ה-X
    y = "Y values"   # כיתוב לציר ה-Y
  ) +
  theme_minimal()  # עיצוב נקי

#############
#שימוש בחבילת GGPUBR
if (!require(ggpubr)) install.packages("ggpubr")

# טעינת החבילה
library(ggpubr)

# יצירת המשתנים
x <- rnorm(100, mean = 100, sd = 20)  # משתנה x
y <- rnorm(100, mean = 100, sd = 20)  # משתנה y

# יצירת scatterplot בסיסי
ggscatter(data = data.frame(x, y), x = "x", y = "y")

#עכשיו עם הקו רגרסיה
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
##########################
#קשר בין שני משתנים רציפים 
x <- rnorm(100, mean = 100, sd = 25)  # משתנה x
y <- rnorm(100, mean = 100 + 3 * x, sd = 25)  # משתנה y עם קשר ליניארי ל-x

model <- lm(y ~ x)
summary(model)
plot(model)

################
#עכשיו ריגרסיה כשהם מתוקננים
# תקנון המשתנים
x_scaled <- scale(x)
y_scaled <- scale(y)

# הערכת הקשר בין המשתנים המתוקננים
model_scaled <- lm(y_scaled ~ x_scaled)

# הצגת סיכום המודל המתוקנן
summary(model_scaled)

######
# חישוב מקדם המתאם פירסון
correlation <- cor(x, y, method = "pearson")

# הצגת התוצאה
correlation #אם זה קרוב ל-1 אז יש קשר חיובי חזק ואם מינוס 1 אז קשר שלילי חזק. כאשר זה אפס אז אין קשר

