# script goal: write a csv file of the transportation tallies of a subsetted
# state

# Sarah Hingorani
# September 26, 2021
# svhingorani2@dons.usfca.edu

# load the function
source("code/functions/subset_mobility_data_by_city_county_transportation.R")

# use a for loop to test the function

for (state_to_subset in c("New York", "Florida", "Maryland", "Illinois",
                          "Georgia", "Hawaii", "Texas")) {
subset_by_city_county(input_file_name = paste0("data/raw_data/",
                                        "applemobilitytrends-2021-09-18.csv"),
                                        state_to_subset)
}
