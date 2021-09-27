# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from New York
# and then write out a csv file that only has that subset

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# September 6, 2021

# read in the complete csv file
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-09-05.csv")

# subset the dataset to only include rows where the sub.region column has
# "New York" in it but we want all columns.

new_york_data <- all_covid_data[all_covid_data$sub.region == "New York",]

# save the New York data to a new csv file in the output directory
write.csv(new_york_data, file = "output/new_york_apple_mobility_data.csv")
