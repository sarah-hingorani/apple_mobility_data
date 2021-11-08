# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state, then
# tally the transportation data type by city/county, and write it as a csv

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 26, 2021

# load dplyr package
library("dplyr")

# create a function to subset any US state out of the full dataset
# this should also create an output CSV file that is named based on the state
# that is subsetted
subset_by_city_county <- function(input_file_name, state_to_subset) {

  # For your input_file_name value, type out your desired dataset in the
  # RStudio console. The same applies for the state you are interested in for
  # your state_to_subset value.

  # read in the subsetted csv file
  tallied_data <- readr::read_csv(input_file_name)

  # make sure that there are no spaces between names if applicable
  state_no_spaces <- gsub(state_to_subset, pattern = " ", replacement = "_")

  # subset the dataset to only include rows where the sub.region column has
  # the state name in it but we want all columns.
  count_cities_counties_by_type <- tallied_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # check that the subsetted data actually has data in it
  if (nrow(tallied_data) == 0) {
    stop("ERROR, no rows matching given state name. Is there a typo?")
  }

  # save the state data to a new csv file in the output directory
  readr::write_csv(tallied_data, file =  paste0("output/",
                                              "subsetted_states_tallied/",
                                       tools::file_path_sans_ext(
                                         basename(input_file_name)),
                                       "_",
                                       state_no_spaces,
                                       ".csv"))
  return(count_cities_counties_by_type)
}
