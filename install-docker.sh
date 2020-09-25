# Ubuntu Update
echo "우분투 패키지 업데이트"
sudo apt-get -y update && apt-get -y upgrade

# install necessary packages to be able to install Docker
echo "도커 설치를 위해 필요한 의존성 패키지 설치"
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add the official GPG Key
echo "도커에서 제공하는 공식 GPG 키 등록"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Activate Docker Repository & Update
echo "도커 레퍼지토리 활성화 및 우분투 패키지 업데이트"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update

# Install latest Docker version
echo "도커 설치"
sudo apt install -y docker-ce

echo "도커 버전 확인"
sudo docker --version
