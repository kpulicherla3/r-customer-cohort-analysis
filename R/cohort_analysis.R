suppressWarnings(suppressMessages(library(ggplot2)))

cohorts <- data.frame(
  cohort_month = as.Date(c("2025-01-01", "2025-02-01", "2025-03-01")),
  users = c(2, 1, 0)
)
cohorts <- cohorts[order(cohorts$cohort_month), , drop = FALSE]

plot_dir <- "docs"
dir.create(plot_dir, recursive = TRUE, showWarnings = FALSE)

p <- ggplot(cohorts, aes(x = cohort_month, y = users)) +
  geom_col(fill = "#2C7FB8") +
  labs(
    title = "Users by Cohort Month",
    x = "Cohort Month",
    y = "Users"
  ) +
  theme_minimal()

plot_path <- file.path(plot_dir, "cohort_counts.png")
ggsave(plot_path, plot = p, width = 7, height = 4, dpi = 150, device = "png", bg = "white")
cat("Saved plot to", plot_path, "\n")

# Reproducibility helper: persist the exact plotting data used for the chart.
data_path <- file.path(plot_dir, "cohort_counts.csv")
write.csv(cohorts, data_path, row.names = FALSE)
cat("Saved data to", data_path, "\n")
