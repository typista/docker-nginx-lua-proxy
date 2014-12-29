#!/bin/sh
# http://qiita.com/tukiyo3/items/928d1902db6372e491c2
FULLPATH=$(cd `dirname $0`; pwd)/`basename $0`
DIR=`dirname $FULLPATH`
if [ "$1" = "" ];then
	echo "Input parametor SERVICE"
else
	CONTAINER=$1
	BOOT=/etc/systemd/system/$CONTAINER.service
	echo "[Unit]" | sudo tee $BOOT
	echo "Description=$CONTAINER" | sudo tee -a $BOOT
	echo "After=docker.service" | sudo tee -a $BOOT
	echo "Requires=docker.service" | sudo tee -a $BOOT
	echo "[Service]" | sudo tee -a $BOOT
	echo "ExecStart=/usr/bin/docker start $CONTAINER" | sudo tee -a $BOOT
	echo "[Install]" | sudo tee -a $BOOT
	echo "WantedBy=multi-user.target" | sudo tee -a $BOOT
	sudo systemctl enable $CONTAINER
fi
