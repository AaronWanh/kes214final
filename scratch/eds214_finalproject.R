library(tidyverse)
library(lubridate)

# Reading in each dataset
bq1_data <- read_csv("data/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("data/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("data/QuebradaCuenca3-Bisley.csv")
PRM_data <- read_csv("data/RioMameyesPuenteRoto.csv")

# Extracting relevant columns (date, concentrations, etc.)
relevant_bq1 <- bq1_data|> 
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-04-19") |>  # filtering for certain dates
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) |> 
  rename(K_bq1 = K, `NO3-N_bq1` = `NO3-N`, Mg_bq1 = Mg, Ca_bq1 = Ca, `NH4-N_bq1` = `NH4-N`)

relevant_bq2 <- bq2_data|> 
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-04-19") |>  # filtering for certain dates
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) |> 
  rename(K_bq2 = K, `NO3-N_bq2` = `NO3-N`, Mg_bq2 = Mg, Ca_bq2 = Ca, `NH4-N_bq2` = `NH4-N`)

relevant_bq3 <- bq3_data|> 
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-04-19") |>
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) |> 
  rename(K_bq3 = K, `NO3-N_bq3` = `NO3-N`, Mg_bq3 = Mg, Ca_bq3 = Ca, `NH4-N_bq3` = `NH4-N`)

relevant_PRM <- PRM_data|> select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) |> 
  rename(K_PRM = K, `NO3-N_PRM` = `NO3-N`, Mg_PRM = Mg, Ca_PRM = Ca, `NH4-N_PRM` = `NH4-N`)

# 9-week moving averages
# window_start
window_start = seq(ymd("1988-05-20"), ymd("1992-04-19"), by = "9 weeks")

# Graphing K vs. Date
relevant_bq1 |> 
  ggplot(
  mapping = aes(
    x = Sample_Date,
    y = K
  )
) +
  geom_line()


# LET"S SEE IF THIS MERGE CONFLICT WORKS # Moving averages example from EDS221 Day 10
# for (i in 1:(length(qs_smoothed$window_start))) {
#   # Set the start date
#   start_date <- qs_smoothed$window_start[i]
#   # Set the end date
#   end_date <- qs_smoothed$window_start[i] + 9   # 9 days after start date
#   # Finding K values to average
#   k_ranges <- qs_data$k_mgl[qs_data$sample_date >= start_date & qs_data$sample_date < end_date]
#   qs_smoothed$k_mgl[i] <- mean(k_ranges, na.rm = TRUE)
#   # Finding Mg values to average
#   mg_ranges <- qs_data$mg_mgl[qs_data$sample_date >= start_date & qs_data$sample_date < end_date]
#   qs_smoothed$mg_mgl[i] <- mean(mg_ranges,  na.rm = TRUE)
# }