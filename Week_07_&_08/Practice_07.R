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