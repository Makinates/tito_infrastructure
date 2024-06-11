# Bash Automation Project

## Overview

This project demonstrates the use of Bash scripts to automate repetitive tasks, including control structures, text processing, and system administration.

## Directory Structure

- `tito.sh`: Prints "Hello, Tito This is my First Script!"
- `check_directory.sh`: Checks if a directory exists and creates it if not.
- `text_process.sh`: Demonstrates the use of grep, sed, awk, and cut.
- `user.sh`: Create a new user.
- `log_rotation.sh`: Rotates logs.
- `backup.sh`: Creates backups every 20 minutes into a specified folder and if folder not created already, it's automatically creates one.

## How to Use

1. Clone the repository and navigate to the project directory.
2. Make the scripts executable using `chmod +x script_name.sh`.
3. Run the scripts using `./script_name.sh`.

## Scripts

### tito.sh

Hello, This is Titolu first Bash Script
Good afternoon, how is your day going?, Titolu!.

### check_directory.sh

This script checks if a directory named `tito_pro` exists. If it does not, the script creates it.

### text_process.sh

This script demonstrates the use of text processing utilities:
- `grep` to find lines containing a specific string.
- `sed` to perform text substitution.
- `awk` to extract specific columns.
- `cut` to extract specific fields.

### user.sh

This script adds a new user. Usage: `./add_user.sh username`.

### log_rotate.sh

This script rotates system logs. It copies the current log to an archive directory and truncates the original log file.

### backup.sh

This script creates backups of a specified directory and schedules it to run every 20 minutes using cron.

Edit the crontab to schedule the script every 20 minutes:

`crontab -e`

Add the following line to the crontab file:
```markdown
*/20 * * * * /path/to/your/bash_automation_project/backup.sh
```
Replace /path/to/your/bash_automation_project/backup.sh with the actual path to the backup.sh script.