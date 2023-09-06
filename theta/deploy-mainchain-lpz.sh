#!/bin/bash

#host_string=("pzl97@apt115.apt.emulab.net" "pzl97@apt108.apt.emulab.net" "pzl97@apt104.apt.emulab.net" "pzl97@apt097.apt.emulab.net")
host_string=(" root@10.10.1.1" " root@10.10.1.2" " root@10.10.1.3" " root@10.10.1.4" )

name="deploy-theta1"

if [ "$1" == "connect" ]; then 
  tmux new-session -s $name -d
fi 

for i in $( seq 0  `expr ${#host_string[@]} - 1` )

do
  val=`expr $i + 1`
  tmux_name="$name:$i"
  #tmux neww -a -n "$client" -t $name
  if [ "$1" == "connect" ]; then 
  tmux new-window -n "$i" -t "$name" -d
  tmux send -t $tmux_name "ssh   ${host_string[i]}" Enter
elif [ "$1" == "init" ]; then
  tmux send -t $tmux_name "git clone  https://github.com/litrane/docker-lab1.git" Enter
  tmux send -t $tmux_name "cd docker-lab1" Enter
  #tmux send -t $tmux_name "nohup ./earthd start --home=./workspace/earth/validator${i} > output 2>&1 & " Enter
elif [ "$1" == "start" ]; then
  #tmux send -t $tmux_name "ps -ef | grep theta| grep -v grep | awk '{print $2}' | xargs kill -9" Enter
  tmux send -t $tmux_name "cd ~/docker-lab1/theta" Enter
  #tmux send -t $tmux_name "nohup ./theta-eth-rpc-adaptor start --config=./eth_rpc_adaptor  > output 2>&1 &  " Enter
  tmux send -t $tmux_name "nohup ./theta start --config=./mainchain_ipdps/node${val}/ --password=qwertyuiop   > ./output.log 2>&1 & " Enter
elif [ "$1" == "update" ]; then
  tmux send -t $tmux_name " ps -ef | grep theta | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
   tmux send -t $tmux_name "cd ~/docker-lab1" Enter
  tmux send -t $tmux_name "git clean -xfd" Enter
  tmux send -t $tmux_name "git pull" Enter
elif [ "$1" == "clean" ]; then
  tmux send -t $tmux_name "ps -ef | grep theta | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
    tmux send -t $tmux_name "ps -ef | grep tps | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
  tmux send -t $tmux_name "cd ~" Enter
  tmux send -t $tmux_name "rm -rf docker-lab1" Enter
elif [ "$1" == "stop" ]; then
  tmux send -t $tmux_name " ps -ef | grep theta | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
fi

  echo "start node${val}!"
  

done

