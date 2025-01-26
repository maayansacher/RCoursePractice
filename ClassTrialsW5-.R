####WEEK 9----
add_numbers <- function(x, y) {
  result <- x + y  # פעולת החיבור
  return(result)   # הפלט: מחזירה את התוצאה
}
add_numbers(157,49)

multiply_numbers <- function(x, y) {
  result <- x * y  # פעולת הכפל
  return(result)   # החזרת התוצאה
}
multiply_numbers(2547,13)

conditional_operation <- function(x, y) {
  if (x > 5 & y > 5) {   # בדיקה אם שני המספרים גדולים מ-5
    result <- x * y      # אם כן, מכפילים אותם
  } else {
    result <- x + y      # אחרת, מחברים אותם
  }
  return(result)         # החזרת התוצאה
}
conditional_operation(6, 8)  # שני המספרים גדולים מ-5 -> מצופה כפל
conditional_operation(4, 7)  # אחד מהמספרים קטן מ-5 -> מצופה חיבור
conditional_operation(3, 2)  # שניהם קטנים מ-5 -> מצופה חיבור

cylinder <- function(r, h){
  area <- 2*pi*r*h+2*pi*r^2
  return(cbind(r,h,area)) #can also do data.fram(r,h,area) will not give a matrix but pretty much the same
}

cylinder(1:10,20) #will provide me a table of the areas per radius ranging from 1 to 10

#DEBUGGING
x1 = 2
x2 = 3
Multiplication <- function(x1, x2) {
  x3 = 1000
  
  browser()  # עצירה כאן
  
  y = x1 * x3
  return(y)
}
print(Multiplication(x1, x2))
ls() #will show me the variables that are in the workspace

####WEEK 7----

#יצירת מטריציה עם נתונים חסרים
x <- matrix(c(1, 2, NA, 4, 5, NA, 7, 8, 9), nrow = 3, byrow = TRUE)
#למצוא אם יש נתונים שלא קיימים
is.na(x)
#לספור כמה מהם יש
sum(is.na(x))
#למצוא בדיוק איפה זה
which(is.na(x), arr.ind = TRUE)

#יצירת וקטור עם נתונים חסרים
x <- c(5, NA, 3, 8)
#למצוא אם יש נתונים שלא קיימים
is.na(x)
#לספור כמה מהם יש
sum(is.na(x))
#למצוא בדיוק איפה זה
which(is.na(x), arr.ind = TRUE)
#להוריד את כל הנתונים החסרים- מוריד את כל השורה!
na.omit(x)
#למצוא את הממוצע ללא הנתונים החסרים
mean(x, na.rm = TRUE)


####
#לולאה
for (x in 1:10) {
  print(x)
}

#לולאה על וקטור מספרי
nums <- c(5, 10, 20)
for (i in nums) {
  print(i)
}

#לטעון קבצים בתוך תקייה ולשים אותם בתוך הדאטה פריים בשימוש של לולאה
# קבלת שמות הקבצים בתיקייה "data"
file_names <- dir("data")

# יצירת Data Frame ריק לאחסון כל הנתונים
df <- data.frame()

# לולאה לטעינת כל הקבצים וחיבורם ל-Data Frame אחד
for (file in file_names) {
  # טעינת הקובץ הנוכחי
  temp_data <- read.csv(file.path("data", file))
  
  # חיבור הקובץ הנוכחי ל-Data Frame הראשי
  df <- rbind(df, temp_data)
}

#לולאה על וקטור עם טקסטים (strings)
words <- c("hello", "world", "R")
for (word in words) {
  print(word)
}

#לולאה על וקטור לוגי
logical_vec <- c(TRUE, FALSE, TRUE)
for (val in logical_vec) {
  print(val)
}

#שימוש בלולאות לקפיצות 
for (i in seq(0, 100, by = 10)) {
  print(i)
}

#חישוב של הסכום של וקטוב באמצעות לולאות
numbers <- c(-20, 500, 32, 400)
total <- 0  # משתנה שיחזיק את הסכום הכולל

for (num in numbers) {
  total <- total + num
}

