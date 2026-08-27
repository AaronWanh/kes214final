library(tidyverse)
library(lubridate)

source("R/moving-average.R")

# Reading in each dataset
bq1_data <- read_csv("raw_data/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("raw_data/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("raw_data/QuebradaCuenca3-Bisley.csv")
PRM_data <- read_csv("raw_data/RioMameyesPuenteRoto.csv")


# Extracting relevant columns (date range, concentrations, etc.)
relevant_bq1 <- bq1_data |>
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) 

relevant_bq2 <- bq2_data |>
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`)

relevant_bq3 <- bq3_data |>
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`)

relevant_PRM <- PRM_data |>
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`)


# Calling the moving_average function to get the tibble of average conc. for all watersheds
bq1_smoothed <- moving_average(relevant_bq1)
bq2_smoothed <- moving_average(relevant_bq2)
bq3_smoothed <- moving_average(relevant_bq3)
PRM_smoothed <- moving_average(relevant_PRM)

# Combining all four tibbles into one
combined_table <- rbind(bq1_smoothed, bq2_smoothed, bq3_smoothed, PRM_smoothed)

# Pivoting the large tibble longer
combined_table_long <- combined_table |>
  pivot_longer(
    cols = "k_mgl":"NH4_ugl",
    names_to = "Nutrient",
    values_to = "Concentration"
  )


write_csv(combined_table_long, "output/fig3_long.csv")