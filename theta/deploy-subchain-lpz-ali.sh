#!/bin/bash

#host_string=("pzl97@apt098.apt.emulab.net" "pzl97@apt111.apt.emulab.net" "pzl97@apt107.apt.emulab.net" "pzl97@apt116.apt.emulab.net")
# host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")

host_string=(" root@172.25.149.40" " root@172.25.149.41" )
name="deploy-theta2"

if [ "$1" == "connect" ]; then 
  tmux new-session -s $name -d
fi 

for i in $( seq 0 `expr ${#host_string[@]} - 1 ` )

do
  val=1
  idCount=` expr $i + 1 + 360000 `
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
  tmux send -t $tmux_name "nohup ./theta-eth-rpc-adaptor start --config=./thetasub_eth_rpc_adaptor  > adaoutput 2>&1 &  " Enter
  tmux send -t $tmux_name "nohup ./tsub_update start --config=./subchain_ipdps/DSN_$idCount/node${val}/ --password=qwe  > ./output.log 2>&1 & " Enter
  echo "DSN_$idCount"
elif [ "$1" == "run" ]; then  
  tmux send -t $tmux_name "nohup ./aliclient ${idCount} 3 10 > subwit.log 2>&1 &" Enter
  if [ "$idCount" == "360001" ]; then
    tmux send -t $tmux_name "nohup ./aliclient 0 > mainwit.log 2>&1 &" Enter
  fi
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
  tmux send -t $tmux_name "rm -rf docker-lab1-bak" Enter
elif [ "$1" == "stop" ]; then
  tmux send -t $tmux_name "ps -ef | grep thetasub_eth_rpc_adaptor | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
  tmux send -t $tmux_name "ps -ef | grep aliclient | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
  tmux send -t $tmux_name "ps -ef | grep tsub_update | grep -v grep | awk '{print \$2}' | xargs kill -9" Enter
elif [ "$1" == "kw" ]; then
  tmux send -t $tmux_name "kill -9 $(pidof theta)" Enter
elif [ "$1" == "test" ]; then
  tmux send -t $tmux_name "cd ~/docker-lab1/theta" Enter
  tmux send -t $tmux_name "nohup ./clientipdps $idCount 10 10 > subwit.log 2>&1 &" Enter
fi

  echo "start node${val} in $idCount!"
  

done

