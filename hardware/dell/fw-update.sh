#!/usr/bin/expect -f

# this expects to have a tftp server running at source and exposing firmimgFIT.d9 at /

set host [lindex $argv 0]
set pass [lindex $argv 1]
set source [lindex $argv 2]
set timeout 3600
spawn ssh $host
expect "password: "
send "$pass\r"
expect ">"
send "racadm fwupdate -a $source -d / -g -u\r"
expect ">"
