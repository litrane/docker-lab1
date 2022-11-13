#!/bin/bash

n=0
portStart=16900
portEnd=19888
sshPort=2205
# validator config
while ((n <= 15))
do

    val=`expr \( $n % 4 \) + 1 `
    idCount=` expr $n / 4 + 1 `
    echo "$n:$idCount:$val"
        ((n++))
done

