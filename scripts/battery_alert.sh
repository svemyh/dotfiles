#!/bin/bash

# Get the battery percentage
battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Check if the charger is plugged in
ac_power=$(acpi -b | grep -c "Charging")

# Check if the battery is full
battery_full=$(acpi -b | grep -c "Full")



# When the battery is not charging and it goes below 15%
if [[ $ac_power -eq 0 && $battery_level -lt 15 ]]; then
    notify-send -u critical "Battery is Low" "Level: $battery_level%"
fi

