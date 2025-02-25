#!/bin/bash

# 1. Printing "Hello World"
echo "Hello World"

# 2. Greeting the User
echo -n "Enter your name: "
read name
echo "Hello, $name!"

# 3. Euclid’s Algorithm (GCD Calculation)
echo -n "Enter first number: "
read a
echo -n "Enter second number: "
read b

# Input validation: Ensure both values are integers
if ! [[ "$a" =~ ^[0-9]+$ ]] || ! [[ "$b" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter valid integers."
    exit 1
fi

# Euclidean algorithm implementation
gcd() {
    local x=$1
    local y=$2
    while [[ $y -ne 0 ]]; do
        temp=$y
        y=$((x % y))
        x=$temp
    done
    echo "$x"
}
result=$(gcd $a $b)
echo "GCD is $result"

# 4. Euclid’s Algorithm using Command-line Arguments
if [[ $# -eq 2 ]]; then
    a=$1
    b=$2
    if ! [[ "$a" =~ ^[0-9]+$ ]] || ! [[ "$b" =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter valid integers."
        exit 1
    fi
    result=$(gcd $a $b)
    echo "GCD using command-line arguments: $result"
fi

# 5. Sum of Command-line Arguments
if [[ $# -gt 0 ]]; then
    sum=0
    for num in "$@"; do
        if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
            echo "Error: All inputs must be integers."
            exit 1
        fi
        sum=$((sum + num))
    done
    echo "Sum: $sum"
fi

# 6. Find the Largest Number
if [[ $# -gt 0 ]]; then
    max=$1
    for num in "$@"; do
        if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
            echo "Error: All inputs must be integers."
            exit 1
        fi
        if [ "$num" -gt "$max" ]; then
            max=$num
        fi
    done
    echo "Largest number: $max"
fi

# 7. Christmas Tree Pattern
if [[ $# -eq 1 ]]; then
    rows=$1
    if ! [[ "$rows" =~ ^[0-9]+$ ]] || [ "$rows" -le 0 ]; then
        echo "Error: Please enter a positive integer."
        exit 1
    fi
    for (( i=1; i<=rows; i++ )); do
        for (( j=1; j<=rows-i; j++ )); do
            echo -n " "
        done
        for (( j=1; j<=2*i-1; j++ )); do
            echo -n "*"
        done
        echo
    done
    for (( j=1; j<rows; j++ )); do
        echo -n " "
    done
    echo "|"
fi