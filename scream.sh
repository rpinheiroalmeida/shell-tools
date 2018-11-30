#!/bin/bash

TXT="screaming"
TXT="     $TXT     "
TXT=$(echo "$TXT" | tr ' ' '!')
TXT=$(echo $TXT | tr a-z A-Z)
echo "$TXT"
