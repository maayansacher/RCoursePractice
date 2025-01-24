#Ctrl + Shift + F10 to restart the R session (clear workspace and packages)
#Ctrl + L to clear the console.

library(tidyverse)
library(dplyr)
load("df.rdata")

####DESCRIPTIVE STATISTICS ----
#use base package
names(df)
range(df$age)
length(df$subject)
table(df$gender)
mean(df$sleep_duration)
median(df$sleep_duration)
mean(df$iq)
median(df$iq)
mean(df$depression)


#use tidyverse
df = df |> 
  mutate(depression = as.numeric(depression)-1) |>
  mutate(depression = depression * 100) #לא הבנתי איך אני יכולה להכפיל את הפקטור, כי הרי זה כמו ערך קטגוריאלי כרגע
df |>
  group_by(gender) |> 
  summarise(n(), mean(sleep_duration), mean(iq), mean(depression))


####PLOT IQ----

#use ggplot to create a scatter plot 
library(ggplot2)
library(ggdist)

ggplot(df, aes(x = sleep_duration, fill = factor(depression, levels = c(0,100), labels = c('no', 'yes')))) +
  stat_halfeye(
    adjust = 0.5, 
    justification = -0.2,
    .width = c(0.5, 0.8, 0.95),
    point_interval = mean_qi,
    slab_alpha = 0.8
  ) +
  
  geom_jitter(
    width = 0.1,
    alpha = 0.5
  ) +
  
  geom_boxplot(
    width = 0.15,
    outlier.shape = NA, 
    alpha = 0.5
  ) +
  
  theme_classic() +
  labs(
    title = "Raincloud Plot: Distribution of Sleep Duration Per Depression", 
    x = "Depressed", 
    y = "Sleep Duration", 
    fill = "Depression Status"
  ) +
  scale_fill_manual(values = c("Depressed" = "skyblue", "Control" = "orange")) #זה לא עשה לי את הצבעים - רק הראה לי דיכאון

#save
save(df, file = "df.rdata02")


###פתרון ----
#### CREATE DATAFRAME ----

#generate vectors
N = 100
subject        = seq(1, N, 1)
gender         = factor(sample(c('female', 'male'), N, replace = T))
sleep_duration = rnorm(N, mean = 7, sd = 1.5)
age            = runif(N, 15, 40)
iq             = rnorm(N,100,15)  
depression     = rbinom(N, 1, 0.5)    

gender     = factor(x)
depression = factor(depression, labels = c('Control', 'Depressed'))

#add to data.frame
df <- data.frame(subject, gender , age, iq, sleep_duration, depression)

#save
save(df, file = "df.rdata02")
library(tidyverse)
library(ggdist)
load("df.rdata")

#### DESCRIPTIVE STATISTICS ----

summary(df)
df |> group_by(gender) |> mutate(depression = as.numeric(depression)-1) |> summarize(mean(depression))

#> subject          gender           age              iq         sleep_duration     depression
#> Min.   :  1.00   female:51   Min.   :15.05   Min.   : 65.77   Min.   : 2.323   Control  :45  
#> 1st Qu.: 25.75   male  :49   1st Qu.:20.52   1st Qu.: 87.86   1st Qu.: 5.774   Depressed:55  
#> Median : 50.50               Median :27.10   Median : 99.78   Median : 6.843                 
#> Mean   : 50.50               Mean   :27.18   Mean   : 99.64   Mean   : 6.869                 
#> 3rd Qu.: 75.25               3rd Qu.:33.22   3rd Qu.:108.92   3rd Qu.: 7.823                 
#> Max.   :100.00               Max.   :39.48   Max.   :146.00   Max.   :11.491          



#hist for sleep duration
ggplot(df, aes(x = sleep_duration, fill = depression)) +
  stat_halfeye(.width = c(0.7, 0.8, 0.9), color = "black",position = "dodgejust", alpha = 0.3) +
  xlim(0,15) + xlab('sleep duration') +
  ylab("sleep duration") +
  theme_classic()+
  theme(axis.ticks.y = element_blank(),
        axis.text.y = element_blank())
