#!/usr/bin/env bash
/run.sh &
touch xware_portal.log
tail -f xware_portal.log &
./portal > xware_portal.log
pid=
trap '[[ $pid ]] && kill $pid; ./portal -s; exit 0' SIGINT SIGTERM
while :
do
	sleep 60 & pid=$!
	waitd	pid=

	# 监控重启
        ps -fe | grep ETMDaemon | grep -v grep
        if [ $? -ne 0 ]
        then
                echo "start process....."
                ./portal >> xware_portal.log
                echo "runing....."
        fi
done

