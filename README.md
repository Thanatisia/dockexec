# docker-exec-cli 

```
A docker execution CLI utility that aims to simplify docker execution and streamlining through the use of options
```

## Information
### Background
```
Started off as a one-off script to be used alongside my docker service/project "cli-tools-docker", adding features such as executing the CLI utilities I added into the image/container with arguments without having to type 'docker exec -it cli-tools /bin/bash -c "your-executable-here" "your-arguments-here"', 
however, I saw that you could run docker exec and get an output as though it is containerized through something like say, Python's venv. 
    Hence, I started working on this project to be a standalone/system-agnostic implementation
```
### Program
+ Program Name: dockexec
+ Program Version: v0.2.0
- Configuration
    + Directory: ~/.config/dockexec
    + File: config.sh

## Setup
### Dependencies
+ docker

### Pre-Requisites
+ Some basic internal docker functionalities/understanding

### Installation
+ Makefile is in work-in-progress
- Manually
    ```console
    install 0755 src/dockexec /usr/local/bin/
    ```

### Configuration
- By default, if the configuration directory and files are not found
    + The application will create/generate the directory and file for you

## Documentation
### Synopsis/Syntax
    ```console
    dockexec {options}
    ```

### Parameters
- Positionals

- Options
    - With Arguments
        - Execution
            + service {options} : Manage/Handle all services in cli-tools
                - Options
                    + exec        : Start/Begin executing the specified command/executable and arguments provided; Ensure that '--set-command' and '--set-command-args' is specified before this
                    + ls          : List all services; (WIP) Filter services
                    + -h | --help : Display help for 'dockexec service'
        - General
            + `-f [custom-file-name] | --import-file [custom-file-name]` : Import a custom configuration file; Must be placed at the front to ensure it is sourced first
            + `--change-container <new-container-name>`                  : Change and execute command to a new container; Might need to use '--change-shell' if the new container/image does not have your shell
            + `--change-shell <new-shell-path>`                          : Change the current shell for the current instance
            + `--set-command [utility-name]`                             : Set a command/binary to execute in the specified target container
            + `--set-command-args <command-and-arguments-to-execute>`    : Set the arguments you want to parse into the command/executable to execute in the specified target container
    - Flags
        - General
            + --get-shell        : Get the currently set default shell
            + --get-command      : Get the current default command/executable
            + --get-command-args : Get the current default argument to parse into command/executable
            + --get-container    : Get the currently set default container
            + -h | --help        : Display this help message
            + -v | --version     : Display current program version

### Usage
- Execute command after setting your default configuration and options
    ```console
    dockexec {options} service exec
    ```

- Execute commands in a different shell
    ```console 
    dockexec --change-shell /bin/{sh|zsh|fish} --set-command "your-executable" --set-command-args "your-arguments" {other-options} service exec
    ```

- Set command/executable and arguments to execute
    ```console
    dockexec --set-command [yt-dlp|gallery-dl|your-executable-of-choice] --set-command-args [argument-to-parse] service exec
    ```

## Wiki

### Snippets and Examples
- Temporarily executing commands in another container with other shells
    - Given the following requirements
        1. You are temporarily changing to a container that has
            + No 'bash' shell, only 'sh' shell
        2. You are to execute the command string "executable" 
            + with the arguments "--arguments-to-execute"
    ```console
    dockexec --change-container [new-container] --change-shell /bin/sh --set-command "executable" --set-command-args "--arguments-to-execute" service exec
    ```

- Using multiple commands to multiple containers
    ```console
    dockexec \
        --change-container [new-container] --set-command "executable" --set-command-args "--arguments-to-execute" service exec \
        --change-container [new-container] --set-command "executable" --set-command-args "--arguments-to-execute" service exec \
        --change-container [new-container] --set-command "executable" --set-command-args "--arguments-to-execute" service exec \
        ...
    ```

- Using default commands to multiple containers
    - Notes
        + Ensure that your default variables are set in the configuration file
    ```console
    dockexec \
        --change-container [new-container] service exec \
        --change-container [new-container] service exec \
        --change-container [new-container] service exec \
        ...
    ```

- Import and use custom configuration file
    ```console
    dockexec -f /path/to/config/file/config.sh service exec
    ```

- Jump straight into the shell of a container
    - Pre-Requisites
        - Edit the default values in your configuration file
            + EXEC_CONTAINER_NAME="target-container"
            + EXEC_SHELL="your-shell"
            + EXEC_COMMAND="\$SHELL"
            + EXEC_COMMAND_ARGS=""
    - Default
        ```console
        dockexec service exec
        ```
    - Custom container
        ```console
        dockexec --change-container [new-container] service exec
        ```
    - Custom Shell
        ```console
        dockexec --change-shell [new-shell] service exec
        ```

### Configuration Settings
+ EXEC_CONTAINER_NAME="container-name"           : Your default target container name
+ EXEC_SHELL="/bin/bash"                         : Your default shell
+ EXEC_available_services=("executables" "here") : An array containing the services you know exists, not used for now
+ EXEC_COMMAND=""                                : Set default command/executable to execute to the specified default container if you want to repeat
+ EXEC_COMMAND_ARGS=""                           : Set default arguments to parse into the executable to execute to the specified default container for repetition

### TODO-List and Pipeline
#### Open
+ [] Migration and implementation in a compiled-language like C/C++/Rust instead of Interpreted to improve running time + portability
#### Ongoing
+ [] Implement 'docker cp' support
#### Completed
+ [X] Create a Makefile installer
+ [X] Custom configuration file import
+ [X] Implementing default command/executable and default arguments to execute if '--set-command' and '--set-command-args' are not set.

### Developer's Notes
- 2023-06-26 1124H: At the moment, I have implemented inter/cross-container support. 
    - this means that by default, 
        - you can specify the default target container you want to execute in, as well as all the other variables
            + and you will be able to call commands/executables without any additional options other than specifying the commands to use.
        - the application is also container-agnostic

- 2023-06-29 1529H:
    - A Makefile has been created with rules for [install, uninstall, help, test]
    - Importing Custom configuration file has been implemented
    - I am currently considering on migrating from shellscript into a proper Programming language, either compiled or interpreted

## Resources

## References

## Remarks
