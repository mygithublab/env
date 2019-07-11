#!/bin/bash

folder_str="alicloud-mirror"
dir=./
function create_folder() {
my_dir="$folder_str"

if [ ! -d "$my_dir" ]; then
	echo "creating folder"
	mkdir $my_dir
	echo "folder created"
else 
	echo "folder exist"
fi
}

create_folder;

