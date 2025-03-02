#!/bin/bash

# Get the full path to the directory the script is in
source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "The script is located in: $source_dir"
target_dir="$1"

echo "Working in $target_dir"

# the -z is an arg for the test commant, a.k.a. `[]`, to check "if str empty"
if [ -z "$target_dir" ]; then
    echo "Error: No target directory specified"
    exit 1
fi


py_files_to_clone=("pyproject.toml")

for file in "${py_files_to_clone[@]}"; do
    if [ -e "$source_dir/$file" ]; then
        cp "$source_dir/$file" "$target_dir/$file"
        echo "Copied $file to $target_dir"
    else
        echo "$source_dir/$file does not exist"
    fi
done
