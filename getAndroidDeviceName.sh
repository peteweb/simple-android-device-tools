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
IFS=' ' read -r -a devices <<< $deviceline

printf '%s\n' "${devices[0]}" > ${args[1]}

echo "=*=*=*=*=*=*="

echo "All done - see '${args[1]}' for the result."

# L7HYMJQKW4LJV8KB       device usb:336592896X product:k5fpr model:Lenovo_A7010a48 device:A7010a48
