#!/bin/sh
# http://qiita.com/tukiyo3/items/928d1902db6372e491c2
FULLPATH=$(cd `dirname $0`; pwd)/`basename $0`
DIR=`dirname $FULLPATH`
if [ "$1" = "" ];then
	echo "Input parametor CONTAINER"
else
	CONTAINER=$1
	BOOT=/etc/systemd/system/$CONTAINER.service
	sudo systemctl disable $CONTAINER
	sudo rm $BOOT
fi
