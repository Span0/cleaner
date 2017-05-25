#!/bin/bash
while read p; do
	wget -N $p -P in/
done <list

for f in in/* ; do
	sed -i '/192.168.0.0\/16/d' $f
	sed -i '/10.0.0.0\/8/d' $f
	sed -i '/172.16.0.0\/12/d' $f
	sed -i '/224.0.0.0\/3/d' $f
	mv $f out/
done
