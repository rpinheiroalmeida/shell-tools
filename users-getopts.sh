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
# Version 7g: Changed to use getopts

sort=0
reverse=0
uppercase=0
delimiter='\t'

HELP_MESSAGE="
USE: $(basename "$0") [OPTIONS]

OPTIONS:
    -d C   Use the character C as a delimiter 
    -r     Reverse the users list
    -s     Sort the users list alphabetically
    -u     Show the users list in UPPER CASE

    -h     Show this help screen
    -V     Show the program version
"

while getopts ":hVd:rsu" option
do
    case "$option" in
        s) sort=1 ;;
        r) reverse=1 ;;
        u) uppercase=1 ;;
        d) delimiter="$OPTARG" ;;

        h)
            echo "$HELP_MESSAGE"
            exit 0
        ;;

        V)
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

       \?)
           echo Invalid option: $OPTARG
           exit 1
        ;;

        :)
            echo It is missing an argument to: $OPTARG
            exit 1
        ;;

    esac

    shift
done

users=$(cut -d : -f 1,5 /etc/passwd)

test "$sort" = 1 && users=$(echo "$users" | sort)
test "$reverse" = 1 && users=$(echo "$users" | tac)
test "$uppercase" = 1 && users=$(echo "$users" | tr a-z A-Z)

echo "$users" | tr : "$delimiter"
