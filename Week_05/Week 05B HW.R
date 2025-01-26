#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

load("df.rdataHW5A")

library(tidyverse)
library(dplyr)
library(ggdist)
#library(ggpubr)

####DESCRIPTIVE STATISTICS----
df <- data
summary(df)

df |>
  group_by(gender) |> 
  summarise(n(), 
            min_age = min(age), 
            max_age = max(age), 
            mean_age = mean(age), 
            sd_age = sd(age)
  )

group <-factor(sample(c("Clinical", "Control")))
treatment <- factor(sample(c("TMS", "Placebo")))
memory_score = rnorm(N, 50, 30)

data <- data.frame(group, treatment, memory_score)  # יצירת מסגרת נתונים
head(data)

#שיטה #1

df_summary <- data |>
  group_by(group, treatment) |>
  summarise(
    mean_memory_score = mean(memory_score, na.rm = TRUE),  # חישוב ממוצע
    sd_memory_score = sd(memory_score, na.rm = TRUE)  # חישוב סטיית תקן
  )

print(df_summary)  # הצגת התוצאות

#שיטה 1

library(ggplot2)
ggplot(data = df_summary, aes(x = group, y = mean_memory_score, color = treatment)) +
  geom_point(size = 3) +
  geom_errorbar(aes(
    ymin = mean_memory_score - sd_memory_score,  # ממוצע פחות סטיית התקן
    ymax = mean_memory_score + sd_memory_score  # ממוצע פלוס סטיית התקן
  ),
  width = 0.2,  # רוחב קווי השגיאה
  size = 0.8    # עובי הקווים
  ) +
  geom_point(data = data, aes(x = group, y = memory_score, color = treatment), alpha = 0.5, size = 2, inherit.aes = FALSE) +
  facet_wrap(~ treatment) +
  labs(
    title = "ממוצעים של ציון זיכרון לפי טיפול וקבוצה",
    x = "קבוצה",
    y = "ממוצע של ציון זיכרון"
) +
  theme_minimal()



# שימוש ב-ggerrorplot
library(ggpubr)
ggerrorplot(
  df_summary, 
  x = "group", 
  y = "mean_memory_score", 
  desc_stat = "mean_sd",  # מציין שמדובר בממוצע וסטיית תקן
  error.plot = "errorbar", 
  add = "mean", 
  color = "group"  # צבע לפי קבוצה
)

# היסטוגרמה
gghistogram(data, x = "memory_score", 
            add = "density", 
            fill = "group", 
            bins = 30)

# עקומת צפיפות
ggdensity(data, x = "dmemory_score", 
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






#שיטה #2
df_summary <- df |>
  group_by(group, treatment) |>
  summarise(
    mean = mean(memory_score),
    se   = sd(memory_score) / sqrt(n()),
  )


ggplot(df, aes(x = group, y = memory_score, color = treatment)) +
  
  geom_jitter(position = position_jitter(width = 0.2, height = 0), size = 1, alpha = 0.3) +
  geom_point(data = df_summary, aes(x = group, y = mean, group = treatment, color = treatment), 
             position = position_dodge(1), size = 4) +
  geom_errorbar(data = df_summary,aes(x = group, y = mean, group = treatment, ymin = mean - se, ymax = mean + se, color = treatment ), 
                position = position_dodge(1), width = 0.2
  ) +
  theme_minimal() 


#use ggpubr
ggerrorplot(df,  x = "group",   y = "memory_score",   color = "treatment",  desc_stat = "mean_se",
            add = "jitter",  add.params = list(alpha = 0.2), position = position_dodge(1)) +
  theme_minimal()

#save
save(df, file = "df.rdataHW5B")

