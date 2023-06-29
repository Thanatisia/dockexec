: "
Unit Tests
"

SRC_DIR="../src"
SRC_FILE_NAME="dockexec"
SRC_FILE="$SRC_DIR/$SRC_FILE_NAME"

assert()
{
    : "
    Get unit test result code and 
    process/check
    "
    res_code="$1"
    test_title="$2"
    cmd_str="$3"

    if [[ "$res_code" == "0" ]]; then
        # Success
        echo -e "[+] Success : [$test_title] => [$cmd_str]"
    else
        # Error
        echo -e "[-] Error   : [$test_title] => [$cmd_str]"
    fi
}

test_help()
{
    : "
    Test ['-h' | '--help'] option
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE -h"
    VERBOSE=false
    test_title="test help output"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"
}

test_list_services()
{
    : "
    Test [service ls] option
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE service ls"
    VERBOSE=false
    test_title="test listing services"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"
}

test_custom_cfg()
{
    : "
    Test custom configuration file
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE -f ./test_config/dockexec/config.sh service exec"
    VERBOSE=false
    test_title="test custom configuration file"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"
}

test_different_shell()
{
    : "
    Test using different shell
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE --change-shell /bin/sh service exec"
    VERBOSE=false
    test_title="test different shell"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"
}

test_error()
{
    : "
    Test using a wrong input
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE exec"
    VERBOSE=false
    test_title="test error input"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"   
}

test_multi_command()
{
    : "
    Test inputting multiple commands
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE --set-command df --set-command-args -h service exec --set-command echo --set-command-args Hello service exec"
    VERBOSE=false
    test_title="test multiple commands"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"   
}

test_file_exec()
{
    : "
    Test executing all commands specified in a commands list
    "
    cmd_str="./$SRC_FILE --from-file --set-commands-list ./test_config/dockexec/commands.list service exec"
    VERBOSE=false
    test_title="test commands list file execution"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"
}

test_file_exec_default()
{
    : "
    Test executing all commands specified in a commands list
    "
    cmd_str="./$SRC_FILE --from-file service exec"
    VERBOSE=false
    test_title="test default commands list file execution"

    if [[ "$VERBOSE" == true ]]; then
        # Execute command with output
        $cmd_str
    else
        # Execute command without output
        $cmd_str > /dev/null
    fi

    # Get result
    res="$?"
    assert "$res" "$test_title" "$cmd_str"
}

main()
{
    test_help
    test_list_services
    test_custom_cfg
    test_different_shell
    test_error
    test_multi_command
    test_file_exec
    test_file_exec_default
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    : "
    Equivalent to Python's if __name__ == '__main':
    "
    main
fi

