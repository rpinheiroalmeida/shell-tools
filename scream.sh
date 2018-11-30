#!/bin/bash

DEBUG=1

Debug() {
    [ "$DEBUG" = 1 ] && echo -e "\033[33;1m$*\033[m"
}

TXT="screaming"
TXT="     $TXT     "
Debug "TXT with spaces  : [$TXT]"
TXT=$(echo "$TXT" | tr ' ' '!')
Debug "TXT with exclamations:   [$TXT]"
TXT=$(echo $TXT | tr a-z A-Z)
echo "$TXT"
