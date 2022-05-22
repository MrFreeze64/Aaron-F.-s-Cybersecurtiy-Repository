                                                                                                                                                               
#!/bin/bash

echo -e "Date $(date) \n"

echo  "uname"

uname -a

echo "IP address" ip addr

ip addr | head -9  | tail -1

echo  "hostname"

echo $HOSTNAME

