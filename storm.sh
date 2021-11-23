#!/bin/bash


if which figlet >/dev/null;then
	figlet -k -f slant Storm
else
	echo "figlet was not installed, installing now"
	sudo apt install figlet
	echo "figlet was installed, restart the tool!"
	exit 1
fi

echo "	     # Coded by: Alsalt Alkharosi"

if [ -z "${1}" ];then 
	echo "[!] Usage: ./storm.sh <filename>"
	exit 1
else
	echo "[!] Validating if the IP addresses are malicious or not..."

fi

for ip in $(cat $1 );do
curl -s --request GET --url "https://www.virustotal.com/api/v3/ip_addresses/$ip" --header "x-apikey:ac438ed63780377b7fe72a51f398d6cf1179b1bea82c14f51a7a2388f8a3e69c" > vt.txt
sleep 10
  
if [ $(grep 'malicious' vt.txt | wc -l) -gt 3 ];then
	echo "[!] $ip: malicious"
else
  echo "[*] $ip: Clean"
fi

done
