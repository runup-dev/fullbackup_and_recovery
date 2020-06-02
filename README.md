# mariadb-backup package install 
sudo yum install MariaDB-backup

# mariabackup user 생성
mysql -u root -p < create_mariabackup_user.sql
