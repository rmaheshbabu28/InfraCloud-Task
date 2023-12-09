#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <start_index> <end_index>"
  exit 1
fi

# Extract start and end indices from command line arguments
start_index="$1"
end_index="$2"

# Specify the output file
output_file="inputFile"

# Initialize the index variable
current_index="$start_index"

# Generate CSV content using a while loop
while [ "$current_index" -le "$end_index" ]; do
  echo "$current_index, $RANDOM" >> "$output_file"
  ((current_index++))
done

echo "CSV file '$output_file' generated successfully."

