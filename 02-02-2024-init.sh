#!/bin/bash

#----------------------VARIABLES----------------------#

hostname="TEST-VM"
username="hodnet"


#-----------------------UPDATES-----------------------#

apt update && sudo apt upgrade -y 2>> ./errors.txt

echo -e "\n### System Updated Succefully! ###"



#--------------------CREATE USER----------------------#

groupadd admin 2>> ./errors.txt

echo -e "\n### a group named 'admin' was created ###"

useradd $username -m --shell /bin/bash -G admin 2>> ./errors.txt

echo -e "\n### a user named '$username' was created ###"


echo -e "\n$username\tALL=(ALL)\tNOPASSWD:ALL" >> /etc/sudoers 2>> errors.txt


echo -e "\n### Set Up a password for '$username' ###"

passwd $username



#-----------------------SHH KEYS----------------------#


if [ ! -d /home/$username/.ssh ]
then
	mkdir /home/$username/.ssh 2>> ./errors.txt
fi
cp /root/.ssh/authorized_keys /home/$username/.ssh/authorized_keys 2>> ./errors.txt
chown -R $username:$username /home/$username/.ssh/ 2>> ./errors.txt

echo -e "\n### ssh keys has been copied into '$username' env.! ###"



#-----------------------HOSTNAME-----------------------#

hostname $hostname 2>> ./errors.txt
echo $hostname > /etc/hostname 2>> ./errors.txt
echo -e "\n127.0.1.1	$hostname" >> /etc/hosts 2>> ./errors.txt

echo -e "\n### System Name has been changed to '$hostname'! ###"

