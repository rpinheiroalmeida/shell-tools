#!/bin/bash

# Show the logins and names of the users in a system

HELP_MESSAGE="
USE: $O [-h | -V]

    -h      Show this help screen
    -V      Show the program version
"

case "$1" in
    -h)
        echo "$HELP_MESSAGE"
        exit 0
    ;;

    -V)
        echo $0 Version 3
        exit 0
    ;;

    *)
        echo Invalid Option: $1
        exit 1
    ;;

esac

cut -d : -f 1,5 /etc/passwd | tr : \\t
