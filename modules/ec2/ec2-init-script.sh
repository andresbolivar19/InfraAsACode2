#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
cd /var/www/html
sudo yum install git -y
git clone https://github.com/andresbolivar19/MyRepo.git .

# Add script to mongodb
touche /etc/yum.repos.d/mongodb-org-3.0.repo

echo -e "[mongodb-org-3.0]" > /etc/yum.repos.d/mongodb-org-3.0.repo
echo -e "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb-org-3.0.repo
echo -e "baseurl=https://repo.mongodb.org/yum/amazon/2013.03/mongodb-org/3.0/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.0.repo
echo -e "gpgcheck=0" >> /etc/yum.repos.d/mongodb-org-3.0.repo
echo -e "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.0.repo

sudo yum install -y mongodb-org

sudo service mongod start

sudo chkconfig mongod on

export LC_ALL=C

echo -e "security:" >> /etc/mongod.conf
echo -e "authorization: "enabled"" >> /etc/mongod.conf
echo -e "Then run below command" >> /etc/mongod.conf

service mongod restart

echo -e "bindIp: 127.0.0.1,8.8.8.8" >> /etc/mongod.conf

service mongod restart
