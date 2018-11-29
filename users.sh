#!/bin/bash

# Show the logins and names of the users in a system
#
# Version 1: Show users and names splited by TAB
# Version 2: Add suport to option -h
# Version 3: Add suport to option -V and invalid options
# Version 4: Fixing bug when there is no option, basename in the program name, 
#            -V extracting directly from header, added option --help and --version
# Version 5: Add options -s and --sort
# Version 6: Add options -r, --reverse, -u, --uppercase,
#            read multiple options (loop)
# Version 7: Improve the code to be more readable,
#            add options -d and --delimiter

sort=0
reverse=0
uppercase=0
delimiter='\t'

HELP_MESSAGE="
USE: $(basename "$0") [OPTIONS]

OPTIONS:
    -d, --delimiter C   Use the character C as a delimiter 
    -r, --reverse       Reverse the users list
    -s, --sort          Sort the users list alphabetically
    -u, --upercase      Show the users list in UPPER CASE

    -h, --help          Show this help screen
    -V, --version       Show the program version
"

while test -n "$1"
do
    case "$1" in
        -s | --sort) sort=1 ;;
        -r | --reverse) reverse=1 ;;
        -u | --uppercase) uppercase=1 ;;
        -d | --delimiter)
            shift
            delimiter="$1"
            if test -z "$delimiter"
            then
                echo "It is missing an argument to -d"
                exit 1
            fi
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

    shift
done

users=$(cut -d : -f 1,5 /etc/passwd)

test "$sort" = 1 && users=$(echo "$users" | sort)
test "$reverse" = 1 && users=$(echo "$users" | tac)
test "$uppercase" = 1 && users=$(echo "$users" | tr a-z A-Z)

echo "$users" | tr : "$delimiter"
