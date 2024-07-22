 #!/bin/bash
server_ip=$(curl ifconfig.me 2>/dev/null)
latest_login=$(w | tail -n 1 2>/dev/null)
username=$(echo "$latest_login" | awk '{print $1}')
login_ip=$(echo "$latest_login" | awk '{match($0, /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/); print substr($0, RSTART, RLENGTH)}')
login_time=$(echo "$latest_login" | grep -oP '\b\d{2}:\d{2}\b')
curl -s  -X POST https://api.telegram.org/x:y/sendMessage -d chat_id=x -d text="<b>登录信息:%0A</b>服务器ip:  ${server_ip}%0A用户名:  ${username}%0A登录ip:  ${login_ip}%0A登录时间: ${login_time}" >/dev/null 2>&1 -d parse_mode=HTML
