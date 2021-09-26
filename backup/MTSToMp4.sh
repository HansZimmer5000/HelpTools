!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
	exit
fi

size="1920x1080"
size="1280x720"
frames=30
frames=25

ffmpeg -i "$1" -s "$size" -r "$frames" "$2"