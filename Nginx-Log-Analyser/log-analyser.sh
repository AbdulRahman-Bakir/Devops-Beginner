ips=$(awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}' )
paths=$(  awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}')
status_code=$(  awk '{print $9}' access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}')
user_agent=$(  awk -F '"' '{print $6}' access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print substr($0, index($0,$2)) " - " $1 " requests"}')
printf "Top 5 IP addresses with the most requests:\n"
printf "%s\n" "$ips"
printf "=============================================\n"
printf "Top 5 most requested paths:\n"
printf "%s\n" "$paths"
printf "=============================================\n"
printf "Top 5 response status codes:\n"
printf "%s\n" "$status_code"
printf "=============================================\n"
printf "Top 5 User Agents with the most requests:\n"
printf "%s\n" "$user_agent"
