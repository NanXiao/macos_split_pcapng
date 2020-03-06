#!/bin/sh

if [ $# -ne 2 ]
then
	echo "Usage: ./macos_split_pcapng.sh xxxxxx.pcapng split_dir"
	exit 1
else
	export CAPTURE_FILE_NAME=$1
	export SPLIT_DIR_NAME=$2
fi

mkdir -p "${SPLIT_DIR_NAME}"
tcpdump -k PN -qnr "$1" | ./split_based_on_pid.awk
