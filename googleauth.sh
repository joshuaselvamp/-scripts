#!/bin/bash
user_list=($( cut -d: -f1 /etc/passwd))
for i in ${user_list[@]}
do
        find /home/$i/.google_authenticator -exec rsync {} /home/selvamj/2fa-ga/google_authenticator_$i  \; > /dev/null 2>&1
done

GIT=`which git`
REPO_DIR=/home/selvamj/2fa-ga/
cd ${REPO_DIR}
${GIT} add --all  /home/selvamj/2fa-ga/
${GIT} commit -m "google_authenticator_$i"
${GIT} push git@stash.agilysys.local:7999/devop/2fa-googleauth.git
