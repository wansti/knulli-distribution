#!/bin/bash
# Suspend or shutdown

# Paths
POWER_BUTTON_STATE="/var/run/power-button-state.flag"
LOCK_FILE="/var/run/power-button-script.lock"
RUMBLE_FILE="/sys/class/power_supply/axp2202-battery/moto"

# Threshold for long press to shutdown (some boards cut power when power button is held too long)
LONG_PRESS_THRESHOLD=3

suspend_system() {
    pm-is-supported --suspend && pm-suspend
}

shutdown_system() {
    /usr/bin/poweroff.sh
}

exec 200>"${LOCK_FILE}"
flock -n 200 || exit 1

# Handle button press
echo "1" > "$POWER_BUTTON_STATE"

START_TIME=$(date +%s)
while true; do
    sleep 0.1  # Check the power button state every 0.1 seconds
    
    if [ "$(cat ${POWER_BUTTON_STATE})" = "0" ]; then
        # Power button released
        suspend_system  
        break
    fi

    CURRENT_TIME=$(date +%s)
    DURATION=$((CURRENT_TIME - START_TIME))
    
    if [ "${DURATION}" -ge "${LONG_PRESS_THRESHOLD}" ]; then
        echo 1 > "$RUMBLE_FILE" && sleep 0.1 && echo 0 > "$RUMBLE_FILE"
		shutdown_system
        break
    fi
done

flock -u 200
rm -f "${LOCK_FILE}"

exit 0
