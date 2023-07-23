# **Path Probe**

![image](https://github.com/Linf0rd/path_probe/assets/122806756/7cc27486-20f4-4503-bac6-b2539b4ec6d9)


**Path Probe** is a Bash script that allows you to probe and obtain detailed information about a file or directory specified by the user. The script provides various features to make it easy to explore and analyze paths on your system.

## **Features**

1. **Tab Completion**: Path Probe enables tab completion for file and directory paths. When you start typing a path, you can press the Tab key to auto-complete the path or display options if there are multiple matches.
2. **Interactive Prompt**: The script presents an interactive prompt, asking you to enter the file or directory path you want to probe. This makes it user-friendly and allows you to interactively explore different paths.
3. **Path Validation**: Path Probe checks if the specified path exists before proceeding with the analysis. If the provided path does not exist, the script will notify you accordingly.
4. **File and Directory Information**: Depending on the input, the script distinguishes between files and directories, providing detailed information specific to each.
5. **File Information**:
    - File Size: The script calculates and displays the size of the file.
    - File Permissions: The file's permission both in symbolic and numeric representation is displayed.
    - File Type: The script determines the type of the file using the **`file`** command and displays it.
    - Checksum (MD5): The script computes and shows the MD5 checksum of the file.
    - Last Modified: The script displays the date and time when the file was last modified.
    - Owner and Group: The owner and group of the file are displayed.
6. **Directory Information**:
    - Number of Files: The script counts and displays the total number of files within the specified directory.
    - Directory Size: The script calculates and displays the total size of the directory.
    - Directory Permissions: The directory's permission both in symbolic and numeric representation is displayed.

## **Requirements**

- **Bash**: The script is written in Bash and requires a Bash shell to run.
- **coreutils**: Some core utilities such as **`realpath`**, **`du`**, and **`stat`** are used in the script, which are part of the coreutils package installed on most Unix-like systems.

To install coreutils on Debian-based systems (e.g., Ubuntu), use the following command:

```

sudo apt-get update
sudo apt-get install coreutils

```

To install coreutils on Red Hat-based systems (e.g., CentOS), use the following command:

```

sudo yum install coreutils
```

To install coreutils on macOS using Homebrew, use the following command:

```

brew install coreutils
```

## **How to Use**

1. **Download the Script**: Clone or download the script from the GitHub repository. You can clone the repository using the following command:
    
    ```bash
    
    git clone https://github.com/Linf0rd/path_probe.git
    
    ```
    
2. **Make the Script Executable**: Ensure the script has the necessary permissions to be executed. You can use the following command to grant execute permissions:
    
    ```bash
    
    chmod +x path_probe.sh
    
    ```
    
3. **Run the Script**: Open a terminal and navigate to the directory where the script is located. Run the script using the following command:
    
    ```bash
    
    ./path_probe.sh
    
    ```
    
4. **Probe a File or Directory**: Once the script is executed, it will prompt you to enter the path of the file or directory you want to probe. Type or paste the path into the terminal and press Enter.
5. **View Results**: The script will then display detailed information about the specified file or directory, including size, permissions, type, checksum, last modified timestamp, owner, and group information.
    - If the specified path is a file, the script will show information about the file.
    - If the specified path is a directory, the script will show information about the directory, along with the number of files it contains and its size.

## **Example Usage**

Here's an example of how to use Path Probe:

```bash

$ ./path_probe.sh
Enter the file/directory path: /path/to/your/file_or_directory

```

After entering the path, the script will display relevant information about the specified file or directory:


![image](https://github.com/Linf0rd/path_probe/assets/122806756/76d711ef-cd2d-441f-8526-b1177a316b08)


**Note**: Replace **`/path/to/your/file_or_directory`** with the actual path you want to probe.

## **Acknowledgments**

Thank you for using Path Probe! I hope you find it useful in exploring and obtaining information about files and directories on your system. If you encounter any issues or have suggestions for improvement, feel free to reach out to me!

---

Please ensure you have the necessary permissions to execute the script and that the required core utilities are installed on your system before running Path Probe.
