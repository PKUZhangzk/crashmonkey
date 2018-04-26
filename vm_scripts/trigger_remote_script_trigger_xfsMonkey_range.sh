#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters; Please provide file system, start vm and end vm number as the parameters;"
    exit 1
fi

num_vms=$num_vms
fs=$1
st=$2
end=$3

port=3022
for i in `seq 1 $num_vms`; do

        if [ $i -lt $st ] || [ $i -gt $end ]
        then
		port=`expr $port + 1`
		echo `date` ' Skipping triggering of xfsMonkey for VM '$i
                continue
        fi
	
	echo `date` 'Triggering xfsMonkey in VM '$i'...'
	rsh -p $port pandian@127.0.0.1 "echo alohomora| sudo -S bash /home/pandian/vm_remote_trigger_script.sh "$fs
	sleep 1
	port=`expr $port + 1`
done
