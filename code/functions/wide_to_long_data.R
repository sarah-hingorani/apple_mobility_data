# create a function to read the subsetted data files and change the wide data
# to long data, then write a csv script

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 29, 2021

convert_mobility_data_wide_to_long <- function(input_file_name) {


# load subsetted data files
new_york_data <- readr::read_csv(paste0("output/subsetted_states/",
                                 "applemobilitytrends-2021-09-18_New York.csv"))

# change from wide to long by using the tidyr function
state_data_long <- tidyr::pivot_longer(data = "new_york_data",
                                       cols = (startsWith("X2020")),
                                       names_to = "date",
                                       values_to = "relative_mobility")

# save the long data set as a csv in the output directory
readr::write_csv(state_data_long, file = paste0("output/",
                                                 "subsetted_states/",
                                                 tools::file_path_sans_ext(
                                                 basename(input_file_name)),
                                                 "_",
                                                 "wide_to_long",
                                                 ".csv"))
}
