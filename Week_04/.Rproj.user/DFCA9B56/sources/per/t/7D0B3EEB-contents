###יצירת פונציה עם תני לגבי סוג המשתנה----
load("df.rdataHW09A")
describe_data <- function(df) {
  results <- list()
  
  for (col_name in colnames(df)) {
    column <- df[[col_name]]
    
    if (class(column) %in% c("factor", "character")) {
      # חישוב שכיחות הרמות (frequency)
      level_counts <- as.data.frame(table(column))
      colnames(level_counts) <- c("Level", "Count")  # שמות העמודות
      results[[col_name]] <- level_counts  # שמירה ברשימת התוצאות
      
    } else if (class(column) %in% c("numeric", "integer")) {
      # חישוב סטטיסטיקה תיאורית למשתנים רציפים
      stats <- data.frame(
        Min = min(column, na.rm = TRUE),
        Max = max(column, na.rm = TRUE),
        Mean = mean(column, na.rm = TRUE),
        SD = sd(column, na.rm = TRUE)
      )
      results[[col_name]] <- stats  # שמירה ברשימת התוצאות
    }
  }
  
  # החזרת התוצאות כ-Data Frame
  return(results)
}

describe_data(df)

source("functions.R")

results <- describe_data(df)

results

print(results)


#IF i WANT IT TO BE IN A SINGLE DATAFRAME - DESPITE IT HAVING DIFFERENT TYPES OF VARIABLES
# # פונקציה ליצירת Data Frame עם סטטיסטיקה תיאורית
# describe_data <- function(df) {
#   # יצירת Data Frame ריק שיאגור את התוצאות
#   results <- data.frame(
#     Variable = character(),
#     Type = character(),
#     Min = numeric(),
#     Max = numeric(),
#     Mean = numeric(),
#     SD = numeric(),
#     Levels = character(),
#     Counts = character(),
#     stringsAsFactors = FALSE
#   )
#   
#   # לולאה שעוברת על כל המשתנים
#   for (col_name in colnames(df)) {
#     # שליפת המשתנה (עמודה) לפי שם
#     column <- df[[col_name]]
#     
#     # משתנה קטגוריאלי
#     if (class(column) %in% c("factor", "character")) {
#       # חישוב שכיחות הרמות
#       level_counts <- paste(levels(factor(column)), table(column), sep = ": ", collapse = "; ")
#       
#       # הוספת השורה ל-Data Frame
#       results <- rbind(results, data.frame(
#         Variable = col_name,
#         Type = "Categorical",
#         Min = NA,
#         Max = NA,
#         Mean = NA,
#         SD = NA,
#         Levels = paste(levels(factor(column)), collapse = ", "),
#         Counts = level_counts,
#         stringsAsFactors = FALSE
#       ))
#     } 
#     
#     # משתנה רציף
#     else if (class(column) %in% c("numeric", "integer")) {
#       # חישוב סטטיסטיקות תיאוריות
#       results <- rbind(results, data.frame(
#         Variable = col_name,
#         Type = "Continuous",
#         Min = min(column, na.rm = TRUE),
#         Max = max(column, na.rm = TRUE),
#         Mean = mean(column, na.rm = TRUE),
#         SD = sd(column, na.rm = TRUE),
#         Levels = NA,
#         Counts = NA,
#         stringsAsFactors = FALSE
#       ))
#     }
#   }
#   
#   # החזרת ה-Data Frame
#   return(results)
# }
# describe_data(df)

####הוספת תנאי: אם הנתונים כוללים פחות מ-10 תצפיות הפונקציה מחזירה הודעת שגיאה "data is too short"----
describe_data <- function(df) {
  if (nrow(df) < 10) {
    stop("data is too short") #תנאי שבו אם הנתונים כוללים פחות מ-10 תצפיות הפונקציה מחזירה הודעת שגיאה "data is too short"
  }
  results <- list()
  
  for (col_name in colnames(df)) {
    column <- df[[col_name]]
    
    if (class(column) %in% c("factor", "character")) {
      # חישוב שכיחות הרמות (frequency)
      level_counts <- as.data.frame(table(column))
      colnames(level_counts) <- c("Level", "Count")  # שמות העמודות
      results[[col_name]] <- level_counts  # שמירה ברשימת התוצאות
      
    } else if (class(column) %in% c("numeric", "integer")) {
      # חישוב סטטיסטיקה תיאורית למשתנים רציפים
      stats <- data.frame(
        Min = min(column, na.rm = TRUE),
        Max = max(column, na.rm = TRUE),
        Mean = mean(column, na.rm = TRUE),
        SD = sd(column, na.rm = TRUE)
      )
      results[[col_name]] <- stats  # שמירה ברשימת התוצאות
    }
  }
  
  # החזרת התוצאות כ-Data Frame
  return(results)
}

describe_data(df)

source("functions.R")

results <- describe_data(df)

results

print(results)

####הוספת תנעי- ####עוד הוספה של תאני: לפלוט את הסטטיסטיקה התאורית רק עבור נבדקים בטווח המוגדר על ידי מספר הנבדקים שניתנו----
describe_data <- function(df, subject_start, subject_end) {
  if (nrow(df) < 10) {
    stop("data is too short") #תנאי שבו אם הנתונים כוללים פחות מ-10 תצפיות הפונקציה מחזירה הודעת שגיאה "data is too short"
  }
  df <- df[df$subject >= subject_start & df$subject <= subject_end, ]
  
  if (nrow(df) == 0) {
    stop("No data in the specified range of subjects")
  }
  
  results <- list()
  
  for (col_name in colnames(df)) {
    column <- df[[col_name]]
    
    if (class(column) %in% c("factor", "character")) {
      # חישוב שכיחות הרמות (frequency)
      level_counts <- as.data.frame(table(column))
      colnames(level_counts) <- c("Level", "Count")  # שמות העמודות
      results[[col_name]] <- level_counts  # שמירה ברשימת התוצאות
      
    } else if (class(column) %in% c("numeric", "integer")) {
      # חישוב סטטיסטיקה תיאורית למשתנים רציפים
      stats <- data.frame(
        Min = min(column, na.rm = TRUE),
        Max = max(column, na.rm = TRUE),
        Mean = mean(column, na.rm = TRUE),
        SD = sd(column, na.rm = TRUE)
      )
      results[[col_name]] <- stats  # שמירה ברשימת התוצאות
    }
  }
  
  # החזרת התוצאות כ-Data Frame
  return(results)
}

results <- describe_data(df, subject_start = 10, subject_end = 100) #am I missing the argument "subject_start" because it was not in my analysis file's variables?
print(results)
describe_data(df)
View(results)

source("functions.R")

results <- describe_data(df)

results

print(results)

#save
save(data, file = "df.rdataHW09B")