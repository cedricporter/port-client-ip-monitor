#!/bin/bash
#
# File: port-ip-monitor.sh
#
# Created: Wednesday, August 27 2014 by Hua Liang[Stupid ET] <et@everet.org>
#

filename="monitor.log"
regex="(909|600[0-9]{2})"

date +"[%Y-%m-%d %H:%M:%S]" >> $filename
netstat -anp | egrep $regex | grep -E "tcp.*ESTABLISHED" | awk '{print $4, $5}' | cut -d: -f2 | sort -u >> $filename
