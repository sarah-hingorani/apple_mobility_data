# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset
# uses functions in the code/function directory

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 20, 2021

# load functions
source("code/functions/subset_mobility_data_to_state.R")

# make a vector to pick a state to subset
pick_a_state_to_subset <- c("New York",
                                   "Florida",
                                   "Maryland",
                                   "Illinois",
                                   "Georgia",
                                   "Hawaii",
                                   "Texas")

# create a for loop to output files with given state names
for (state_to_subset in c(pick_a_state_to_subset)) {
  x <- state_to_subset
  print(paste("The state chosen is", state_to_subset))

  state_to_subset <- subset_mobility_data_to_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-09-18.csv",
    state_to_subset = x)
  print(paste(x, "Subsetting data..."))
  print(paste(x, "Data is subsetted."))
  print("--")
}
