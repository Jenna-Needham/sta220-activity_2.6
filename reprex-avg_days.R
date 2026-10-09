# reprex-avg_days.R
# Riley: the average days to close looks too low. Can anyone see why?

library(tidyverse)

claims_small <- tribble(
  ~claim_id, ~days_to_close,
  "X-001",               28,
  "X-002",               40,
  "X-003",               -1,
  "X-004",               -1
)

# I expected an average of 34 days, with half of the claims late.
# I get an average of 16.5 days and a share late of 0.25.
claims_small |>
  summarize(
    avg_days   = mean(days_to_close),
    share_late = mean(days_to_close > 30)
  )

# Load the packages 
library(tidyverse)

# Load the data
read_csv("data/2025_q1.csv")


# Inspect the data

dim(claims_small)
names(claims_small)
summary(claims_small)

# Create a new variable named late_limit to define the threshold for late claims

late_limit <- 30

# Recode to remove the -1 codes from the data
claims_small <- claims_small |>
  mutate(
    days_to_close = if_else(days_to_close < 0, NA_real_, days_to_close),
    late = days_to_close > late_limit
  )

claims_small

# Analyze the cleaned data 
claims_small |>
  summarize(
    avg_days   = mean(days_to_close, na.rm = TRUE),
    share_late = mean(late, na.rm = TRUE)
  )
