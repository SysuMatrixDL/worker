#!/bin/sh
DIR="dbdata"
# 初始化open-gauss数据卷目录
if [ ! -d "$DIR" ]; then
    tar -zxvf dbdata.tar.gz -C .
fi
# 启动docker-compose
sudo docker-compose up -d
# 启动top
nohup python top.py > top.log &