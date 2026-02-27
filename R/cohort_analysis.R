# Minimal cohort-like analysis on a tiny synthetic dataset
suppressWarnings(suppressMessages(library(dplyr)))

df <- data.frame(
  user_id = c(1,1,2,2,3,3),
  month = as.Date(c("2025-01-01","2025-02-01","2025-01-01","2025-03-01","2025-02-01","2025-03-01")),
  stringsAsFactors = FALSE
)

cohort <- df %>%
  group_by(user_id) %>%
  summarise(cohort_month = min(month)) %>%
  left_join(df, by="user_id") %>%
  mutate(month_index = as.integer((as.POSIXlt(month)$mon - as.POSIXlt(cohort_month)$mon) +
                                  12*(as.POSIXlt(month)$year - as.POSIXlt(cohort_month)$year)))

print(cohort)
