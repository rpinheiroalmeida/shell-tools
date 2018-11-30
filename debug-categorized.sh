#!/bin/bash

DEBUG=${1:-0}

Debug() {
    [ $1 -le $DEBUG ] || return
    local prefix
    case "$1" in
        1) prefix="-- " ;;
        2) prefix="---- " ;;
        3) prefix="------ " ;;
        *) echo "Message does not categorized: $*";  return ;;
    esac
    shift

    echo $prefix$*
}

Debug 1 "Start of the Program"

i=0
max=5
echo "Counting until $max"

Debug 2 "I'm going to in WHILE"

while [ $i -ne $max ]; do
    Debug 3 "Value of the \$i before increment: $i"
    let i=$i+1
    Debug 3 "Value of the \$i after increment: $i"

    echo "$i..."
done

Debug 2 "Exiting WHILE"

echo "Finished"

Debug 1 "Program END"
