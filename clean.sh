#!/bin/bash

while read p; do
	wget -N $p -P in/
done <list

for f in in/* ; do
	sed -i '/127.0.0.0\/8/d' $f
	sed -i '/192.168.0.0\/16/d' $f
	sed -i '/10.0.0.0\/8/d' $f
	sed -i '/172.16.0.0\/12/d' $f
	sed -i '/224.0.0.0\/3/d' $f
	sed -i '/213.230.210.230/d' $f
	mv $f blacklist/
done
#facebook
whois -h whois.radb.net -- '-i origin AS32934' | awk '/^route:/ {print $2;}' | sort | uniq > blackist/facebook.netset
#twitch
whois -h whois.radb.net -- '-i origin AS46489' | awk '/^route:/ {print $2;}' | sort | uniq > blackist/twitch.netset
