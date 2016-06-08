#!/usr/bin/expect
send_user "$argv0 [lrange $argv 0 2]\n"

set timeout 100
set localfile [lindex $argv 0]
set remotefile [lindex $argv 1]

spawn scp -r $localfile $remotefile 
expect {
	"yes/no" {
		send "yes\r";exp_continue
	}
	"assword:*" { 
		send "%%password%%\r"
	}
}
#interact
expect eof
