#!/bin/bash
if [ "$1" == "connect" ]; then 
./deploy-subchain.sh connect
./deploy-mainchain.sh connect
elif [ "$1" == "kill" ]; then
tmux kill-session -t deploy-theta2
tmux kill-session -t deploy-theta1
elif [ "$1" == "start" ]; then
./deploy-mainchain.sh start
./deploy-subchain.sh start
fi