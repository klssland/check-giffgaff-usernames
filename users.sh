#!/bin/bash

# File containing the list of usernames to check
usernames_file="usernames.txt"

# Check if the file exists
if [[ ! -f "$usernames_file" ]]; then
    echo "File $usernames_file not found!"
    exit 1
fi

# Loop through each username in the file and check its availability
while IFS= read -r username; do
    # URL to check nickname availability
    url="https://www.giffgaff.com/ajax-helper/nickname-available?json=1&nickname=$username"

    # Use curl to fetch the URL
    response=$(curl -s "$url")

    # Print the response
    echo "Is username $username available? $response"
done < "$usernames_file"
