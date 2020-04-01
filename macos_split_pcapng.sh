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

# loop over every procname-pid.pcapng
# sub_dir_name is ${SPLIT_DIR_NAME}/procname-pid
for sub_dir_name in "${SPLIT_DIR_NAME}"/*
do
	# file_name is procname-pid.pcapng
	file_name=$(echo "$sub_dir_name" | awk -F'/' '{print $NF}').pcapng
	export CAPTURE_FILE_NAME=$file_name

	# full_file_name is ${SPLIT_DIR_NAME}/procname-pid/procname-pid.pcapng
	full_file_name=${sub_dir_name}/${file_name}

	stream=0
	while :
	do
		# Check whether this TCP stream is valid
		str=$(tshark -r "${full_file_name}" tcp.stream eq "${stream}")
		if [ -z "$str" ]
		then
			break;
		else
			tshark -r "${full_file_name}" \
			-e ip.src -e tcp.srcport -e ip.dst -e tcp.dstport \
			-T fields tcp.stream eq "${stream}" | head -1 | ./split_based_on_tcp_flow.awk
		fi
		stream=$((stream + 1))
	done
done
