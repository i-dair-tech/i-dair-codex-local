#!/bin/bash

createDirectory() {
  dir_name=$1
  if [ ! -d "$dir_name" ]; then
    mkdir "$dir_name"
    chmod 0777 "$dir_name" # ughh
    echo "$dir_name directory created successfully!"
  else
    echo "$dir_name directory already exists."
  fi
}

dataset_dir="./dataset"
mlruns_dir="./mlruns"
logs_dir="./logs"

createDirectory $dataset_dir
createDirectory $mlruns_dir
createDirectory $logs_dir

docker compose -p i-dair-codex up -d