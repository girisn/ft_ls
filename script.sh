#!/bin/bash

echo "\n\n==== Test ====\n\n"
echo "Dif:\n\n"
#diff r1 r2;

let "a=$(date +%s)";
echo $a;

let "a = a - 400";
echo $a;
touch -t $a future;

