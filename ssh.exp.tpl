#!/usr/bin/expect
send_user "$argv0 [lrange $argv 0 2]\n"

set timeout 100
set host [lindex $argv 0]
set cmd  [lindex $argv 1]

spawn ssh $host 
expect {
	"yes/no" {
		send "yes\r";exp_continue
	}
	"*?assword:*" { 
		send "%%password%%\r"
	}
}

expect "*"
send "\r"

expect "*$$"
send "$cmd\r" 

expect {
	"*?assword*" {
		send "%%password%%\r";exp_continue
	}  

	"*$$" {
		send  "\r"
	}
}

send "exit\r"

expect eof
#interact
