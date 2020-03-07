#!/usr/bin/awk -f

BEGIN {
	capture_file_name = ENVIRON["CAPTURE_FILE_NAME"]
	split_dir_name = ENVIRON["SPLIT_DIR_NAME"]
	base_capture_file_name = substr(capture_file_name, 1, length(capture_file_name) - 7);
}

# Input format is: srcIP srcPort dstIP dstPort. E.g,:
# 192.168.4.203 49273 17.57.146.68 5223
{
	tcp_flow_file_name = base_capture_file_name "-" $1 ":" $2 "-" $3 ":" $4 ".pcapng"
	expression = " src host " $1 " and src port " $2 " and dst host " $3 " and dst port " $4 \
	" or \\(dst host " $1 " and dst port " $2 " and src host " $3 " and src port " $4 "\\)"
	tcp_flow_cmd = "tcpdump -r " split_dir_name "/" base_capture_file_name "/" capture_file_name \
	" -w " split_dir_name "/" base_capture_file_name "/" tcp_flow_file_name expression
	system(tcp_flow_cmd)
}
