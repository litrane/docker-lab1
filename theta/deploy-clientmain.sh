#!/bin/bash

#host_string=(" -p 22 pzl97@apt190.apt.emulab.net" " -p 22 pzl97@apt184.apt.emulab.net" " -p 22 pzl97@apt189.apt.emulab.net" " -p 22 pzl97@apt185.apt.emulab.net")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" )
host_string=("pzl97@apt098.apt.emulab.net" "pzl97@apt107.apt.emulab.net" "pzl97@apt097.apt.emulab.net" "pzl97@apt110.apt.emulab.net")
name="deploy-main"

idCount="366"

if [ "$1" == "connect" ]; then 
  tmux new-session -s $name -d
fi 

for i in $( seq 0 `expr ${#host_string[@]} - 1 ` )
do
  val=`expr \( $i % 4 \) + 1 `

  tmux_name="$name:$i"
  #tmux neww -a -n "$client" -t $name
  if [ "$1" == "connect" ]; then 
  tmux new-window -n "$i" -t "$name" -d
  tmux send -t $tmux_name "ssh ${host_string[i]}" Enter
# elif [ "$1" == "init" ]; then
#   tmux send -t $tmux_name "git clone  https://github.com/litrane/docker-lab1.git " Enter
#   tmux send -t $tmux_name "cd docker-lab1" Enter
#   #tmux send -t $tmux_name "nohup ./earthd start --home=./workspace/earth/validator${i} > output 2>&1 & " Enter
elif [ "$1" == "start" ]; then
  tmux send -t $tmux_name "cd ~/docker-lab1/theta" Enter
  startID=`expr \( $i % 4 \) \* 4  `
  tmux send -t $tmux_name "nohup ./tpsclient_main $startID CrossChain $idCount 0 > output0 2>&1 &" Enter
  # startID=`expr \( $startID + 1 \)  `
  # tmux send -t $tmux_name "nohup ./tpsclient_main $startID CrossChain $idCount 0 > output1 2>&1 & " Enter
  # startID=`expr \( $startID + 1 \)  `
  # tmux send -t $tmux_name "nohup ./tpsclient_main $startID CrossChain $idCount 0 > output2 2>&1 & " Enter
  # startID=`expr \( $startID + 1 \)  `
  # tmux send -t $tmux_name "nohup ./tpsclient_main $startID CrossChain $idCount 0 > output3 2>&1 & " Enter
elif [ "$1" == "update" ]; then
  #tmux send -t $tmux_name "cd theta_experiment_file" Enter
  #tmux send -t $tmux_name "rm tpsclient" Enter
  #tmux send -t $tmux_name "git clean -xfd" Enter
  #tmux send -t $tmux_name "git pull" Enter
  #tmux send -t $tmux_name "wget https://github.com/litrane/docker-lab1/raw/main/theta/tpsclient" Enter
  tmux send -t $tmux_name "chmod +x tpsclient" Enter
elif [ "$1" == "clean" ]; then
  tmux send -t $tmux_name "cd ~" Enter
  tmux send -t $tmux_name "rm -rf docker-lab1" Enter
fi

  echo "start node${val}!"
  

done

