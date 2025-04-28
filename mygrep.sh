#!/bin/bash

# Function to show usage
usage() {
    echo "Usage: $0 [-v] [-n] search_string file"
    echo "  -v    : Invert the match (show lines that do not match)"
    echo "  -n    : Show line numbers for each match"
    echo "  --help: Display this help message"
    exit 1
}

# Show usage if --help is passed
if [ "$1" == "--help" ]; then
    usage
fi

# Check if search string and file are provided
if [ $# -lt 2 ]; then
    echo "Error: Missing search string or file."
    usage
fi

# Handle options -v and -n
invert=0
line_numbers=0

while getopts "vn" opt; do
    case $opt in
        v)
            invert=1
            ;;
        n)
            line_numbers=1
            ;;
        *)
            usage
            ;;
    esac
done

# Get the search string and file
shift $((OPTIND - 1))
search_string=$1
file=$2

# Check if search string and file exist
if [ -z "$search_string" ]; then
    echo "Error: Search string is missing."
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found."
    exit 1
fi

# Search in the file with the given options
if [ $invert -eq 1 ]; then
    if [ $line_numbers -eq 1 ]; then
        grep -i -v -n "$search_string" "$file"
    else
        grep -i -v "$search_string" "$file"
    fi
else
    if [ $line_numbers -eq 1 ]; then
        grep -i -n "$search_string" "$file"
    else
        grep -i "$search_string" "$file"
    fi
fi
