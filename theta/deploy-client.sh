#!/bin/bash

#host_string=(" -p 22 pzl97@apt190.apt.emulab.net" " -p 22 pzl97@apt184.apt.emulab.net" " -p 22 pzl97@apt189.apt.emulab.net" " -p 22 pzl97@apt185.apt.emulab.net")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" " root@10.10.1.9" " root@10.10.1.10" " root@10.10.1.11" " root@10.10.1.12")
#host_string=(" root@10.10.1.5" " root@10.10.1.6" " root@10.10.1.7" " root@10.10.1.8" )
host_string=("pzl97@apt178.apt.emulab.net" "pzl97@apt169.apt.emulab.net" "pzl97@apt153.apt.emulab.net" "pzl97@apt101.apt.emulab.net" "pzl97@apt111.apt.emulab.net" "pzl97@apt175.apt.emulab.net" "pzl97@apt158.apt.emulab.net" "pzl97@apt095.apt.emulab.net" "pzl97@apt180.apt.emulab.net" "pzl97@apt181.apt.emulab.net" "pzl97@apt157.apt.emulab.net" "pzl97@apt176.apt.emulab.net" "pzl97@apt163.apt.emulab.net" "pzl97@apt108.apt.emulab.net" "pzl97@apt079.apt.emulab.net" "pzl97@apt142.apt.emulab.net" "pzl97@apt144.apt.emulab.net" "pzl97@apt182.apt.emulab.net" "pzl97@apt189.apt.emulab.net" "pzl97@apt156.apt.emulab.net" "pzl97@apt152.apt.emulab.net" "pzl97@apt184.apt.emulab.net" "pzl97@apt083.apt.emulab.net" "pzl97@apt179.apt.emulab.net" "pzl97@apt130.apt.emulab.net" "pzl97@apt185.apt.emulab.net" "pzl97@apt192.apt.emulab.net" "pzl97@apt138.apt.emulab.net" "pzl97@apt105.apt.emulab.net" "pzl97@apt129.apt.emulab.net" "pzl97@apt099.apt.emulab.net" "pzl97@apt145.apt.emulab.net" "pzl97@apt110.apt.emulab.net" "pzl97@apt077.apt.emulab.net" "pzl97@apt137.apt.emulab.net" "pzl97@apt154.apt.emulab.net" "pzl97@apt162.apt.emulab.net" "pzl97@apt149.apt.emulab.net" "pzl97@apt159.apt.emulab.net" "pzl97@apt119.apt.emulab.net" "pzl97@apt092.apt.emulab.net" "pzl97@apt170.apt.emulab.net" "pzl97@apt146.apt.emulab.net" "pzl97@apt188.apt.emulab.net" "pzl97@apt085.apt.emulab.net" "pzl97@apt167.apt.emulab.net" "pzl97@apt147.apt.emulab.net" "pzl97@apt177.apt.emulab.net" "pzl97@apt141.apt.emulab.net" "pzl97@apt082.apt.emulab.net" "pzl97@apt097.apt.emulab.net" "pzl97@apt133.apt.emulab.net" "pzl97@apt161.apt.emulab.net" "pzl97@apt190.apt.emulab.net" "pzl97@apt187.apt.emulab.net" "pzl97@apt150.apt.emulab.net" "pzl97@apt136.apt.emulab.net" "pzl97@apt174.apt.emulab.net" "pzl97@apt094.apt.emulab.net" "pzl97@apt089.apt.emulab.net")
name="deploy-client"

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
  tmux send -t $tmux_name "ssh ${host_string[i]}" Enter
# elif [ "$1" == "init" ]; then
#   tmux send -t $tmux_name "git clone  https://github.com/litrane/docker-lab1.git " Enter
#   tmux send -t $tmux_name "cd docker-lab1" Enter
#   #tmux send -t $tmux_name "nohup ./earthd start --home=./workspace/earth/validator${i} > output 2>&1 & " Enter
elif [ "$1" == "start" ]; then
  tmux send -t $tmux_name "cd ~/docker-lab1/theta" Enter
  startID=`expr \( $i % 4 \) \* 4  `
  tmux send -t $tmux_name "nohup ./tpsclient $startID CrossChain $idCount 0 > output0 2>&1 &" Enter
  startID=`expr \( $startID + 1 \)  `
  tmux send -t $tmux_name "nohup ./tpsclient $startID CrossChain $idCount 0 > output1 2>&1 & " Enter
  startID=`expr \( $startID + 1 \)  `
  tmux send -t $tmux_name "nohup ./tpsclient $startID CrossChain $idCount 0 > output2 2>&1 & " Enter
  startID=`expr \( $startID + 1 \)  `
  tmux send -t $tmux_name "nohup ./tpsclient $startID CrossChain $idCount 0 > output3 2>&1 & " Enter
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

