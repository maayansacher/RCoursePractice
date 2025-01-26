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