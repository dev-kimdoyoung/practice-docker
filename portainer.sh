#! /bin/bash

while :
do

echo "Tip : Portainer 컨테이너를 최초로 생성할 경우 1, 2번을 순차적으로 수행해주세요."
echo "---------------------"
echo "1. Portainer 데이터 볼륨 생성"
echo "2. Portainer 컨테이너 적재 (load)"
echo "3. 종료 (Exit)"
echo "---------------------"
echo "번호를 지정해주세요 ( ex) 1 )"

read word

if [ ${word} -eq 1 ];then
    # Create Docker Volume
    echo "호스트 내 컨테이너와 공유할 수 있는 데이터 볼륨 생성"
    docker volume create portainer_data
fi

if [ ${word} -eq 2 ];then
    # Run Portainer
    echo "portainer 컨테이너 로드"
    echo "컨테이너 이름을 지정해주세요 ( ex) portainer)"
    read input
    docker run -d -p 9000:9000 --name ${input}  -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
fi

if [ ${word} -eq 3 ]; then
    # Exit
	break
fi

done
