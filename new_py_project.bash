#!/usr/bin/env bash
# Created by Craig Carter, box256 | 2018
name=$@
null=""
# Hard coded paths
path_to_xbn="/Users/admin/.xbn"
path_to_source="$path_to_xbn/npp/py_template.txt"
path_to_last="$path_to_xbn/npp"

if [ -e "$path_to_source" ]; then
# Load file to memory
    template=$(<"$path_to_source")
else
    echo " -- no source file found"
    exit
fi

main() {
    final_name=$name.py
    if [ -e "$final_name" ]; then
        echo " -- file exists"
    else
    # Create empty file with name provided.
        touch "$final_name"
    # Copy template file into new file
        echo "$template" >> "$final_name"
    # Get path to file
        final_file_path=`pwd`/$final_name
        echo " -- new project:" $final_file_path
    # Save path to last project
        echo "$final_file_path" > "$path_to_last/LAST"
        open "$final_file_path"
    fi
}

if [ "$name" != "$null" ]; then
    if [ "$1" == "--rev" ]; then
            rev=$(<"$path_to_last/LAST")
            rm "$rev"
        else
            main
    fi
else
    echo " -- no args found"
fi


