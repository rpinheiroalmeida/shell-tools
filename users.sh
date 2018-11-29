#!/bin/bash

# Show the logins and names of the users in a system
#
# Version 1: Show users and names splited by TAB
# Version 2: Add suport to option -h
# Version 3: Add suport to option -V and invalid options
# Version 4: Fixing bug when there is no option, basename in the program name, 
#            -V extracting directly from header, added option --help and --version
# Version 5: Add options -s and --sort

sort=0

HELP_MESSAGE="
USE: $(basename "$0") [-h | -V]

    -h      Show this help screen
    -V      Show the program version
"

case "$1" in
    -s | --sort)
        sort=1
    ;;

    -h | --help)
        echo "$HELP_MESSAGE"
        exit 0
    ;;

    -V | --version)
        echo -n $(basename "$0") 
        grep '^# Version ' users.sh | tail -1 | cut -d : -f 1 | tr -d \#
        exit 0
    ;;

    *)
        if test -n "$1"
        then
            echo Invalid Option: $1
            exit 1
        fi
    ;;

esac

users=$(cut -d : -f 1,5 /etc/passwd)

if test "$sort" = 1
then
    users=$(echo "$users" | sort)
fi

echo "$users" | tr : \\t
