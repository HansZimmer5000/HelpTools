#!/bin/sh
set -e #Exit on error

# Date in format of DDMMYYYY (D = Day, M = Month, Y = Year)
PWD_DIR=$pwd
FILE_NAME="powertop_$(date +'%d_%m_%Y')"
DIR="."

echo "Creating new Powertop file with name: $FILE_NAME"
echo "Creating File in: $DIR"
echo # Empty Line

cd $DIR
sudo powertop --csv="$FILE_NAME.csv"
sudo powertop --html="$FILE_NAME.html" 
cd $PWD_DIR
