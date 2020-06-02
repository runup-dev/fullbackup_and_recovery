## 풀백업 스크립트
## author : Runup. Kim Tae Oh

backup_dir=./move
sudo mkdir -p ${backup_dir}


#########################################
# 사용자 백업 
# ref : https://www.cyberciti.biz/faq/howto-move-migrate-user-accounts-old-to-new-server/
# 관리자가 생성한 사용자만 추출하기 위한 변수 생성 ( 시스템 사양에 따라 변경될 수 있음 ) 
#########################################

export UGIDLIMIT=1000

## /etc/passwd
sudo awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/passwd > ${backup_dir}/passwd.mig

## /etc/group
sudo awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534)' /etc/group > ${backup_dir}/group.mig

## /etc/shadow
sudo awk -v LIMIT=$UGIDLIMIT -F: '($3>=LIMIT) && ($3!=65534) {print $1}' /etc/passwd | tee - |egrep -f - /etc/shadow > ${backup_dir}/shadow.mig

## /etc/gshadow
sudo cp /etc/gshadow ${backup_dir}/gshadow.mig


#########################################
# HOME / NGINX CONF / PHP-FPM CONF / LET'S ENCRYPT 백업
#########################################

## home  
sudo tar -zcvpf ${backup_dir}/home.tar.gz --exclude="*.gz" /home

## mail spool 
sudo tar -zcvpf ${backup_dir}/mail.tar.gz /var/spool/mail

## crontab
sudo tar -zcvpf ${backup_dir}/cron.tar.gz /var/spool/cron

## nginx conf
sudo tar -zcvpf ${backup_dir}/nginx.tar.gz /etc/nginx/conf.d

## php-fpm conf
sudo tar -zcvpf ${backup_dir}/php.tar.gz /etc/php-fpm.d

## let's encrypt 
sudo tar -zcvpf ${backup_dir}/letsencrypt.tar.gz /etc/letsencrypt


##########################################
## DATABASE FULL BACKUP (mariabackup 필요)
## 사용법 https://mariadb.com/kb/en/full-backup-and-restore-with-mariabackup/
## 유저생성 https://mariadb.com/kb/en/mariabackup-overview/
## 23번 에러 발생시 my.cnf의 [mysqld] 섹션에서 open-files-limit
##########################################

mkdir -p ${backup_dir}/database
rm -rf ${backup_dir}/database/*
sudo mariabackup --backup --target-dir=${backup_dir}/database/ --user=mariabackup --password=bak@1234
sudo mariabackup --prepare --target-dir=${backup_dir}/database/
