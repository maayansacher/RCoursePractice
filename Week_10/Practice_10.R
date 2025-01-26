####family=gaussian: glm for family=gaussian is the same as lm----
# יצירת נתוני דוגמה
set.seed(123)
x <- rnorm(100)                     # משתנה בלתי תלוי
y <- 5 + 3 * x + rnorm(100, sd = 2) # משתנה תלוי עם רעש גאוסייני

# התאמה עם lm (רגרסיה לינארית רגילה)
model_lm <- lm(y ~ x)

# התאמה עם glm (עם family = gaussian)
model_glm <- glm(y ~ x, family = gaussian())

# השוואת התוצאות
summary(model_lm) # סיכום המודל עם lm
summary(model_glm) # סיכום המודל עם glm


####logistical model for glm----
# רגרסיה לוגיסטית עם glm
logistic_model <- glm(survived ~ PClass + gender, 
                      data = df, 
                      family = binomial()) # family = binomial מגדיר רגרסיה לוגיסטית

# הצגת תקציר של המודל
summary(logistic_model)

#ANOTHER EXAMPLE WITH GLM FOR LOGITTIC 
# יצירת נתונים מלאכותיים
set.seed(123)
n <- 200
hours <- rnorm(n, mean = 5, sd = 2)            # שעות לימוד (ממוצע 5, סטיית תקן 2)
gender <- sample(c("male", "female"), n, replace = TRUE) # מגדר
pass <- rbinom(n, 1, prob = plogis(0.5 * hours + ifelse(gender == "female", 1, -1))) # משתנה בינארי: הצלחה

# בניית מסגרת הנתונים
df_new <- data.frame(hours = hours, gender = gender, pass = pass)
head(df_new) # הצצה לנתונים

#Code that uses logistical regression for predictions
logistic_model_new <- glm(pass ~ hours + gender, 
                          data = df_new, 
                          family = binomial())

# סיכום המודל
summary(logistic_model_new) 
#(Intercept): זהו הסיכוי הבסיסי להצלחה כאשר שעות הלימוד = 0 והמגדר הוא "male" (רמת הבסיס).
#hours: מקדם חיובי (0.5791), שמשמעותו ששעות לימוד נוספות מגדילות את הסיכוי להצלחה.
#genderfemale: מקדם שלילי (-2.248), שמשמעותו שגברים מצליחות פחות מנשים במבחן, בהינתן אותו מספר שעות לימוד.

# חיזוי ההסתברות להצלחה עבור שעות ומגדר מסוימים
new_data <- data.frame(hours = c(4, 6, 8), gender = c("male", "female", "female"))
predicted_probs <- predict(logistic_model_new, newdata = new_data, type = "response")

# הצגת התוצאות
cbind(new_data, Predicted_Probability = round(predicted_probs, 2))

# יצירת מודל לוגיסטי
logistic_model <- glm(pass ~ hours + gender, data = df_new, family = binomial())

# 1. צפייה בסיכום המודל (summary)
summary(logistic_model)

# 2. צפייה במקדמים בלבד (coef)
coef(logistic_model)
#intercept- ערך נקודת החיתוך מייצג את הלוג-אודס עבור נשים שלמדו 0 שעות
#hours- עלייה של שעה בלימוד מגדילה את הלוג-אודס (יתרון לעומת נשים)
#gendermale- לגברים יש ירידה ב2.2 ללוג-אודס (חסרון לעומת נשים)

# 3. צפייה ביחס הסיכויים (Odds Ratios)
exp(coef(logistic_model))
#אישה (כי נשים הן הרמת בסיס של מגדר) שלומדות 0 שעות (כי זה רמת הבסיס לשעות) הסיכויים להצליח הם 2.13 בהשוואה לסיכויים לא להצליח
#כל שעת לימודים נוספת מכפילה את הסיכויים להצלחה פי 1.75
#לגברים יש סיכוי נמוך פי 0.1055 להצליח לעומת נשים באותן שעות לימוד


####ROC----
# נתונים פשוטים: שעות לימוד ותוצאה (עבר/לא עבר)
hours <- c(2, 3, 5, 7, 1, 4)  # משתנה בלתי תלוי
pass <- c(0, 0, 1, 1, 0, 1)   # משתנה תלוי (0 = לא עבר, 1 = עבר)

# התאמת מודל רגרסיה לוגיסטית
logistic_model <- glm(pass ~ hours, family = binomial())

# הצגת סיכום המודל
summary(logistic_model)

# הערכת ההסתברויות עבור הנתונים שהותאמו במודל
predicted_probs <- predict(logistic_model, type = "response") #מפעיל את המודל ומחשב תחזיות לכל תצפית בנתונים.

# הצגת ההסתברויות החזויות
print(predicted_probs)#מציג את ההסתברויות החזויות עבור כל תצפית.
#ערכים קרובים ל-1: המודל חוזה שהנבדק "עבר".
#ערכים קרובים ל-0: המודל חוזה שהנבדק "לא עבר".

install.packages("pROC")
library(pROC)

roc_curve <- roc(pass, predicted_probs) # pass = תוצאה אמיתית, predicted_probs = הסתברויות חזויות
auc_value <- auc(roc_curve)             # חישוב ה-AUC מתוך עקומת ה-ROC

# הצגת ה-AUC
print(auc_value)

# יצירת גרף ה-ROC
plot(roc_curve, col = "blue", main = "ROC Curve", lwd = 2, legacy.axes = TRUE)

# הוספת קו אלכסוני (מודל אקראי להשוואה)
abline(a = 0, b = 1, col = "red", lty = 2)