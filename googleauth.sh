#!/bin/bash
user_list=($( cut -d: -f1 /etc/passwd))
for i in ${user_list[@]}
do
        find /home/$i/.google_authenticator -exec rsync {} /home/selvamj/2fa-ga/google_authenticator_$i  \; > /dev/null 2>&1
done
