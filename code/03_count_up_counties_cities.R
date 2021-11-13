# script goal: write a csv file of the transportation tallies of a subsetted
# state

# Sarah Hingorani
# September 26, 2021
# svhingorani2@dons.usfca.edu

# load the function
source("code/functions/subset_mobility_data_by_city_county_transportation.R")

tally_state_of_choice <- c("New York",
                            "Florida",
                            "Maryland",
                            "Illinois",
                            "Georgia",
                            "Hawaii",
                            "Texas")

# use a for loop to test the function
for (tallied_state in tally_state_of_choice) {
  state_of_choice <- tallied_state
  print(paste("Tally transportation data for", tallied_state))
}

# we would like to get a count of the number of cities and the number of
# counties in a given state that have driving mobility data. The input to this
# will be the output of the previous script, namely the state csv files that
# were already subsetted.

# load in the dataset from the previous script
input_file_name <- paste0("output/subsetted_states_wide/",
                          "applemobilitytrends-2021-09-18_New_York.csv")
state_data <- read.csv(input_file_name)
