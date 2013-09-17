#!/bin/sh
#
# Transfer and install the tarballs generated by make-libs
#
DRONE_IP=192.168.1.1
if [ "$#" = 1 ]
then
    DRONE_IP=$1
fi

ftp $DRONE_IP <<EOF
olof_palme
put edrone.tgz
put gpio.tgz
put i2c.tgz
put uart.tgz
EOF

# Telnet time
nc -t $DRONE_IP 23 <<EOF
cd /data/erlang/lib
rm -rf edrone gpio i2c uart
tar xzf /data/video/gpio.tgz
tar xzf /data/video/uart.tgz
tar xzf /data/video/i2c.tgz
tar xzf /data/video/edrone.tgz
rm /data/video/gpio.tgz
rm /data/video/uart.tgz
rm /data/video/i2c.tgz
rm /data/video/edrone.tgz
EOF
