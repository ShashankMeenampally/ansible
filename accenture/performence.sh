#!/bin/bash

cpu = "top -bn1 | grep load | awk '{printf "%.2f\t\t\n", $(NF-2)}'"

if ( $cpu -ge 80 ); then 
ps -eo user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command --sort=-%cpu | head -10
fi

mem = "free | grep Mem | awk '{print $3/$2 * 100.0}'"
if ( $mem -ge 80 ); then
ps -eo user,pid,%cpu,%mem,vsz,rss,tty,stat,start,time,command --sort=-%mem | head -10
fi
