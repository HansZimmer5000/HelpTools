# WIFI

The `icewifi.sh` scripts deactivates docker and its bridge network to make it possible to connect with the Deutsche Bahn ICE Wifi.
This is kind of necessary since docker and the wifi are on the same IP range!

If dockers bridge network is set on a custom (!= default) IP, this script is not necessary.
