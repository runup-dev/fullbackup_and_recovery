# 소개 
클라우드 컴퓨팅 환경에서 전혀 다른 스펙으로 이전시 인스턴스 백업을 사용하지 못합니다 
또는 클라우드 서비스가 변경되는 경우도 동일합니다 
여기서는 사용자 홈파일 / 유저 / 메일 / 크론 / 디비를 대상으로 풀백업을 하고 타겟에서 복원하도록 합니다 

# 원본서버 
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

full_backup_{날짜}.tar.gz 파일을 선호하는 방식으로 사본서버로 전송합니다 

# 사본서버 
<pre>
<code>
git clone 

# 복원실행
./full_recovery.sh
</code>
</pre>

업데이트가 예측 가능한 정적인 홈페이지는 문제 없으나 
실시간으로 데이터가 업데이트 되는 사이트라면 다른 정책이 필요합니다 
다음에 업데이트 해보도록 하겠습니다 
