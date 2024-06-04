#!/usr/bin/env bash

outputFile=${1/txt/csv}
echo test_name, which_one, object_file_size
echo test_name, which_one, object_file_size > $outputFile
cat "$1" | grep -E "^\w+, " | awk '{ gsub(/\.o/, "", $2); print $1" "$2" "($3+0) }'
cat "$1" | grep -E "^\w+, " | awk '{ gsub(/\.o/, "", $2); print $1" "$2" "($3+0) }' >> $outputFile

./size.R $outputFile