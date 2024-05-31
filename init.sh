#!/bin/sh



ip addr
echo  
echo 
curl ipinfo.io
echo 

mkdir -p /webapp/


echo '====================================='
echo 'PREPARE YUM'
echo '====================================='
yum update -y
yum install epel-release -y
sudo yum install -y yum-utils
sudo yum install unzip -y
sudo yum -y install net-tools


echo '====================================='
echo 'EASE DOCKER'
echo '====================================='
yum erase -y docker \
docker-client \
docker-client-latest \
docker-common \
docker-latest \
docker-latest-logrotate \
docker-logrotate \
docker-selinux \
docker-engine-selinux \
docker-engine \
docker-ce \



echo '====================================='
echo 'ADD DOCKER REPO'
echo '====================================='
# sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --add-repo https://prod.zhenyi.tech/res/epark/setup/docker-ce.repo
#sudo yum-config-manager --add-repo http://prod.zhenyi.tech/res/epark/setup/docker-ce.repo


echo '====================================='
echo 'INSTALL DOCKER'
echo '====================================='
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 

service docker restart
systemctl enable docker.service 
 
# firewall-cmd --permanent --add-port=8888/tcp 
# firewall-cmd --permanent --add-port=80/tcp 
# firewall-cmd --reload

# docker-compose
#curl -SL https://github.com/docker/compose/releases/download/v2.26.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose


echo '====================================='
echo 'INSTALL DOCKER-COMPOSE'
echo '====================================='
curl -SL https://prod.zhenyi.tech/res/epark/setup/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod 777 /usr/local/bin/docker-compose


# sudo yum install git -y 
# sudo yum install nginx -y 
# sudo cp -rf app.conf /etc/nginx/conf.d/app.conf 
# sudo cp -rf nginx /etc/init.d/nginx


echo '====================================='
echo 'INSTALL ZEROTIER'
echo '====================================='
curl -s https://install.zerotier.com | sudo bash

sudo systemctl start zerotier-one.service
# sudo zerotier-cli join e26ff13e3543a975
sudo zerotier-cli join e26ff13e35bdab92




# rpm -ivh https://repo.mysql.com//mysql57-community-release-el7-11.noarch.rpm
# yum install mysql-community-client.x86_64 -y

echo '====================================='
echo 'INSTALL EPARK-SYSTEM'
echo '====================================='
curl -s https://prod.zhenyi.tech/res/epark/setup/epark.sh | sudo bash

 
