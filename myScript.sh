#!/bin/bash 
echo "Start of the script"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "Contents of Automobiles.txt"
cat -n /app/Automobiles.txt

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
sort -f /app/Automobiles.txt > /app/Sorted_automobiles.txt

echo "Sorted contents:"
cat /app/Sorted_automobiles.txt

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "Lines starting with 'A' or 'a':"
grep -ni '^a' /app/Sorted_automobiles.txt

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "End of the script"

