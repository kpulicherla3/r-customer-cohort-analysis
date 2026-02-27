suppressWarnings(suppressMessages(library(dplyr)))

df <- data.frame(
  user_id = c(1,1,2,2,3,3),
  month = as.Date(c("2025-01-01","2025-02-01","2025-01-01","2025-03-01","2025-02-01","2025-03-01"))
)

cohort <- df %>%
  group_by(user_id) %>%
  summarise(cohort_month = min(month), .groups="drop") %>%
  left_join(df, by="user_id")

print(cohort)
