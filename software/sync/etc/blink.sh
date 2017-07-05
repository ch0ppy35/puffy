#!/bin/sh
cd /sys/class/gpio

i=0
cheekstate=0
while true; do
	if [ $(($i % 10)) -eq 0 ]; then
		echo $((1 - $cheekstate)) > gpio38/value
		cheekstate=$((1-$cheekstate))
	fi
	i=$(($i + 1))
	for x in 37 39 40 41 42 43; do
		n=65536
		while [ $n -ge 65536 ]; do
			n=1$(</dev/urandom tr -dc 0-9 | dd bs=5 count=1 2>/dev/null)
			n=$((n-100000))
		done
		cd gpio$x
		if [ $n -lt 32767 ]; then
			echo 1 > value
		else
			echo 0 > value
		fi
		cd ..
	done
done


