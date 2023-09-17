#!/bin/bash

# 检查参数数量
if [ "$#" -ne 1 ]; then
    echo "用法: $0 <延迟大小 (例如: 10ms)>"
    exit 1
fi

# 定义网络接口名，例如 eth0 或 ens33
INTERFACE="eth0"
DELAY="$1"

# 使用 tc 清除可能存在的任何旧 qdisc
sudo tc qdisc del dev $INTERFACE root 2> /dev/null

# 使用 tc 添加指定大小的延时
sudo tc qdisc add dev $INTERFACE root netem delay $DELAY

echo "$DELAY 延时已添加到 $INTERFACE 接口"

ping 172.25.149.104 -n 4