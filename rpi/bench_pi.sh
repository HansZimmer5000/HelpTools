#!/bin/bash

ssh hape@192.168.1.145 "sysbench --test=cpu --cpu-max-prime=10000 --num-threads=4 run >> /home/hape/$(date +%F-%H-%M-%S)_bench.log &"

#scp hape@192.168.1.145:/home/hape/res.log res.log.csv
#scp hape@192.168.1.145:/home/hape/*_bench.log ./