print(total)

#יצירת לולאה שמחשבת את הממוצע של כל עמודה במטריציה
m <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, byrow = TRUE)

# לולאה לחישוב ממוצע לכל עמודה
for (j in 1:ncol(m)) {
  column_mean <- mean(m[, j])  # מחשב את ממוצע העמודה ה-j
  cat("ממוצע של עמודה", j, "הוא:", column_mean, "\n")
}
#יצירת לולאה שמדפיסה הודעה מותאמת אישית (למשל "שלום, שם המשתמש שלך הוא ___") עבור וקטור של שמות.
names <- c("Alice", "Bob", "Charlie")

# לולאה להדפסת הודעות מותאמות אישית
for (name in names) {
  cat("שלום,", name, "- ברוך הבא!\n")
}

####
#RBIND AND CBIND
df1 <- data.frame(x = 1:3, y = c("G1", "G2", "G3"))

df2 <- data.frame(x = 15:19, z = c("Z1", "Z2", "Z3", "Z4", "Z5"))

# Bind two data frames
df <- rbind(df1, df2)
df

####
#כתיבת קוד לבדיקת ערך וקטור - לוגים
# יצירת וקטור מ-1 עד 10
vec <- 1:10

# יצירת משתנה לוגי שבודק אם הערכים שווים ל-2
logical_vec <- vec == 2

# הדפסת הווקטור המקורי
print("הווקטור המקורי:")
print(vec)

# הדפסת המשתנה הלוגי
print("המשתנה הלוגי:")
print(logical_vec)

#להחליף את TRUE AND FALSE באפס ואחד
vec <- 1:10

# יצירת משתנה לוגי שבודק אם הערכים גדולים מ-5
logical_vec <- vec > 5

# הפיכת המשתנה הלוגי למספרי
numeric_vec <- logical_vec * 1

# הדפסת המשתנה הלוגי
print("המשתנה הלוגי:")
print(logical_vec)

# הדפסת המשתנה הנומרי
print("המשתנה הנומרי:")
print(numeric_vec)




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


####WEEK 5----


###עוד דוגמא שלא עבדה לי----
df_summary <- data |>
  group_by(gender, group) |>
  summarise(
    mean = mean(dependent_var, na.rm = TRUE),  # חישוב ממוצע
    se = sd(dependent_var, na.rm = TRUE) / sqrt(n())  # חישוב סטיית תקן
  )
ggplot(data = df_summary, aes(x = gender, y = dependent_var, color = group)) +
  geom_jitter(position = position_jitter(width = 0.2, height = 0), size = 1, alpha = 0.3) +
  geom_point(data = df_summary, aes(x = gender, y = mean, group = treatment, color = treatment), 
             position = position_dodge(1), size = 4) +
  
  geom_errorbar(data = df_summary,aes(x = group, y = dependent_var, group = treatment, ymin = mean - se, ymax = mean + se, color = treatment ), 
                position = position_dodge(1), width = 0.2
  ) +
  theme_minimal() 

###FACTORS----
#factors with contrast - will choose female as the 0 because of alphabetical order
set.seed(123)
gender <- factor(c("female", "male", "female", "male"))
contrasts(gender) <- matrix(c(0, 1), ncol = 1)
contrasts(gender)

#if want to choose who is the base with levels
set.seed(123)
gender <- factor(c("female", "male", "female", "male")) # יצירת הפאקטור
gender <- relevel(gender, ref = "male")                # שינוי רמת הבסיס ל-"male"
contrasts(gender) <- matrix(c(0, 1), ncol = 1)         # קידוד: male = 0, female = 1
contrasts(gender)                                      # בדיקת הקונטרסטים

#יצירת נתונים
set.seed(123)  # לקביעת שכפול התוצאות

gender <- factor(rep(c("Male", "Female"), each = 30))  # פאקטור עבור מגדר
group <- factor(rep(c("Control", "Treatment"), times = 30))  # פאקטור עבור קבוצה
dependent_var <- rnorm(60, mean = 100, sd = 15)  # משתנה תלוי רציף

