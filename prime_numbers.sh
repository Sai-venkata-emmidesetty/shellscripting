#!/bin/bash

read -p "enter the limit: " limit

for((i=1; i<=limit; i++));do
    count=0
    for((j=1; j<=i; j++));do
        if((i%j==0));then
            count=$((count + 1))
        fi
    done
    if((count == 2));then
        echo "prime number is $i"
    fi
done

#-----------------------------------------------------------------------------------------------------------
#The (( ... )) syntax allows you to perform arithmetic operations directly within the script.
#count=$((count + 1)) This increments the value of count by 1. Inside (( ... )), arithmetic operators like +, -, *, /, % can be used.
#------------------------------------------------------------------------------------------------------------