#!/bin/bash

# Function to print script name
print_name() {
	echo ""
	echo "██████████████████████████████████████████████████████"
	echo "█▄─▄▄─██▀▄─██─▄─▄─█─█─███▄─▄▄─█▄─▄▄▀█─▄▄─█▄─▄─▀█▄─▄▄─█"
	echo "██─▄▄▄██─▀─████─███─▄─████─▄▄▄██─▄─▄█─██─██─▄─▀██─▄█▀█"
	echo "▀▄▄▄▀▀▀▄▄▀▄▄▀▀▄▄▄▀▀▄▀▄▀▀▀▄▄▄▀▀▀▄▄▀▄▄▀▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀"
	echo ""
}

# Print name
print_name


# Enable tab completion and line editing
if [[ $- == *i* ]]; then
	bind 'set show-all-if-ambiguous on'
	bind 'TAB:menu-complete'
fi


# Function to handle file/directory path completion
file_path_completion() {
	local cur prev words cword
	_init_completion || return

	# Set the completion options to show both files and directories
	COMPREPLY=($(compgem -fd -- "$cur"))
}


# Set the completion function for the file/directory path argument
complete -F file_path_completion file_path


# Prompt the user to enter the file/directory path
read -e -p "Enter the file/directory path: " file_path


# Check if the given path exists
if [ -e "$file_path" ]; then

	# Get the absolute path
	file_path=$(realpath "$file_path")

	#Check if it's a directory
	if [ -d "$file_path" ]; then

		# Get the directory name
		dir_name=$(basename "$file_path")

		# Get the number of files in the directory
		file_count=$(find "$file_path" -type f | wc -l)

		# Get the directory size
		dir_size=$(du -sh "$file_path" | awk '{print $1}')

		# Get the directory permissions
		dir_permissions=$(stat -c "%A" "$file_path")
		dir_permissions_numberic=$(stat -c "%a" "$file_path")

		# Display the directory information
		echo " "
		echo "Directory name: $dir_name"
		echo "Number of files: $file_count"
		echo "Directory size: $dir_size"
		echo "Directory permissions: $dir_permissions_numberic"
		echo "Directory path: $file_path"
	else
		# It's a file, display file information (same as before)
		# Get the file name and extension
		file_name=$(basename "$file_path")
		file_extension="${file_name##*.}"

		# Get the file size
		file_size=$(wc -c < "$file_path")
		file_size_human=$(numfmt  --to=iec --format="%.2f" "$file_size")

		# Get the file permissions
		file_permissions=$(stat -c "%A" "$file_path")
		file_permissions_numeric=$(stat -c "%a" "$file_path")

		# Get the file description
		file_description=$(file -b "$file_path")

		# Get the checksum (MD5)
		checksum=$(md5sum "$file_path" | awk '{print $1}')

		# Get the file type
		file_type=$(file --mime-type -b "$file_path")

		# Get the last modified timestamp
		last_modified=$(stat -c "%y" "$file_path")

		# Get the owner and group information
		owner=$(stat -c "%U" "$file_path")
		group=$(stat -c "%G" "$file_path")

		# Display the file information
		echo " "
		echo "File name: $file_name"
		echo "File size: $file_size_human"
		echo "File permissions: $file_permissions_numeric"
		echo "File path: $file_path"
		echo "File description: $file_description"
		echo "Checksum (MD5): $checksum"
		echo "File type: $file_type"
		echo "Last modified: $last_modified"
		echo "Owner: $owner"
		echo "Group: $group"
	fi
else
	echo "File or directory not found!"
fi
