#!/bin/bash

#host_string=("pzl97@apt098.apt.emulab.net" "pzl97@apt111.apt.emulab.net" "pzl97@apt107.apt.emulab.net" "pzl97@apt116.apt.emulab.net")
# host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8"   )
#host_string=(" root@172.25.148.196" " root@172.25.148.197" " root@172.25.148.198" " root@172.25.148.199" " root@172.25.148.200" " root@172.25.148.201" " root@172.25.148.202" " root@172.25.148.203" " root@172.25.148.204" " root@172.25.148.205" " root@172.25.148.206" " root@172.25.148.207" " root@172.25.148.208" " root@172.25.148.209" " root@172.25.148.210" " root@172.25.148.211" " root@172.25.148.212" " root@172.25.148.213" " root@172.25.148.214" " root@172.25.148.215" " root@172.25.148.216" " root@172.25.148.217" " root@172.25.148.218" " root@172.25.148.219" " root@172.25.148.220" " root@172.25.148.221" " root@172.25.148.222" " root@172.25.148.223" " root@172.25.148.224" " root@172.25.148.225" " root@172.25.148.226" " root@172.25.148.227" " root@172.25.148.228" " root@172.25.148.229" " root@172.25.148.230" " root@172.25.148.231"  " root@172.25.148.232" " root@172.25.148.233" " root@172.25.148.234" " root@172.25.148.235" " root@172.25.148.236" " root@172.25.148.237" " root@172.25.148.238" " root@172.25.148.239" " root@172.25.148.240" " root@172.25.148.241" " root@172.25.148.242" " root@172.25.148.243" " root@172.25.148.244" " root@172.25.148.245" " root@172.25.148.246" " root@172.25.148.247" " root@172.25.148.248" " root@172.25.148.249" " root@172.25.148.250" " root@172.25.148.251" " root@172.25.148.252" " root@172.25.148.253" " root@172.25.148.254" " root@172.25.148.255" " root@172.25.149.0" " root@172.25.149.1" " root@172.25.149.2" " root@172.25.149.3")
# 一直持有的地址
#host_string=(" root@172.25.148.196" " root@172.25.148.197")

host_string=(" root@172.25.149.35" " root@172.25.149.32" " root@172.25.149.29" " root@172.25.149.33" " root@172.25.149.28" " root@172.25.149.27" " root@172.25.149.34" " root@172.25.149.30" " root@172.25.149.6" " root@172.25.149.18" " root@172.25.149.11" " root@172.25.149.16" " root@172.25.149.26" " root@172.25.149.23" " root@172.25.149.14" " root@172.25.149.7" " root@172.25.149.22" " root@172.25.149.25" " root@172.25.149.10" " root@172.25.149.13" " root@172.25.149.24" " root@172.25.149.31" " root@172.25.149.20" " root@172.25.149.9" " root@172.25.149.15" " root@172.25.149.5" " root@172.25.149.19" " root@172.25.149.8" " root@172.25.149.17" " root@172.25.149.4" " root@172.25.149.21" " root@172.25.149.12" )
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
  tmux send -t $tmux_name "nohup ./aliclient ${idCount} 3 20 > subwit.log 2>&1 &" Enter
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

