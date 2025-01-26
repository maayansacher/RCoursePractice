#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

load("df.rdataHW5B") #למה זה לא עשה לי לואדינג לשם של הקובץ עם  ב' בסוף? (הדף הקודם)

#ANOVA - Linear Model
data <- data.frame(group, treatment, memory_score)

contrasts(data$group) <- c(1,0)
contrasts(data$group)
contrasts(data$treatment)   # בדיקה של קידוד משתנה הקבוצה

# יצירת מודל רגרסיה פקטוריאלי עם אינטראקציה
model <- lm(memory_score ~ group * treatment, data = data)
model = lm(memory_score ~ group + treatment + group:treatment, data = data)
print(model)
summary(model)
model$coef

#save
save(df, file = "df.rdataHW5C")
