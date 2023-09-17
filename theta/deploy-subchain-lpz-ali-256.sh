#!/bin/bash

#host_string=("pzl97@apt098.apt.emulab.net" "pzl97@apt111.apt.emulab.net" "pzl97@apt107.apt.emulab.net" "pzl97@apt116.apt.emulab.net")
# host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")

host_string=(" root@172.25.148.1" " root@172.25.148.2" " root@172.25.148.3" " root@172.25.148.4" " root@172.25.148.5" " root@172.25.148.6" " root@172.25.148.7" " root@172.25.148.8" " root@172.25.148.9" " root@172.25.148.10" " root@172.25.148.11" " root@172.25.148.12" " root@172.25.148.13" " root@172.25.148.14" " root@172.25.148.15" " root@172.25.148.16" " root@172.25.148.17" " root@172.25.148.18" " root@172.25.148.19" " root@172.25.148.20" " root@172.25.148.21" " root@172.25.148.22" " root@172.25.148.23" " root@172.25.148.24" " root@172.25.148.25" " root@172.25.148.26" " root@172.25.148.27" " root@172.25.148.28" " root@172.25.148.29" " root@172.25.148.30" " root@172.25.148.31" " root@172.25.148.32" " root@172.25.148.33" " root@172.25.148.34" " root@172.25.148.35" " root@172.25.148.36" " root@172.25.148.37" " root@172.25.148.38" " root@172.25.148.39" " root@172.25.148.40" " root@172.25.148.41" " root@172.25.148.42" " root@172.25.148.43" " root@172.25.148.44" " root@172.25.148.45" " root@172.25.148.46" " root@172.25.148.47" " root@172.25.148.48" " root@172.25.148.49" " root@172.25.148.50" " root@172.25.148.51" " root@172.25.148.52" " root@172.25.148.53" " root@172.25.148.54" " root@172.25.148.55" " root@172.25.148.56" " root@172.25.148.57" " root@172.25.148.58" " root@172.25.148.59" " root@172.25.148.60" " root@172.25.148.61" " root@172.25.148.62" " root@172.25.148.63" " root@172.25.148.64" " root@172.25.148.65" " root@172.25.148.66" " root@172.25.148.67" " root@172.25.148.68" " root@172.25.148.69" " root@172.25.148.70" " root@172.25.148.71" " root@172.25.148.72" " root@172.25.148.73" " root@172.25.148.74" " root@172.25.148.75" " root@172.25.148.76" " root@172.25.148.77" " root@172.25.148.78" " root@172.25.148.79" " root@172.25.148.80" " root@172.25.148.81" " root@172.25.148.82" " root@172.25.148.83" " root@172.25.148.84" " root@172.25.148.85" " root@172.25.148.86" " root@172.25.148.87" " root@172.25.148.88" " root@172.25.148.89" " root@172.25.148.90" " root@172.25.148.91" " root@172.25.148.92" " root@172.25.148.93" " root@172.25.148.94" " root@172.25.148.95" " root@172.25.148.96" " root@172.25.148.97" " root@172.25.148.98" " root@172.25.148.99" " root@172.25.148.100" " root@172.25.148.101" " root@172.25.148.102" " root@172.25.148.103" " root@172.25.148.104" " root@172.25.148.105" " root@172.25.148.106" " root@172.25.148.107" " root@172.25.148.108" " root@172.25.148.109" " root@172.25.148.110" " root@172.25.148.111" " root@172.25.148.112" " root@172.25.148.113" " root@172.25.148.114" " root@172.25.148.115" " root@172.25.148.116" " root@172.25.148.117" " root@172.25.148.118" " root@172.25.148.119" " root@172.25.148.120" " root@172.25.148.121" " root@172.25.148.122" " root@172.25.148.123" " root@172.25.148.124" " root@172.25.148.125" " root@172.25.148.126" " root@172.25.148.127" " root@172.25.148.128" " root@172.25.148.129" " root@172.25.148.130" " root@172.25.148.131" " root@172.25.148.132" " root@172.25.148.133" " root@172.25.148.134" " root@172.25.148.135" " root@172.25.148.136" " root@172.25.148.137" " root@172.25.148.138" " root@172.25.148.139" " root@172.25.148.140" " root@172.25.148.141" " root@172.25.148.142" " root@172.25.148.143" " root@172.25.148.144" " root@172.25.148.145" " root@172.25.148.146" " root@172.25.148.147" " root@172.25.148.148" " root@172.25.148.149" " root@172.25.148.150" " root@172.25.148.151" " root@172.25.148.152" " root@172.25.148.153" " root@172.25.148.154" " root@172.25.148.155" " root@172.25.148.156" " root@172.25.148.157" " root@172.25.148.158" " root@172.25.148.159" " root@172.25.148.160" " root@172.25.148.161" " root@172.25.148.162" " root@172.25.148.163" " root@172.25.148.164" " root@172.25.148.165" " root@172.25.148.166" " root@172.25.148.167" " root@172.25.148.168" " root@172.25.148.169" " root@172.25.148.170" " root@172.25.148.171" " root@172.25.148.172" " root@172.25.148.173" " root@172.25.148.174" " root@172.25.148.175" " root@172.25.148.176" " root@172.25.148.177" " root@172.25.148.178" " root@172.25.148.179" " root@172.25.148.180" " root@172.25.149.1" " root@172.25.149.2" " root@172.25.149.3" " root@172.25.149.4" " root@172.25.149.5" " root@172.25.149.6" " root@172.25.149.7" " root@172.25.149.8" " root@172.25.149.9" " root@172.25.149.10" " root@172.25.149.11" " root@172.25.149.12" " root@172.25.149.13" " root@172.25.149.14" " root@172.25.149.15" " root@172.25.149.16" " root@172.25.149.17" " root@172.25.149.18" " root@172.25.149.19" " root@172.25.149.20" " root@172.25.149.21" " root@172.25.149.22" " root@172.25.149.23" " root@172.25.149.24" " root@172.25.149.25" " root@172.25.149.26" " root@172.25.149.27" " root@172.25.149.28" " root@172.25.149.29" " root@172.25.149.30" " root@172.25.149.31" " root@172.25.149.32" " root@172.25.149.33" " root@172.25.149.34" " root@172.25.149.35" " root@172.25.149.36" " root@172.25.149.37" " root@172.25.149.38" " root@172.25.149.39" " root@172.25.149.40" " root@172.25.149.41" " root@172.25.149.42" " root@172.25.149.43" " root@172.25.149.44" " root@172.25.149.45" " root@172.25.149.46" " root@172.25.149.47" " root@172.25.149.48" " root@172.25.149.49" " root@172.25.149.50" " root@172.25.149.51" " root@172.25.149.52" " root@172.25.149.53" " root@172.25.149.54" " root@172.25.149.55" " root@172.25.149.56" " root@172.25.149.57" " root@172.25.149.58" " root@172.25.149.59" " root@172.25.149.60" " root@172.25.149.61" " root@172.25.149.62" " root@172.25.149.63" " root@172.25.149.64" " root@172.25.149.65" " root@172.25.149.66" " root@172.25.149.67" " root@172.25.149.68" " root@172.25.149.69" " root@172.25.149.70" " root@172.25.149.71" " root@172.25.149.72" " root@172.25.149.73" " root@172.25.149.74" " root@172.25.149.75" " root@172.25.149.76"  )
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
  tmux send -t $tmux_name "nohup ./theta-eth-rpc-adaptor start --config=./thetasub_eth_rpc_adaptor  > adaoutput 2>&1 &  " Enter
  tmux send -t $tmux_name "nohup ./tsub_update_256 start --config=./subchain_ipdps_256/DSN_$idCount/node${val}/ --password=qwe  > ./output.log 2>&1 & " Enter
  echo "DSN_$idCount"
elif [ "$1" == "run" ]; then  
  if [ "$val" == "1" ]; then
    tmux send -t $tmux_name "nohup ./aliclient ${idCount} 10 10 > subwit.log 2>&1 &" Enter
    if [ "$idCount" == "360001" ]; then
      tmux send -t $tmux_name "nohup ./aliclient 0 > mainwit.log 2>&1 &" Enter
    fi
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

