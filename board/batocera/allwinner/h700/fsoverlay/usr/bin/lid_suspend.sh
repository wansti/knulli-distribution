#!/bin/bash

HALLKEY=/sys/class/power_supply/axp2202-battery/hallkey

while true; do
	if [ "$(cat $HALLKEY)" = "0" ]; then
		pm-is-supported --suspend && pm-suspend
	fi
	sleep 1
done
