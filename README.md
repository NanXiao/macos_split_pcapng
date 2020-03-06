# macos_split_pcapng

This is a simple tool which works in `macos` to split [pcapng](https://github.com/pcapng/pcapng) file based on process ID.  

## Usage

```
$ ./macos_split_pcapng.sh xxxxxx.pcapng split_dir
```

The second parameter is the input `pcapng` file which will be split. The third parameter is the directory which contains the generated `pcapng` files. For every generated `pcapng` file, its name format is `procname-pid.pcapng`.

Example:  

```
$ ./macos_split_pcapng.sh ~/Downloads/capture.pcapng ~/Downloads/pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/capture.pcapng
```

Check `~/Downloads/pcapng` directory:  

```
ll ~/Downloads/pcapng
total 4912
-rw-r--r--  1 nanxiao  staff    11K Mar  6 11:26 IMRemoteURLConne-413.pcapng
-rw-r--r--  1 nanxiao  staff    10K Mar  6 11:26 apsd-107.pcapng
-rw-r--r--  1 nanxiao  staff   7.1K Mar  6 11:26 com.apple.Safari-237.pcapng
-rw-r--r--  1 nanxiao  staff   992B Mar  6 11:26 configd-32.pcapng
-rw-r--r--  1 nanxiao  staff   2.3M Mar  6 11:26 mDNSResponder-105.pcapng
-rw-r--r--  1 nanxiao  staff   7.5K Mar  6 11:26 nsurlsessiond-88.pcapng
-rw-r--r--  1 nanxiao  staff    13K Mar  6 11:26 syncdefaultsd-411.pcapng
-rw-r--r--  1 nanxiao  staff   1.1K Mar  6 11:26 timed-58.pcapng
```
