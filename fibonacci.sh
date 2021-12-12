#!/bin/bash
function fibonacci () {
    if (($1 <= 1)); then
        echo $1
    else
        echo $(( $(fibonacci $(($1 - 1))) + $(fibonacci $(($1 - 2))) ))
    fi
}

if [ -z "$1" ]; then
    echo "Bro, it looks like you are trying to run this script without giving an N"
    exit
fi

if [ "$1" -le 0 ]; then
    echo "Bro, it looks like you are trying to run this script with giving a negetive N"
    echo "Fibonacci sequence is only for 0 and positive numbers."
    exit
fi
fibonacci $1