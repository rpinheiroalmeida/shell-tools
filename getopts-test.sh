#!/bin/bash
#
# Loop that process all command line options
# Attention to format of the options ":sa"
# - The two-point from begin link the silence mode
# - The valid options are 'sa:', that are -s and -a
# - The two-point from 'a:' shows an argument: -a FOO
#
while getopts ":sa:" option
do
    case "$option" in
        s) echo "OK Simple option (-s)" ;;
        a) echo "Ok Option with argument (-a), receive: $OPTARG" ;;
       \?) echo "ERRO Invalid option: $OPTARG" ;;
        :) echo "ERRO It's missing an argument: $OPTARG"
    esac
done

# The variable $OPTIND store the index of the rest of the command line
echo
shift $((OPTIND - 1))
echo "INDEX: $OPTIND"
echo "REST: $*"
echo

