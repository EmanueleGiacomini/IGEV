#!/bin/bash

# Check if the directory path argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <data_directory> <IGEV_directory>"
    exit 1
fi

# Assigning the first argument to the variable data_dir
data_dir=$1
source_dir=$2

# Check if the provided directory exists
if [ ! -d "$data_dir" ]; then
    echo "Error: Directory '$data_dir' not found."
    exit 1
fi

if [ ! -d "$source_dir" ]; then
        echo "Error: Directory '$source_dir' not found."
        exit 1
fi

echo "Data Directory: '$data_dir'"
echo "Source Directory: '$source_dir'"
# Run the Docker container with the provided data directory mounted
# docker run -v "$data_dir":/data <your_docker_image_name>
docker run -it --rm --gpus all \
	-v "$data_dir":/workspace/data \
	-v "$source_dir":/workspace/IGEV \
	--shm-size=12gb \
	--env="DISPLAY" --net=host \
	igev:latest
~
~

