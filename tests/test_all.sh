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
    cmd_str="$2"

    if [[ "$res_code" == "0" ]]; then
        # Success
        echo -e "[$cmd_str] : Success"
    else
        # Error
        echo -e "[$cmd_str] : Error"
    fi
}

test_help()
{
    : "
    Test ['-h' | '--help'] option
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE -h"

    # Execute command without output
    $cmd_str > /dev/null

    # Get result
    res="$?"
    assert "$res" "$cmd_str"
}

test_list_services()
{
    : "
    Test [service ls] option
    "
    # Initialize Variables
    cmd_str="./$SRC_FILE service ls"

    # Execute command without output
    $cmd_str > /dev/null

    # Get result
    res="$?"
    assert "$res" "$cmd_str"
}

main()
{
    test_help
    test_list_services
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    : "
    Equivalent to Python's if __name__ == '__main':
    "
    main
fi

