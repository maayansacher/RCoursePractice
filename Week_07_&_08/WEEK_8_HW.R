load("filtered_data.rdata")

library(ggplot2)

#average and sd by condition 
summary_descriptive_stat <- df |>
  group_by(congruency) |>
  summarise(
    mean_rt = mean(rt),
    sd_rt = sd(rt)
  )
print(summary_descriptive_stat)

ggplot(data = summary_descriptive_stat, aes(x = congruency, y = mean_rt)) +
  geom_bar(stat = "identity", fill = "orange") +
  geom_errorbar(aes(ymin = mean_rt - sd_rt, ymax = mean_rt + sd_rt)) +
  labs(
    title = "Average Response Time of Congruent v. Incongruent Responses",
    y = "Average Response Time",
    x = "Condition"
  ) +
  theme_classic()

