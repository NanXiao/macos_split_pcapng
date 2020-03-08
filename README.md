# macos_split_pcapng

This is a simple tool which works in `macOS` to split [pcapng](https://github.com/pcapng/pcapng) file based on process ID and `TCP` flow.

## Dependency

This tool will invoke `tshark` command, so please install [Wireshark](https://www.wireshark.org/) on your `macOS`.

## Usage

```
$ ./macos_split_pcapng.sh xxxxxx.pcapng split_dir
```

The second parameter is the input `pcapng` file which will be split, and the third parameter is the directory which contains the generated `pcapng` files. E.g.:

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
reading from PCAP-NG file /Users/nanxiao/Downloads/pcapng/IMRemoteURLConne-413/IMRemoteURLConne-413.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcapng/apsd-107/apsd-107.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcapng/com.apple.Safari-237/com.apple.Safari-237.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcapng/nsurlsessiond-88/nsurlsessiond-88.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcapng/syncdefaultsd-411/syncdefaultsd-411.pcapng
```

Check `~/Downloads/pcapng` directory:  

```
ll -R ~/Downloads/pcapng
total 0
drwxr-xr-x  4 nanxiao  staff   128B Mar  7 16:58 IMRemoteURLConne-413
drwxr-xr-x  4 nanxiao  staff   128B Mar  7 16:59 apsd-107
drwxr-xr-x  4 nanxiao  staff   128B Mar  7 16:59 com.apple.Safari-237
drwxr-xr-x  3 nanxiao  staff    96B Mar  7 16:58 configd-32
drwxr-xr-x  3 nanxiao  staff    96B Mar  7 16:58 mDNSResponder-105
drwxr-xr-x  4 nanxiao  staff   128B Mar  7 16:59 nsurlsessiond-88
drwxr-xr-x  4 nanxiao  staff   128B Mar  7 16:59 syncdefaultsd-411
drwxr-xr-x  3 nanxiao  staff    96B Mar  7 16:58 timed-58

/Users/nanxiao/Downloads/pcapng/IMRemoteURLConne-413:
total 48
-rw-r--r--  1 nanxiao  staff    11K Mar  7 16:58 IMRemoteURLConne-413-192.168.4.203:51312-17.125.250.130:443.pcapng
-rw-r--r--  1 nanxiao  staff    11K Mar  7 16:58 IMRemoteURLConne-413.pcapng

/Users/nanxiao/Downloads/pcapng/apsd-107:
total 48
-rw-r--r--  1 nanxiao  staff    10K Mar  7 16:59 apsd-107-192.168.4.203:49273-17.57.146.68:5223.pcapng
-rw-r--r--  1 nanxiao  staff    10K Mar  7 16:58 apsd-107.pcapng

/Users/nanxiao/Downloads/pcapng/com.apple.Safari-237:
total 32
-rw-r--r--  1 nanxiao  staff   7.1K Mar  7 16:59 com.apple.Safari-237-192.168.4.203:51313-172.217.23.138:443.pcapng
-rw-r--r--  1 nanxiao  staff   7.1K Mar  7 16:58 com.apple.Safari-237.pcapng

/Users/nanxiao/Downloads/pcapng/configd-32:
total 8
-rw-r--r--  1 nanxiao  staff   992B Mar  7 16:58 configd-32.pcapng

/Users/nanxiao/Downloads/pcapng/mDNSResponder-105:
total 4784
-rw-r--r--  1 nanxiao  staff   2.3M Mar  7 16:58 mDNSResponder-105.pcapng

/Users/nanxiao/Downloads/pcapng/nsurlsessiond-88:
total 32
-rw-r--r--  1 nanxiao  staff   7.5K Mar  7 16:59 nsurlsessiond-88-192.168.4.203:51310-17.248.147.45:443.pcapng
-rw-r--r--  1 nanxiao  staff   7.5K Mar  7 16:58 nsurlsessiond-88.pcapng

/Users/nanxiao/Downloads/pcapng/syncdefaultsd-411:
total 64
-rw-r--r--  1 nanxiao  staff    13K Mar  7 16:59 syncdefaultsd-411-192.168.4.203:51311-17.248.147.117:443.pcapng
-rw-r--r--  1 nanxiao  staff    13K Mar  7 16:58 syncdefaultsd-411.pcapng

/Users/nanxiao/Downloads/pcapng/timed-58:
total 8
-rw-r--r--  1 nanxiao  staff   1.1K Mar  7 16:58 timed-58.pcapng
```

In `~/Downloads/pcapng`, for every process, there is a sub-directory which name is `procname-pid`. Under this sub-directory, there is a `procname-pid.pcapng` which contains all packets related to the process whose ID is `pid`; and every `TCP` flow of the process has another separated file which name is `procname-pid-srcIP:srcPort-dstIP:dstPort.pcapng`. E.g.:

```
/Users/nanxiao/Downloads/pcapng/syncdefaultsd-411:
total 64
-rw-r--r--  1 nanxiao  staff    13K Mar  7 16:59 syncdefaultsd-411-192.168.4.203:51311-17.248.147.117:443.pcapng
-rw-r--r--  1 nanxiao  staff    13K Mar  7 16:58 syncdefaultsd-411.pcapng
```
