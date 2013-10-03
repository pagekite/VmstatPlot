#!/bin/bash

LINES="$1"
[ "$LINES" = "" ] && LINES="8640"

mkdir logs
tail -n $LINES /var/log/sys_stat.log >logs/$(hostname -s).log
for a in rs-kosning-{lb-01,db-01,db-02,app-02}.reykjavik.is; do
   ssh kosning@$a "tail -n $LINES /var/log/sys_stat.log" >logs/$a.log
done

./graph.sh logs

mv logs logs-$(date +%Y-%m-%d.%s)

