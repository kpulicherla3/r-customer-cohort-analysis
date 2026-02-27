# r-customer-cohort-analysis

This repository contains a focused, production-style project demonstrating practical skills in data engineering, analytics, and platform engineering.

## Scope
- Clear project structure
- Emphasis on correctness and maintainability
- Incremental improvements tracked via pull requests

## How to use
See project-specific documentation in the `docs/` directory or repository root.

## Status
Active development.

## Chart output
Generate a reproducible cohort chart with:

```bash
Rscript R/cohort_analysis.R
```

This writes `docs/cohort_counts.png`.
For reproducibility, the script also writes `docs/cohort_counts.csv` with the plotting data.
