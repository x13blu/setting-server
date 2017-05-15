#!/bin/sh
echo $(tput setaf 3)Update repositry $(tput sgr 0)
#apt-get update


echo $(tput setaf 3)Install docker dependencies $(tput sgr 0)
#apt-get install \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg2 \
#     software-properties-common -y


echo $(tput setaf 3)Add repositories docker $(tput sgr 0)
#curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
#add-apt-repository \
#  "deb [arch=amd64] https://download.docker.com/linux/debian \
#  $(lsb_release -cs) \
#  stable"


echo $(tput setaf 3)Update repositories and install docker $(tput sgr 0)
#apt-get update && apt-get install docker-ce -y


echo $(tput setaf 3)Install necessarys packages for share folder $(tput sgr 0)
#apt-get install cifs-utils -y
#mkdir /share
#chmod 777 /share
# mount -t cifs //192.168.1.224/setting-server/share /share


echo $(tput setaf 2)Install and configure SSH key login $(tput sgr 0)
mkdir /home/setting/.ssh -p
ssh-keygen -P "" -f /home/setting/.ssh/id_rsa
cat /home/setting/.ssh/id_rsa.pub >> /home/setting/.ssh/authorized_keys
cp /home/setting/.ssh/id_rsa /share
echo $(tput setaf 5)Clave id_rsa copiada a la carpeta /share $(tput sgr 0)
