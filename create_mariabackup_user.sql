CREATE USER 'mariabackup'@'localhost' IDENTIFIED BY 'bak@1234';
GRANT RELOAD, PROCESS, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'mariabackup'@'localhost';
GRANT CREATE ON PERCONA_SCHEMA.* TO 'mariabackup'@'localhost';
GRANT INSERT ON PERCONA_SCHEMA.* TO 'mariabackup'@'localhost';
FLUSH PRIVILEGES;

