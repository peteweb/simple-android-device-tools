#!/bin/bash

args=("$@")

# ${args[0]} = device being looked for, e.g. 'Lenovo_A7'
# ${args[1]} = output file where the result will live

echo "Starting..."
echo "=*=*=*=*=*=*="

echo "Getting connected Android devices from 'adb devices -l'..."

adb devices -l

echo "=*=*=*=*=*=*="

echo "Writing all of these to a temp.txt file..."

adb devices -l > temp.txt

echo "=*=*=*=*=*=*="

echo "Searching for the ADB name associated with '${args[0]}' and outputting the result to '${args[1]}'"

deviceline=$(grep -F "${args[0]}" temp.txt)
# At this point, deviceline should be something like...
# NAMEOFDEVICE       device usb:USBID product:PRODUCTNAME model:EMULATORNAME device:DEVICENAME
IFS=' ' read -r -a devices <<< $deviceline
# Which should leave us with devices[0] being...
# NAMEOFDEVICE
printf '%s\n' "${devices[0]}" > ${args[1]}

echo "=*=*=*=*=*=*="

echo "All done - see '${args[1]}' for the result."
