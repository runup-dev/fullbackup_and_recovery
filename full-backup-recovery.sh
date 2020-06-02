## recover user
## 연속으로 사용하지 않아야 한다
## todo 옵션을 줘서 실행하게 하자 ( 기본값이 실행하지 않는 것이다 )

sudo cat /root/old-server/passwd.mig >> /etc/passwd
sudo cat /root/old-server/group.mig >> /etc/group
sudo cat /root/old-server/shadow.mig >> /etc/shadow

## 특별한경우에만 사용
sudo cp /root/old-server/gshadow.mig /etc/gshadow

## 파일 복원
sudo tar -zxvf /root/old-server/mail.tar.gz -C /
sudo tar -zxvf /root/old-server/nginx.tar.gz -C /
sudo tar -zxvf /root/old-server/php.tar.gz -C /
sudo tar -zxvf /root/old-server/home.tar.gz -C /
sudo tar -zxvf /root/old-server/letsencrypt.tar.gz -C /

## 데이터 베이스 복원
mariabackup --copy-back --target-dir=/root/old-server/database

