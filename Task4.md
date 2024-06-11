# A guide to navigating and managing the Linux file system, and performing essential system administration tasks.

### 1. Familiarizing with the Linux File System Hierarchy and Navigating the File System

The Linux file system hierarchy follows a standard layout defined by the Filesystem Hierarchy Standard (FHS). Below are the key directories:

- `/`: The root directory.
- `/bin`: Essential command binaries.
- `/boot`: Static files of the boot loader.
- `/dev`: Device files.
- `/etc`: Host-specific system configuration.
- `/home`: User home directories.
- `/lib`: Essential shared libraries and kernel modules.
- `/media`: Mount points for removable media.
- `/mnt`: Temporary mount points.
- `/opt`: Add-on application software packages.
- `/proc`: Virtual filesystem providing process and kernel information.
- `/root`: Home directory for the root user.
- `/sbin`: System binaries.
- `/tmp`: Temporary files.
- `/usr`: Secondary hierarchy.
- `/var`: Variable data like logs.

#### Navigating the File System

- **`pwd`**: Prints the current working directory.
  ```bash
  pwd
  ```
- **`ls`**: Lists directory contents.
  ```bash
  ls
  ```
  Options:
  - `-l`: Long listing format.
  - `-a`: All files including hidden files.
- **`cd`**: Changes the current directory.
  ```bash
  cd /path/to/directory
  ```
- **`mkdir`**: Creates directories.
  ```bash
  mkdir new_folder
  ```
- **`rm`**: Removes files or directories.
  ```bash
  rm file_name
  rm -r folder_name  # Recursively remove a directory
  ```

### 2. Managing Files and Directories

- **`cp`**: Copies files or directories.
  ```bash
  cp source_file destination_file
  cp -r source_directory destination_directory  # Copy directories recursively
  ```
- **`mv`**: Moves or renames files or directories.
  ```bash
  mv source_file destination_file
  mv old_name new_name  # Rename a file or directory
  ```
- **`touch`**: Creates an empty file or updates the timestamp of an existing file.
  ```bash
  touch new_file
  ```
- **`chmod`**: Changes file permissions.
  ```bash
  chmod 755 file_name  # Read, write, and execute for owner; read and execute for group and others
  ```
- **`chown`**: Changes file owner and group.
  ```bash
  chown user:group file_name
  ```

### 3. Using Text Editors (vim, nano)

- **vim**: A powerful text editor.
  ```bash
  vim file_name
  ```
  Basic commands in vim:
  - `i`: Enter insert mode.
  - `:w`: Save file.
  - `:q`: Quit vim.
  - `:wq`: Save and quit.
  - `:q!`: Quit without saving.
  
- **nano**: A simpler, user-friendly text editor.
  ```bash
  nano file_name
  ```
  Basic commands in nano:
  - `Ctrl + O`: Save file.
  - `Ctrl + X`: Exit nano.
  - `Ctrl + K`: Cut text.
  - `Ctrl + U`: Paste text.

### 4. Leveraging Command-Line Tools for System Administration

- **`ps`**: Reports a snapshot of current processes.
  ```bash
  ps aux  # Detailed information about all processes
  ```
- **`top`**: Displays tasks and system resource usage.
  ```bash
  top
  ```
  - `q`: Quit top.
- **`df`**: Reports file system disk space usage.
  ```bash
  df -h  # Human-readable format
  ```
- **`du`**: Estimates file space usage.
  ```bash
  du -h  # Human-readable format
  du -sh directory_name  # Summary of a directory
  ```
- **`lsof`**: Lists open files.
  ```bash
  lsof
  lsof -i :port_number  # List open files associated with a port
  ```
- **`netstat`**: Displays network connections.
  ```bash
  netstat -tuln  # List all listening ports
  ```

