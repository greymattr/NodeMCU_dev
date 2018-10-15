#!/bin/sh
if [ ! "$2" ] ; then
	echo "Use: $0 <port> <firmware file>"
	echo "Ex: $0 /dev/ttyUSB0 NodeMCU_Firmware.bin"
else
	PORT="$1"
	FW="$2"
	if [ ! -f "$FW" ] ; then
		echo "No firmware file $FW found"
		exit 1
	fi
	sudo python esptool.py --port $PORT  write_flash 0x00000 $FW
fi