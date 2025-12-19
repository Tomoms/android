#!/bin/bash

# Read the input XML file line by line
while IFS= read -r line; do
    # Check if the line contains the word "external" and does not contain "clone-depth"
    if [[ $line == *external* && $line != *clone-depth* ]]; then
        # Add clone-depth="1" right before the closing tag "/>"
        line=$(echo "$line" | sed 's/\(.*external.*\)\(\/>\)/\1clone-depth="1" \2/')
    fi
    # Print the modified or unmodified line
    echo "$line"
done < default.xml > default.xml.new
