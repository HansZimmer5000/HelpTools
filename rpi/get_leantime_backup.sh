#!/bin/bash

scp hape@192.168.1.37:/home/hape/backup.sql ./backup_$(date +%F-%H-%M).sql
scp hape@192.168.1.37:/home/hape/backup2.sql ./backup2_$(date +%F-%H-%M).sql