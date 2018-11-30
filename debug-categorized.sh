#!/bin/bash

DEBUG=${1:-0}

Debug() {
    [ $1 -le $DEBUG ] && echo "----- DEBUG $*"
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
