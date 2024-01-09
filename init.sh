#!/bin/bash


#-----------------------UPDATES-----------------------#

apt update && sudo apt upgrade -y 2>> ./errors.txt

echo -e "\n### System Updated Succefully! ###"



#--------------------CREATE USER----------------------#

groupadd admin 2>> ./errors.txt

echo -e "\n### a group named 'admin' was created ###"


echo -e "hodnet"

useradd hodnet -m --shell /bin/bash -G admin 2>> ./errors.txt

echo -e "\n### a user named 'hodnet' was created ###"


echo -e "\nhodnet\tALL=(ALL)\tNOPASSWD:ALL" >> /etc/sudoers 2>> errors.txt


echo -e "\n### Create a passwd for 'hodnet' ###"

passwd hodnet



#-----------------------SHH KEYS----------------------#


mkdir /home/hodnet/.ssh 2>> ./errors.txt
cp /root/.ssh/authorized_keys /home/hodnet/.ssh/authorized_keys 2>> ./errors.txt
chown hodnet:hodnet /home/hodnet/.ssh/authorized_keys 2>> ./errors.txt

echo -e "\n### ssh keys has been copied into 'hodnet' env.! ###"



#-----------------------HOSTNAME-----------------------#

hostname "TEST-VM" 2>> ./errors.txt
echo "TEST-VM" > /etc/hostname 2>> ./errors.txt
echo -e "\n127.0.1.1	TEST-VM" >> /etc/hosts 2>> ./errors.txt

echo -e "\n### System Name has been changed to 'TEST-VM'! ###"

