#### CREATE FILTERD DATA ----
load("./data/raw_data.rdata")

cat("Number of unique subjects:", length(unique(df$subject)))

# Remove NA 
df <- df |> filter(!is.na(rt))

# Remove RT outliers (below 300 or above 3000)
df <- df |> filter(rt >= 300 & rt <= 3000)

#check the percentage of remaining trials
df |>  group_by(subject) |> summarise(percentage = 1 - (n() / 400)) |>  print(n = Inf)

save(df, file = "./data/filtered_data.rdata")