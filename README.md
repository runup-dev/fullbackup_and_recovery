# 소개 
클라우드 컴퓨팅 환경에서 전혀 다른 스펙으로 이전시 인스턴스 백업을 사용하지 못합니다 
또는 클라우드 서비스가 변경되는 경우도 동일합니다 

아래 스펙을 기준으로 작성되었습니다 
- CENTOS7 리눅스
- Nginx
- PHP-FPM
- MariaDB

백업/복원 대상은 아래와 같습니다 
- HOME파일
- 유저 
- 메일
- 크론
- Nginx 환경파일
- PHP-FPM-POOL
- 데이터베이스

1. 원본서버에서 아래 코드를 실행합니다  
<pre>
<code>
# mariadb-backup 설치  
sudo yum install MariaDB-backup

# mariabackup user 생성
mysql -u root -p < create_mariabackup_user.sql

git clone 

# 풀백업실행
./full_backup.sh

</code>
</pre>

2. move 폴더 이하에 생성된 파일을 선호하는 방식으로 사본서버로 전송합니다 

3. 사본서버 백업파일이 복사된  경로에서 아래 소스를 실행합니다 
<pre>
<code>
git clone 

# 복원실행
./full_recovery.sh
</code>
</pre>

업데이트가 예측 가능한 정적인 홈페이지는 문제 없으나 
실시간으로 데이터가 업데이트 되는 사이트라면 다른 정책이 필요합니다 
