#!/bin/bash

# The goal of this bash script is to analyze the SARS-CoV-2 sequence data
# provided by NCBI, released in October 2021. We want to observe the the
# number of sequences from each country and sort the output size from largest
# to smallest.

# Sarah Hingorani
# svhingorani2@dons.usfca.edu
# November 1, 2021

# Use defensive programming for script

if [ $# -eq 0 ]
then
	echo "To run this script, please include the arguments necessary."
	echo "The first argument is a pathway to the compressed sequence dataset."
	echo "Next, include 'ALL' if you would like more detailed output."
	exit 1
fi

# Make sure only one arugment is used
if [ $# -gt 1 ]
then
	echo "Only one argument is needed."
	exit 1
fi

# Count the number of sequences in the entire file.
if [ "$2" = 'ALL' ]
then
	echo "The total number of sequences is:" 
 bioawk -c fastx '{print $name $comment}' "$1" | wc -l
fi

# Tally the number of sequences, sorting them from largest to smallest
bioawk -c fastx '{print $comment}' "$1" | awk '{split($0,x,"|");print x[21]}' | sort | uniq -c | sort -nr
