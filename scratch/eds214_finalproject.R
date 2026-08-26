library(tidyverse)
library(lubridate)

# Reading in each dataset
bq1_data <- read_csv("1_raw_data/QuebradaCuenca1-Bisley.csv")
bq2_data <- read_csv("1_raw_data/QuebradaCuenca2-Bisley.csv")
bq3_data <- read_csv("1_raw_data/QuebradaCuenca3-Bisley.csv")
PRM_data <- read_csv("1_raw_data/RioMameyesPuenteRoto.csv")



# Extracting relevant columns (date, concentrations, etc.)
relevant_bq1 <- bq1_data|> 
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>  # filtering for certain dates
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) #|> 
  #rename(K_bq1 = K, `NO3-N_bq1` = `NO3-N`, Mg_bq1 = Mg, Ca_bq1 = Ca, `NH4-N_bq1` = `NH4-N`)

relevant_bq2 <- bq2_data|> 
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>  # filtering for certain dates
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) #|> 
  #rename(K_bq2 = K, `NO3-N_bq2` = `NO3-N`, Mg_bq2 = Mg, Ca_bq2 = Ca, `NH4-N_bq2` = `NH4-N`)

relevant_bq3 <- bq3_data|> 
  filter(Sample_Date >= "1988-10-18" & Sample_Date <= "1994-12-31") |>
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) #|> 
  #rename(K_bq3 = K, `NO3-N_bq3` = `NO3-N`, Mg_bq3 = Mg, Ca_bq3 = Ca, `NH4-N_bq3` = `NH4-N`)

relevant_PRM <- PRM_data|> 
  select(Sample_ID, Sample_Date, K, `NO3-N`, Mg, Ca, `NH4-N`) #|> 
  #rename(K_PRM = K, `NO3-N_PRM` = `NO3-N`, Mg_PRM = Mg, Ca_PRM = Ca, `NH4-N_PRM` = `NH4-N`)


# Combining each watershed's data frame into one
fig3_data <- bind_rows(relevant_bq1, relevant_bq2, relevant_bq3, relevant_PRM)


# Manipulating the data frame
fig_3_long <- fig3_data |>
  pivot_longer(
    cols = "K":"NH4-N",
    names_to = "Nutrient",
    values_to = "Concentration"
)
fig_3_long

# Plotting time series of concentrations for each ion
ggplot(
  data = fig_3_long,
  mapping = aes(
    x = Sample_Date,
    y = Concentration,
    color = Sample_ID
  )
) +
  geom_line() +
  facet_wrap(~Nutrient, scales = "free")


# Empty tibble for concentration averages
bq1_smoothed <- tibble(
  window_start = seq(ymd("1988-10-18"), ymd("1994-12-31"), by = "9 weeks"),
  k_mgl = NA,
  NO3_ugl = NA,
  mg_mgl = NA,
  ca_mgl = NA,
  NH4_ugl = NA
)

# FINDING AVGS FOR BQ1
for (i in 1:(length(bq1_smoothed$window_start))) {
  # Set the start date
  start_date <- bq1_smoothed$window_start[i]
  # Set the end date
  end_date <- bq1_smoothed$window_start[i] + 63   # 9 weeks after start date

  # Finding K values to average
  k_ranges <- relevant_bq1$K[relevant_bq1$Sample_Date >= start_date & relevant_bq1$Sample_Date < end_date]
  bq1_smoothed$k_mgl[i] <- mean(k_ranges, na.rm = TRUE)

  # Finding NO3 values to average
  NO3_ranges <- relevant_bq1$`NO3-N`[relevant_bq1$Sample_Date >= start_date & relevant_bq1$Sample_Date < end_date]
  bq1_smoothed$NO3_ugl[i] <- mean(NO3_ranges, na.rm = TRUE)

  # Finding Mg values to average
  mg_ranges <- relevant_bq1$Mg[relevant_bq1$Sample_Date >= start_date & relevant_bq1$Sample_Date < end_date]
  bq1_smoothed$mg_mgl[i] <- mean(mg_ranges, na.rm = TRUE)

  # Finding Ca values to average
  ca_ranges <- relevant_bq1$Ca[relevant_bq1$Sample_Date >= start_date & relevant_bq1$Sample_Date < end_date]
  bq1_smoothed$ca_mgl[i] <- mean(ca_ranges, na.rm = TRUE)

  # Finding NH4 values to average
  NH4_ranges <- relevant_bq1$`NH4-N`[relevant_bq1$Sample_Date >= start_date & relevant_bq1$Sample_Date < end_date]
  bq1_smoothed$NH4_ugl[i] <- mean(NH4_ranges, na.rm = TRUE)
}


# Reshape columns to long format
bq1_smoothed_long <- bq1_smoothed |> 
  pivot_longer(
    cols = c(k_mgl, NO3_ugl, mg_mgl, ca_mgl, NH4_ugl), # Columns to plot as Y
    names_to = "nutrient",      # Column holding the original column names
    values_to = "value"         # Column holding the actual numbers
  )


# Plot the data
bq1_smoothed_long |> 
  ggplot(
    aes(
      x = window_start, 
      y = value, 
      color = nutrient)) +
  geom_line() +
  labs(title = "BQ1 Nutrient Concentrations with 9-week Moving Average", y = "Concentration", x = "Years") +
  facet_wrap(~nutrient, scales = "free")
















# Graphing K vs. Date
# relevant_bq1 |> 
#   ggplot(
#   mapping = aes(
#     x = Sample_Date,
#     y = K
#   )
# ) +
#   geom_line()


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