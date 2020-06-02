# 풀백업 복원스크립트 
# author : Runup. Kim Tae Oh

sudo cat ./passwd.mig >> /etc/passwd
sudo cat ./group.mig >> /etc/group
sudo cat ./shadow.mig >> /etc/shadow

## 특별한경우에만 사용
sudo cp ./gshadow.mig /etc/gshadow

## 파일 복원
sudo tar -zxvf ./mail.tar.gz -C /
sudo tar -zxvf ./cron.tar.gz -C /
sudo tar -zxvf ./nginx.tar.gz -C /
sudo tar -zxvf ./php.tar.gz -C /
sudo tar -zxvf ./home.tar.gz -C /
sudo tar -zxvf ./letsencrypt.tar.gz -C /
sudo tar -zxvf ./opcache.tar.gz -C /

## 데이터 베이스 복원
sudo systemctl stop mariadb
sudo rm -rf /var/lib/mysql/*
sudo mariabackup --copy-back --target-dir=./database
chown -R mysql:mysql /var/lib/mysql/
sudo systemctl start mariadb
