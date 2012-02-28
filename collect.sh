#!/bin/bash

mkdir logs
cp vmstat.log logs/$(hostname -s).log
for a in rs-kosning-{lb-01,db-01,db-02,app-02}; do
   ssh $a 'tail -8640 vmstat.log' >logs/$a.log
done

./graph.sh logs

mv logs logs-$(date +%s)

