#!/bin/bash

host_string=(" -p 22 pzl97@apt159.apt.emulab.net" " -p 22 pzl97@apt162.apt.emulab.net" " -p 22 pzl97@apt161.apt.emulab.net" " -p 22 pzl97@apt158.apt.emulab.net")
name="deploy-theta2"
0
if [ "$1" == "connect" ]; then 
  tmux new-session -s $name -d
fi 

for i in $( seq 0 `expr ${#host_string[@]} - 1 ` )

do
  val=`expr $i + 1`
  tmux_name="$name:$i"
  #tmux neww -a -n "$client" -t $name
  if [ "$1" == "connect" ]; then 
  tmux new-window -n "$i" -t "$name" -d
  tmux send -t $tmux_name "ssh ${host_string[i]}" Enter
elif [ "$1" == "init" ]; then
  tmux send -t $tmux_name "git clone  https://github.com/litrane/docker_theta_environment.git" Enter
  tmux send -t $tmux_name "cd docker_theta_environment" Enter
  #tmux send -t $tmux_name "nohup ./earthd start --home=./workspace/earth/validator${i} > output 2>&1 & " Enter
elif [ "$1" == "start" ]; then
  tmux send -t $tmux_name "cd theta" Enter
  tmux send -t $tmux_name "nohup ./theta-eth-rpc-adaptor start --config=./thetasub_eth_rpc_adaptor  > output 2>&1 &  " Enter
  tmux send -t $tmux_name "./thetasubchain start --config=./allsubchains/DSN_360777/node${val}/ --password=qwe " Enter
elif [ "$1" == "update" ]; then
  #tmux send -t $tmux_name "cd theta_experiment_file" Enter
  tmux send -t $tmux_name "git clean -xfd" Enter
  tmux send -t $tmux_name "git pull" Enter
elif [ "$1" == "clean" ]; then
  tmux send -t $tmux_name "cd ~" Enter
  tmux send -t $tmux_name "rm -rf docker_experiment_environent" Enter
fi

  echo "start node${val}!"
  

done

