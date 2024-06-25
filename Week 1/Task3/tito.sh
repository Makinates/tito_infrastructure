#!/bin/bash

echo "Hello, This is Titolu first Bash Script"

#!/bin/bash

# Variables
name="Titolu"
hour=$(date +%H)

# Control structure
if [ $hour -lt 12 ]; then
    greeting="Good morning and have a nice day"
else
    greeting="Good afternoon, how is your day going?"
fi

# Output
echo "$greeting, $name!"

