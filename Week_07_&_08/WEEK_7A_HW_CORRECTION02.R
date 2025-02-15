# R course for beginners 
# Week 7
# Assignment by Maayan Sacher, ID 302308283

#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

#### CREATE RAW DATA ----
install.packages(dplyr)
library(dplyr)

# combine files to one df
files_names = dir("./data.stroop")

df = data.frame()

for (file in files_names) {
  df <- rbind(df, read.csv(paste0("./data.stroop/",file)))
}

# take only the columns we need
df <- df |>
  mutate(
    task       = ifelse(grepl("ink_naming", condition), "ink_naming", "word_reading"),
    congruency = ifelse(grepl("incong", condition), "incongruent", "congruent"),
    acc        = ifelse(participant_response == correct_response, 1, 0)
  ) |>
  
  mutate(
    subject    = as.factor(subject),
    task       = as.factor(task),
    congruency = as.factor(congruency),
    block      = as.numeric(block),
    trial      = as.numeric(trial),
    acc        = as.numeric(acc),
    rt         = as.numeric(rt)
  ) |>
  
  select(subject, block, trial, task, congruency, participant_response, correct_response, acc, rt)

summary(df)

#check factors
contrasts(df$task)<-c(1,0)
contrasts(df$task)
contrasts(df$congruency)

save(df, file = "raw_data.rdata")
