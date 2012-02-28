#!/bin/bash

cd $1
for lf in *app*.log; do
  ../vmplot.py -t $lf -s $(wc -l $lf) -k 1024 -m 4096 $lf
done
for lf in *lb*.log *db*log; do
  ../vmplot.py -t $lf -s $(wc -l $lf) -k 1024 -m 2048 $lf
done
ls -1 *.png |sort |sed -e 's/^/<img src="/' -e 's/$/"><br>/' >index.html
cd ..

