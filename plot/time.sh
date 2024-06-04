#!/usr/bin/env bash

outputFile=${1/txt/csv}
# echo test_name, run_time, unit
# echo test_name, run_time, unit > $outputFile
# cat "$1" | grep -E "^│ (l|o)" | awk '{gsub(/_/, "", $4); gsub(/lumberhack/, "fused", $2); gsub(/_nofib/, "", $2); match($4, /[a-z]+/); print $2", "($4+0.0)", "substr($4, RSTART, RLENGTH)}'
# cat "$1" | grep -E "^│ (l|o)" | awk '{gsub(/_/, "", $4); gsub(/lumberhack/, "fused", $2); gsub(/_nofib/, "", $2); match($4, /[a-z]+/); print $2", "($4+0.0)", "substr($4, RSTART, RLENGTH)}' >> $outputFile


# echo test_name, run_time, unit, n95ci, p95ci
# echo test_name, run_time, unit, n95ci, p95ci > $outputFile
# cat "$1" | grep -E "^│ (l|o)" | awk '{gsub(/_/, "", $6); gsub(/lumberhack/, "fused", $2); gsub(/_nofib/, "", $2); match($6, /[a-z]+/); print $2", "($6+0.0)", "substr($6, RSTART, RLENGTH)", "($8+0.0)", "($9+0.0)}'
# cat "$1" | grep -E "^│ (l|o)" | awk '{gsub(/_/, "", $6); gsub(/lumberhack/, "fused", $2); gsub(/_nofib/, "", $2); match($6, /[a-z]+/); print $2", "($6+0.0)", "substr($6, RSTART, RLENGTH)", "($8+0.0)", "($9+0.0)}' >> $outputFile


echo test_name, run_time, unit, n95ci, p95ci, minor, major, promotion
echo test_name, run_time, unit, n95ci, p95ci, minor, major, promotion > $outputFile
cat "$1" | grep -E "^│ (l|o)" | awk '{gsub(/_/, "", $6); gsub(/lumberhack/, "fused", $2); gsub(/_nofib/, "", $2); match($6, /[a-z]+/); print $2", "($6+0.0)", "substr($6, RSTART, RLENGTH)", "($8+0.0)", "($9+0.0)", "$11", "$13", "$15}'
cat "$1" | grep -E "^│ (l|o)" | awk '{gsub(/_/, "", $6); gsub(/lumberhack/, "fused", $2); gsub(/_nofib/, "", $2); match($6, /[a-z]+/); print $2", "($6+0.0)", "substr($6, RSTART, RLENGTH)", "($8+0.0)", "($9+0.0)", "$11", "$13", "$15}' >> $outputFile

./time.R $outputFile