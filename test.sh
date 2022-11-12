#!/bin/bash

host_string=("-p 22  root@10.10.1.2" "-p 22 root@10.10.1.3" "-p 22 root@10.10.1.1" "-p 22 root@10.10.1.4")


for i in $( seq 0  `expr ${#host_string[@]} - 1 ` )

do
  val=`expr $i + 1`
  echo "start node${val}!"
  echo $i

done

