#!/bin/bash

cd $1
for lf in *app*.log; do
  ../vmplot.py -s $(wc -l $lf) -k 1024 -m 4096 -t $lf $lf
done
for lf in *lb*.log *db*log; do
  ../vmplot.py -s $(wc -l $lf) -k 1024 -m 2048 -t $lf $lf
done
ls -1 *.png |sort |sed -e 's/^/<img src="/' -e 's/$/"><br>/' >index.html
cd ..

