#! /bin/bash

while :
do

echo "---------------------"
echo "1. 도커 가상 네트워크 생성"
echo "2. 종료 (Exit)"
echo "---------------------"
echo "번호를 지정해주세요 ( ex) 1 )"

read word

if [ ${word} -eq 1 ];then
    # Create Docker Volume
    echo "도커 가상 네트워크 생성\n"
    echo "-----------------------------------------------------------------------------"
    echo "네트워크를 구성하는 드라이버 입력"
    echo "대표적인 드라이버 종류 : bridge | host | none | container"
    echo "bridge : 1개 이상의 컨테이너 연결이 가능한 사용자 정의 브리지 생성"
    echo "host :  호스트 머신의 네트워크 환경을 그대로 사용"
    echo "none : 아무런 네트워크를 사용하지 않음"
    echo "container : 다른 컨테이너의 네트워크 인터페이스 (ethernet 정보)를 공유"
    echo "-----------------------------------------------------------------------------"
    read networkDriver

    echo "서브넷 주소 입력"
    echo "작성 형식 : <Network IP Address>/<CIDR>"
    read networkSubnet

    echo "IP 범위 입력"
    echo "작성 형식 : <Network IP Address>/<CIDR>"
    read networkIPRange

    echo "게이트웨이 주소 입력"
    echo "작성 형식 : <Host IP Address>"
    read gatewayIP

    echo "네트워크 이름 입력"
    read networkName
	

    docker network create --driver=${networkDriver} \
	--subnet=${networkSubnet} \
	--ip-range=${networkIPRange} \
	--gateway=${gatewayIP} \
	${networkName}
fi

if [ ${word} -eq 2 ]; then
    # Exit
	break
fi

done