data <- data.frame(gender, group, dependent_var)  # יצירת מסגרת נתונים
head(data)

#סיכום הנתונים
library(dplyr)

df_summary <- data |>
  group_by(gender, group) |>
  summarise(
    mean_dependent_var = mean(dependent_var, na.rm = TRUE),  # חישוב ממוצע
    sd_dependent_var = sd(dependent_var, na.rm = TRUE)  # חישוב סטיית תקן
  )

print(df_summary)  # הצגת התוצאות

#ציור של גרף 
library(ggplot2)
ggplot(data = df_summary, aes(x = gender, y = mean_dependent_var)) +
  geom_point(size = 3) +
  geom_errorbar(aes(
    ymin = mean_dependent_var - sd_dependent_var,  # ממוצע פחות סטיית התקן
    ymax = mean_dependent_var + sd_dependent_var  # ממוצע פלוס סטיית התקן
  ),
  width = 0.2,  # רוחב קווי השגיאה
  size = 0.8    # עובי הקווים
  ) +
  facet_wrap(~ group) +
  scale_color_manual(
    values = c("Control" = "steelblue", "Treatment" = "darkorange")  # צבעים מותאמים אישית
  ) +
  geom_point(data = data, aes(x = gender, y = dependent_var, color = group), alpha = 0.5, size = 2)
  labs(
    title = "ממוצעים של המשתנה התלוי לפי מגדר וקבוצה",
    x = "מגדר",
    y = "ממוצע של המשתנה התלוי"
  ) +
  theme_minimal()
  

  ############
  install.packages("ggpubr")
  library(ggpubr)
  
  # יצירת נתונים
  set.seed(123)
  gender <- factor(rep(c("Male", "Female"), each = 30))
  group <- factor(rep(c("Control", "Treatment"), times = 30))
  dependent_var <- rnorm(60, mean = 100, sd = 15)
  
  data <- data.frame(gender, group, dependent_var)
  
  # סיכום הנתונים: ממוצעים וסטיות תקן
  df_summary <- data |>
    group_by(gender, group) |>
    summarise(
      mean_dependent_var = mean(dependent_var),
      sd_dependent_var = sd(dependent_var)
    )
  
# שימוש ב-ggerrorplot
ggerrorplot(
  df_summary, 
  x = "gender", 
  y = "mean_dependent_var", 
  desc_stat = "mean_sd",  # מציין שמדובר בממוצע וסטיית תקן
  error.plot = "errorbar", 
  add = "mean", 
  color = "group"  # צבע לפי קבוצה
  )

# היסטוגרמה
gghistogram(data, x = "dependent_var", 
            add = "density", 
            fill = "group", 
            bins = 30)

# עקומת צפיפות
ggdensity(data, x = "dependent_var", 
          color = "group", 
          fill = "group", 
          alpha = 0.4)


#Another way to do the density and histogram without the ggpubr
ggplot(data, aes(x = dependent_var, fill = group)) +
  geom_histogram(aes(y = ..density..), bins = 30, alpha = 0.6) +
  geom_density(aes(color = group), size = 1.2) +
  facet_wrap(~ group) +
  labs(
    title = "היסטוגרמה ועקומת צפיפות לפי פאנלים",
    x = "ערכי המשתנה התלוי",
    y = "צפיפות"
  ) +
  theme_minimal()

#################
set.seed(123)

# יצירת הנתונים
gender <- factor(rep(c("Male", "Female"), each = 30))  # פאקטור למגדר
group <- factor(rep(c("Control", "Treatment"), times = 30))  # פאקטור לקבוצה
dependent_var <- rnorm(60, mean = 100, sd = 15)  # משתנה תלוי רציף

# יצירת מסגרת נתונים
data <- data.frame(gender, group, dependent_var)

# יצירת מודל רגרסיה פקטוריאלי עם אינטראקציה
model <- lm(dependent_var ~ gender * group, data = data)
print(model)
summary(model)
model$coef
contrasts(data$gender)  # בדיקה של קידוד משתנה המגדר
contrasts(data$group)   # בדיקה של קידוד משתנה הקבוצה

