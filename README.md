# macos_split_pcapng

This is a simple tool which works in `macOS` to split [pcapng](https://github.com/pcapng/pcapng) file based on interface, process ID and `TCP` flow.

## Dependency

This tool will invoke `tshark` command, so please install [Wireshark](https://www.wireshark.org/) on your `macOS`.

## Usage

```
$ ./macos_split_pcapng.sh xxxxxx.pcapng split_dir
```

The second parameter is the input `pcapng` file which will be split, and the third parameter is the directory which contains the generated `pcapng` files. E.g.:

```
$ ./macos_split_pcapng.sh ~/Downloads/capture.pcapng ~/Downloads/pcap_ng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/577/577.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/577/577.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/577/577.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/MobileSafari-571/MobileSafari-571.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/cloudd-115/cloudd-115.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/cloudd-115/cloudd-115.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/cloudd-115/cloudd-115.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/cloudd-115/cloudd-115.pcapng
reading from PCAP-NG file /Users/nanxiao/Downloads/pcap_ng/pdp_ip0/com.apple.WebKit-573/com.apple.WebKit-573.pcapng
......
```

Check `~/Downloads/pcapng` directory:  

```
ll -R ~/Downloads/pcap_ng
total 0
drwxr-xr-x   2 nanxiao  staff    64B Apr  1 18:26 ap1
drwxr-xr-x   2 nanxiao  staff    64B Apr  1 18:26 en1
drwxr-xr-x  12 nanxiao  staff   384B Apr  1 18:26 pdp_ip0

/Users/nanxiao/Downloads/pcap_ng/ap1:

/Users/nanxiao/Downloads/pcap_ng/en1:

/Users/nanxiao/Downloads/pcap_ng/pdp_ip0:
total 0
drwxr-xr-x  6 nanxiao  staff   192B Apr  1 18:26 577
drwxr-xr-x  4 nanxiao  staff   128B Apr  1 18:26 MobileSafari-571
drwxr-xr-x  7 nanxiao  staff   224B Apr  1 18:26 cloudd-115
drwxr-xr-x  6 nanxiao  staff   192B Apr  1 18:26 com.apple.WebKit-573
drwxr-xr-x  3 nanxiao  staff    96B Apr  1 18:26 mDNSResponder-114
drwxr-xr-x  4 nanxiao  staff   128B Apr  1 18:26 networkservicepr-164
drwxr-xr-x  8 nanxiao  staff   256B Apr  1 18:26 nsurlsessiond-92
drwxr-xr-x  4 nanxiao  staff   128B Apr  1 18:26 parsecd-145
......
```

In `~/Downloads/pcapng`, there will be sub-directories for every interface in `pcapng` fie. Under interface folder, for every process, there is a sub-directory which name is `procname-pid`. Under this sub-directory, there is a `procname-pid.pcapng` which contains all packets related to the process whose ID is `pid`; and every `TCP` flow of the process has another separated file which name is `procname-pid-srcIP:srcPort-dstIP:dstPort.pcapng`. E.g.:

```
/Users/nanxiao/Downloads/pcap_ng/pdp_ip0/trustd-123:
total 32
-rw-r--r--  1 nanxiao  staff   3.9K Apr  1 18:32 trustd-123-10.150.79.109:56597-192.124.249.24:80.pcapng
-rw-r--r--  1 nanxiao  staff   3.9K Apr  1 18:32 trustd-123-10.150.79.109:56598-192.124.249.24:80.pcapng
-rw-r--r--  1 nanxiao  staff   7.7K Apr  1 18:31 trustd-123.pcapng
```
