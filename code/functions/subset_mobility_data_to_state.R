# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 20, 2021

# load dplyr
library("dplyr")

# create a function to subset any US state out of the full dataset
# this should also create an output CSV file that is named based on the state
# that is subsetted
subset_mobility_data_to_state <- function(input_file_name,
                                          state_to_subset) {
  # read in the complete csv file
  all_covid_data <- readr::read_csv(input_file_name)

  # subset the dataset to only include rows where the sub.region column has
  # the state name in it but we want all columns.
  state_subset <- all_covid_data %>%
    dplyr::filter('sub-region' = state_to_subset)

 # check that the subsetted data actually has data in it
  if (nrow(state_subset) == 0) {
    stop("ERROR, no rows matching given state name. Is there a typo?")
  }

   # save the state data to a new csv file in the output directory
  readr::write_csv(state_subset, file =  paste0("output/subsetted_states/",
                                       tools::file_path_sans_ext(
                                       basename(input_file_name)),
                                      "_",
                                      state_to_subset,
                                      ".csv"))
  return(state_subset)
  }
