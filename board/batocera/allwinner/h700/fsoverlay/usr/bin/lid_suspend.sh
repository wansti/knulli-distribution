#!/bin/bash

HALLKEY="/sys/class/power_supply/axp2202-battery/hallkey"
POWER_BUTTON_STATE="/var/run/power-button-state.flag"

while true; do
	if [ "$(cat $HALLKEY)" = "0" ]; then
		pm-is-supported --suspend && pm-suspend
		# reset power button state on wakeup
		echo "0" > "$POWER_BUTTON_STATE"
	fi
	sleep 1
done
