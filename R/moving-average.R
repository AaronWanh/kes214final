# Creating a function for moving averages

moving_average <- function(stream_data) {
  # Empty tibble for concentration averages
  result <- tibble(
    window_start = seq(ymd("1988-10-18"), ymd("1994-12-31"), by = "9 weeks"),
    k_mgl = NA,
    NO3_ugl = NA,
    mg_mgl = NA,
    ca_mgl = NA,
    NH4_ugl = NA
  )

  # Moving averages
  for (i in 1:(length(result$window_start))) {
    # Set the start date
    start_date <- result$window_start[i]
    # Set the end date
    end_date <- result$window_start[i] + 63 # 9 weeks after start date

    # Logical vector that says which samples are inside the window
    in_window <- stream_data$Sample_Date >= start_date & stream_data$Sample_Date < end_date

    # Calculate mean concentrations for K and filling in result
    k_ranges <- stream_data$K[in_window]
    result$k_mgl[i] <- mean(k_ranges, na.rm = TRUE)

    # Calculate mean concentrations for NO3 and filling in result
    NO3_ranges <- stream_data$`NO3-N`[in_window]
    result$NO3_ugl[i] <- mean(NO3_ranges, na.rm = TRUE)

    # Calculate mean concentrations for Mg and filling in result
    mg_ranges <- stream_data$Mg[in_window]
    result$mg_mgl[i] <- mean(mg_ranges, na.rm = TRUE)

    # Calculate mean concentrations for Ca and filling in result
    ca_ranges <- stream_data$Ca[in_window]
    result$ca_mgl[i] <- mean(ca_ranges, na.rm = TRUE)

    # Calculate mean concentrations for NH4 and filling in result
    NH4_ranges <- stream_data$`NH4-N`[in_window]
    result$NH4_ugl[i] <- mean(NH4_ranges, na.rm = TRUE)
  }

  return(result)
  
}
