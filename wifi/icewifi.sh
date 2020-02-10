#!/usr/bin/env sh

# Script is from: https://kuttler.eu/code/ice-wlan-linux-docker/

CMD=$1

if [ ! ${EUID} = 0 ]; then
  echo "Your are not root, will try to use sudo.."
  PREFIX=/usr/bin/sudo
else
  PREFIX=
fi

if [ "${CMD}" = "off" ]; then
  echo "Off, starting docker"
  ${PREFIX} systemctl start docker.service
  ${PREFIX} systemctl start docker.socket
elif [ "${CMD}" = "on" ]; then
  echo "On, stopping docker"
  ${PREFIX} docker kill $(docker ps -qa)
  ${PREFIX} docker network prune --force
  ${PREFIX} systemctl stop docker.service
  ${PREFIX} systemctl stop docker.socket
  echo "Connect to the Wifi network now and open https://iceportal.de/"
else
  cat<<EOF

This script solves the problem that you can not connect to the free Wifi in ICE
trains because docker network conflicts with DB network by default. It will
kill all docker containers, delete all networks, and shut down the services

Usage: ./ice_wlan_docker_linux.sh [on|off]

EOF
fi
