#!/bin/bash

host_string=("pzl97@pc738.emulab.net" "pzl97@pc852.emulab.net" "pzl97@pc722.emulab.net" "pzl97@pc735.emulab.net" "pzl97@pc730.emulab.net" "pzl97@pc845.emulab.net" "pzl97@pc825.emulab.net" "pzl97@pc706.emulab.net" "pzl97@pc841.emulab.net" "pzl97@pc855.emulab.net" "pzl97@pc731.emulab.net" "pzl97@pc708.emulab.net" "pzl97@pc712.emulab.net" "pzl97@pc714.emulab.net" "pzl97@pc857.emulab.net" "pzl97@pc847.emulab.net" "pzl97@pc716.emulab.net" "pzl97@pc729.emulab.net" "pzl97@pc840.emulab.net" "pzl97@pc715.emulab.net" "pzl97@pc854.emulab.net" "pzl97@pc844.emulab.net" "pzl97@pc849.emulab.net" "pzl97@pc856.emulab.net" "pzl97@pc859.emulab.net" "pzl97@pc833.emulab.net" "pzl97@pc860.emulab.net" "pzl97@pc728.emulab.net" "pzl97@pc830.emulab.net" "pzl97@pc737.emulab.net" "pzl97@pc829.emulab.net" "pzl97@pc701.emulab.net")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" )

name="deploy-theta2"

if [ "$1" == "connect" ]; then 
  tmux new-session -s $name -d
fi 

for i in $( seq 0 `expr ${#host_string[@]} - 1 ` )

do
  val=`expr \( $i % 4 \) + 1 `
  idCount=` expr $i / 4 + 1 + 360000 `
  tmux_name="$name:$i"
  #tmux neww -a -n "$client" -t $name
  if [ "$1" == "connect" ]; then 
  tmux new-window -n "$i" -t "$name" -d
  tmux send -t $tmux_name "ssh  ${host_string[i]}" Enter
elif [ "$1" == "init" ]; then
  tmux send -t $tmux_name "git clone  https://github.com/litrane/docker-lab1.git " Enter
  tmux send -t $tmux_name "cd docker-lab1" Enter
  #tmux send -t $tmux_name "nohup ./earthd start --home=./workspace/earth/validator${i} > output 2>&1 & " Enter
elif [ "$1" == "start" ]; then
  tmux send -t $tmux_name "ps -ef | grep theta| grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
  tmux send -t $tmux_name "cd ~/docker-lab1/theta" Enter
  tmux send -t $tmux_name "nohup ./theta-eth-rpc-adaptor start --config=./thetasub_eth_rpc_adaptor  > output 2>&1 &  " Enter
  tmux send -t $tmux_name "nohup ./thetasubchain start --config=./allsubchains/DSN_$idCount/node${val}/ --password=qwe  > ./output.log 2>&1 & " Enter
  echo "DSN_$idCount"
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
  tmux send -t $tmux_name "kill -9 $(pidof theta)" Enter
fi

  echo "start node${val}!"
  

done

