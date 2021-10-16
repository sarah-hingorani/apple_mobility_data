# Analysis of Apple Mobility Data in the Era of COVID-19

Sarah Hingorani  
svhingorani2@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.

That data is available from the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some oof the tabular data. Eventually, it will also include use of ggplot2 to contextualize dataset.

### Change Log

* 2021-09-06: The data file was originally downloaded for analysis.
* 2021-09-20: a new version of the data was downloaded, and I also
worked to refactor the code to be more general and to allow for my state to be
subset from the larger file.
* 2021-09-27: Added second script to use dplyr to tally up the count of cities and counties in a given state that have data from the different transportation types, turned code into a function. 
* 2021-10-11: Add Rmd to drive entire analysis.
