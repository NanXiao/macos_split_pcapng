#!/usr/bin/awk -f

BEGIN {
	capture_file_name = ENVIRON["CAPTURE_FILE_NAME"]
	split_dir_name = ENVIRON["SPLIT_DIR_NAME"]
}

# Input format is:
# 18:09:35.520766 (proc mDNSResponder:105) IP 192.168.4.119.5353 > 224.0.0.251.5353: UDP, length 167
$2 == "(proc" {
	proc_name_id = substr($3, 1, length($3) - 1);
	colon_index = index(proc_name_id, ":");
	proc_name = substr(proc_name_id, 1, colon_index - 1);
	proc_id = substr(proc_name_id, colon_index + 1, length($3) - 1 - colon_index);
	array[proc_id] = proc_name;
}

END {
	# Create a sub-directory for every process in split_dir_name, and the name
	# of sub-directory is procname-pid. Then save the extracted pcapng file of 
	# this process in the sub-directory. So the full path of every generated 
	# pcapng file is : split_dir_name/procname-pid/procname-pid.pcapng.
	for (proc_id in array)
	{	
		if (array[proc_id] == "")
		{
			sub_dir_name = proc_id;
		}
		else
		{
			sub_dir_name = array[proc_id] "-" proc_id;
		}
		create_sub_dir_cmd = "mkdir -p " split_dir_name "/" sub_dir_name
		system(create_sub_dir_cmd)

		split_file_name = sub_dir_name ".pcapng"
		split_cmd = "tcpdump -r " capture_file_name " -Q pid=" proc_id " -w " split_dir_name "/" sub_dir_name "/" split_file_name
		system(split_cmd)
	}
}
