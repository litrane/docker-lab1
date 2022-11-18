#!/bin/bash

#host_string=(" -p 22 pzl97@apt190.apt.emulab.net" " -p 22 pzl97@apt184.apt.emulab.net" " -p 22 pzl97@apt189.apt.emulab.net" " -p 22 pzl97@apt185.apt.emulab.net")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" )
host_string=(" -p 22 pzl97@apt179.apt.emulab.net" " -p 22 pzl97@apt192.apt.emulab.net" " -p 22 pzl97@apt190.apt.emulab.net" " -p 22 pzl97@apt175.apt.emulab.net")

name="deploy-client"

if [ "$1" == "connect" ]; then 
  tmux new-session -s $name -d
fi 

for i in $( seq 0 15 )

do
  val=`expr \( $i % 4 \) + 1 `
  idCount=` expr $i / 4  `
  tmux_name="$name:$i"
  #tmux neww -a -n "$client" -t $name
  if [ "$1" == "connect" ]; then 
  tmux new-window -n "$i" -t "$name" -d
  tmux send -t $tmux_name "ssh ${host_string[idCount]}" Enter
# elif [ "$1" == "init" ]; then
#   tmux send -t $tmux_name "git clone  https://github.com/litrane/docker-lab1.git " Enter
#   tmux send -t $tmux_name "cd docker-lab1" Enter
#   #tmux send -t $tmux_name "nohup ./earthd start --home=./workspace/earth/validator${i} > output 2>&1 & " Enter
elif [ "$1" == "start" ]; then
  tmux send -t $tmux_name "cd ~/docker-lab1/theta" Enter
  tmux send -t $tmux_name "./tpsclient $i CrossChain 360001 0 " Enter
  echo "DSN_$idCount"
elif [ "$1" == "update" ]; then
  #tmux send -t $tmux_name "cd theta_experiment_file" Enter
  tmux send -t $tmux_name "rm tpsclient" Enter
  tmux send -t $tmux_name "git clean -xfd" Enter
  tmux send -t $tmux_name "git pull" Enter
elif [ "$1" == "clean" ]; then
  tmux send -t $tmux_name "cd ~" Enter
  tmux send -t $tmux_name "rm -rf docker_experiment_environent" Enter
fi

  echo "start node${val}!"
  

done

