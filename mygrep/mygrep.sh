#!/bin/bash
# we running this script with bash

# script variables

show_line_numbers=false # to show line number or not for matches string
invert_match=false # to print lines that do not match the search string
found_match=false # track if any match found

# help function to display usage of the script
# this function will be called when -h option is used or no args provided
print_help() {
    echo "Used to search for a string in a file"
    echo "Usage: $0 [OPTIONS] search_string path_to_file"
    echo "Options:"
    echo "  -n   Show line numbers for matches"
    echo "  -v   Invert match (show lines that do NOT contain the search string)"
    echo "  -h   Show this help message"
    exit 0
}

# if no arguments provided
if [[ $# -eq 0 ]]; then 
    echo "Error: No arguments given."
    print_help
    exit 1 
fi 

# Use getopts to parse options (-n, -v, -h)
while getopts ":nvh" opt; do
    case $opt in
        n) 
            show_line_numbers=true
            ;;
        v)
            invert_match=true
            ;;
        h)
            print_help
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            exit 1
            ;;
    esac
done

# Shift positional parameters to remove parsed options
shift $((OPTIND - 1))

# Take search_string and filename 
search_string="$1"
filename="$2"

# Ensure search string and filename are provided
if [[ -z "$search_string" ]]; then
    echo "Error: Missing search string."
    exit 1 
fi 

if [[ -z "$filename" ]]; then
    echo "Error: Missing filename."
    exit 1 
fi

# Check if the file exists
if [[ ! -f "$filename" ]]; then
    echo "Error: File '$filename' not found."
    exit 1 
fi

# Read the file line by line and search for the string
current_line_number=0
while IFS= read -r line; do 
    ((current_line_number++))
    
    # Convert both the line and search string to lowercase for case-insensitive matching
    lower_line="${line,,}"          # Convert line to lowercase
    lower_search="${search_string,,}" # Convert search string to lowercase
    
    # Perform the case-insensitive match
    if [[ "$lower_line" == *"$lower_search"* ]]; then
        match=true
    else 
        match=false
    fi 

    # Handle -v (invert match) logic
    if { $match && ! $invert_match; } || { ! $match && $invert_match; }; then 
        found_match=true
        if $show_line_numbers; then 
            echo "${current_line_number}:$line"
        else 
            echo "$line"
        fi
    fi
done < "$filename"

# If no matches found, print a message
if ! $found_match; then
    echo "No matching lines found."
fi

# Script ends here