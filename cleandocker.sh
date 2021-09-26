#!/bin/bash

images=$(docker images -q)
images_to_delete=""

for image in $images; do
    images_to_delete="$images_to_delete $image"
done

if [ -z "$images_to_delete" ]; then
    echo "No Images to delete"
    exit 1
fi

read -p "Deleting $images_to_delete? (y/n) "

if [ "$REPLY" = "y" ]; then
    docker rmi -f $images_to_delete
fi
