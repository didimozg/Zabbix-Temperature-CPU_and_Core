#!/bin/bash
# JSON Generator for Zabbix CPU Core Discovery
first=1
echo "{\"data\":["
sensors | grep "^Core" | while read -r line; do
    # Парсим ID ядра (Core 0, Core 1...)
    core_id=$(echo "$line" | awk '{print $2}' | tr -d ':')
    
    if [ "$first" -eq 0 ]; then echo ","; fi
    echo -n "{\"{#CORE}\":\"$core_id\"}"
    first=0
done
echo "]}"
