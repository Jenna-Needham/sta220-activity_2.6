# Load packages and data

library(tidyverse)
claims <- read_csv("data/2025_q1.csv")


# Check data

# We expect 48 rows (claims) and 4 columns.
dim(claims)
names(claims)
summary(claims)

# Company policy says claims should close within 30 days.
close_limit <- 30

# Clean

# Step 1: Identify claims coded -1 as still open.
# Step 2: Replace -1 with NA because those claims do not yet have a closing time.
# Step 3: Identify closed claims that took more than 30 days.

claims_clean <- claims |>
  mutate(
    still_open = days_to_close == -1,
    days_to_close = ifelse(days_to_close == -1, NA, days_to_close),
    late = days_to_close > close_limit
  )


# Analyze

claim_summary <- claims_clean |>
  group_by(claim_type) |>
  summarize(
    claims = n(),
    still_open = sum(still_open),
    avg_days = mean(days_to_close, na.rm = TRUE),
    share_late = mean(late, na.rm = TRUE)
  )

claim_summary

# Save cleaned data

write_csv(claims_clean, "output/2025_q1_clean.csv")
