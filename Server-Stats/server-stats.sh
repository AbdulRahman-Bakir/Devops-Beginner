#!/bin/bash

printf "====================================================\n"
  idle=$(top -bn1 | grep "%Cpu" | sed 's/,/ /g' | awk '{print int($8)}')
  usage=$((100 - idle))
  printf "Total CPU usage is %d%%\n" "$usage"

  printf "====================================================\n"
  total=$(free  | grep "Mem" | awk '{print $2}')
  used=$(free  | grep "Mem" | awk '{print $3}')
  free_mem=$(free  | grep "Mem" | awk '{print $4}')
  printf "Total memory: %s\nUsed memory: %s\nFree memory: %s\n" "$total" "$used" "$free_mem"
used_percent=$((used * 100 / total))
free_percent=$((free_mem * 100 / total))
printf "Used memory percentage: %d%%\nFree memory percentage: %d%%\n" "$used_percent" "$free_percent"
printf "========================================================\n"
disk_total=$(df  / | grep "/dev" | awk '{print $2}')
disk_used=$(df  / | grep "/dev" | awk '{print $3}')
disk_free=$(df  / | grep "/dev" | awk '{print $4}')
  printf "Total disk memory: %s\nUsed disk  memory: %s\nFree disk  memory: %s\n" "$disk_total" "$disk_used" "$disk_free"
disk_used_percent=$((disk_used * 100 / disk_total))
disk_free_percent=$((disk_free * 100 / disk_total))
printf "Used disk  memory percentage: %d%%\nFree disk memory percentage: %d%%\n" "$disk_used_percent" "$disk_free_percent"

printf "Top 5 processes per CPU usage: \n" 
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
printf "Top 5 processes per RAM usage: \n" 
 ps -eo pid,comm,%mem --sort=-%mem | head -n 6

