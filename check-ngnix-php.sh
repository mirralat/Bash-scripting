#!/bin/bash
 
NORMAL='\033[0m'
 
WHITE='\033[1;37m'
 
BGRED='\033[41m'
BGGREEN='\033[42m']
BGBLUE='\033[44m'
 
ngnixstatus=$(systemctl status nginx | grep -Eo "running|dead|failed")
 
if [[ $nginxstatus = 'running' ]]
then
echo -en "${WHITE} ${BGGREEN}Web server is running! ${NORMAL}\n"
else
echo -en "${WHITE} ${BGRED}nginx doesn't work! ${NORMAL}\n"
systemctl restart nginx
sleep 1
echo -en "${WHITE} ${BGGREEN}Status Nginx after reboot $(systemctl status nginx | grep -Eo "running|dead|failed") ${NORMAL}\n"
echo $(curl -I 192.168.124.131 | grep  OK)
fi
 
phpstatus=$(systemctl status php7.4-fpm | grep -Eo "running|dead|failed")
 
if [[ $nginxstatus = 'running' ]]
then
echo -en "${WHITE} ${BGGREEN}Web server is running! ${NORMAL}\n"
else
echo -en "${WHITE} ${BGRED}php-fpm doesn't work! ${NORMAL}\n"
systemctl restart php7.4-fpm
sleep 1
echo -en "${WHITE} ${BGGREEN}Status php-fpm after reboot $(systemctl status php7.4-fpm  | grep -Eo "running|dead|failed") ${NORMAL}\n"
echo $(curl -I 192.168.124.131 | grep  OK)
fi
