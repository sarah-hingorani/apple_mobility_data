# create a function to read the subsetted data files and change the wide data
# to long data, then write a csv script

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 29, 2021

convert_data_wide_to_long <- function(input_file_name) {

input_file_name <- paste0("output/subsetted_states_wide/",
                          "applemobilitytrends-2021-09-18_New_York.csv")

# load packages
library("dplyr")
library("tidyr")
library("readr")

# load subsetted data files
state_data_wide <- readr::read_csv(input_file_name)

# change from wide to long by using the tidyr function

state_data_long <- tidyr::pivot_longer(state_data_wide,
                                       cols = starts_with("202"),
                                       names_to = "date",
                                       values_to = "relative_mobility")

# save the long data set as a csv in the output directory
readr::write_csv(state_data_long, file = paste0("output/",
                                                 "subsetted_states_long/",
                                                 tools::file_path_sans_ext(
                                                 basename(input_file_name)),
                                                 "_",
                                                 "wide_to_long",
                                                 ".csv"))
return(state_data_long)
}
