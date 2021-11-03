# create a function to read the subsetted data files and change the wide data
# to long data, then write a csv script

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 29, 2021

convert_data_wide_to_long <- function(input_file_name, state_to_subset) {

  state_to_subset = "New York"

# load packages
library("dplyr")
library("tidyr")
library("readr")

# load subsetted data files
new_york <- readr::read_csv(paste0("output/subsetted_states_wide/",
                                   "applemobilitytrends-2021-09-25_New_York",
                                   ".csv"))

# ensure that spaces in between are replaced with a "_"
state_no_spaces <- gsub(state_to_subset, pattern = " ", replacement = "_")


# change from wide to long by using the tidyr function
state_data_long <- tidyr::pivot_longer(data = "new_york",
                                       cols = (starts_with("X2020")),
                                       names_to = "date",
                                       values_to = "relative_mobility")

# save the long data set as a csv in the output directory
readr::write_csv(state_data_long, file = paste0("output/",
                                                 "subsetted_states_long/",
                                                 tools::file_path_sans_ext(
                                                 basename(input_file_name)),
                                                 "_",
                                                 "wide_to_long",
                                                 state_no_spaces,
                                                 ".csv"))
return(state_data_long)
}
