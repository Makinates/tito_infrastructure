#!/bin/bash
# This script demonstrates the use of grep, sed, awk, and cut

# Create a sample file
echo -e "Name,Age,Gender\nAlice,30,F\nBob,25,M\nCharlie,35,M" > sample.txt

# Using grep to find lines containing "Alice"
echo "Using grep to find lines containing 'Alice':"
grep "Alice" sample.txt

# Using sed to replace "Alice" with "Alicia"
echo "Using sed to replace 'Alice' with 'Alicia':"
sed 's/Alice/Alicia/' sample.txt

# Using awk to print the second column (Age)
echo "Using awk to print the second column (Age):"
awk -F, '{print $2}' sample.txt

# Using cut to extract the first column (Name)
echo "Using cut to extract the first column (Name):"
cut -d, -f1 sample.txt

