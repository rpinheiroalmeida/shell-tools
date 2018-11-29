#!/bin/bash

# Show the logins and names of the users in a system

HELP_MESSAGE="
USE: $O [-h]

    -h      Show this help screen and exit
"

if test "$1" = "-h"
then
    echo "$HELP_MESSAGE"
    exit 0
fi

cut -d : -f 1,5 /etc/passwd | tr : \\t
