FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive; apt-get update; apt-get install --no-install-recommends --no-install-suggests -y wine winetricks winbind

RUN apt-get clean; apt-get autoremove; apt-get purge; apt-get autoclean
