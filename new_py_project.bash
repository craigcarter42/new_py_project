#!/usr/bin/env bash
name=$@
null=""
template=$(<py_template.txt)

main() {
    final_name=$name.py
    if [ -e "$final_name" ]; then
        echo " -- file exists"
    else
    # Create empty file with name provided.
        touch "$final_name"
    # Copy template file into new file
        echo "$template" >> $final_name
    # Get path to file
        final_file_path=`pwd`/$final_name
        echo " -- new project:" $final_file_path
    # Save path to last project
        echo "$final_file_path" >> ./LAST
        open "$final_file_path"
	fi
}

if [ "$name" != "$null" ]; then
    for arg in "$@"
    do
        if [ "$arg" == "--rev" ]; then
            rev=$(<./LAST)
            rm "$rev"
        elif [ "$arg" == "--open" ]; then
            echo "new feature coming"
        else
            main
        fi
    done
else
    echo " -- no args found"
fi

