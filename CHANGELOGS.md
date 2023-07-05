# CHANGELOGS

## Version History
+ 2023-06-26 1113H : v0.1.0 
+ 2023-06-29 1529H : v0.2.0
+ 2023-06-29 2319H : v0.2.1
+ 2023-07-06 1406H : v0.2.2

## v0.1.0
- Initial Commit

## v0.2.0
- A Makefile has been created with rules for [install, uninstall, help, test]
- Renamed unit test script from 'tests/test_all.sh' => 'tests/unittest.sh'
- Updated unit test 
    - new tests
    - Updated assert function
- Updated CHANGELOGS with changes made
- Updated README with program documentation updates, new snippets and examples
- Updated dockexec with big changes, for example
    - Importing Custom configuration file has been implemented
    - Explicitly setting custom command/executable
    - Explicitly setting custom arguments to parse into the command/executable
    - Getting default command
    - Getting default command argument
    
## v0.2.1
- Implemented specifying a commands list/file and 
    - executing all executables/commands (and their arguments) specified in the file.
- Implemented copy option for 'docker cp' compatibility

## v0.2.2
- Fixed bug where the initialization step doesnt create directories due to the calling of function 'error' where
    + previously, 'error' doesnt exit with an exit code of 1
    + but now that 'error' exits with an error code of 1, the program ends immediately after the error
    + thus, the error has now been changed to print to standard output via echo

