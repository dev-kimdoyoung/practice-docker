# 도커로 Jenkins 컨테이너 로드
## Jenkins란?
### 정의
- 소프트웨어 개발 시 **지속적인 통합 (Continuous Integration)** 및 **지속적인 전달 (Continuous Delivery)** 서비스를 제공하는 도구
- 다수의 개발자가 특정 프로그램 개발 시에 발생하는 버전 충돌을 방지
  * 로컬에서 작업한 내용을 코드 공유 서버에 위치한 저장소에 **짧은 주기로 업로드**하여 지속적 통합이 가능하게 해줌
- 자바 환경에서 개발된 도구로 MIT 라이선스를 따른다.

### 장점
- 빌드 및 테스트를 자동화
- 프로젝트 표준 컴파일 환경에서 컴파일 오류 검출

### CI/CD란?
- 애플리케이션 개발 단계를 자동화하여 새로운 소스 코드를 **짧은 주기로 서버 코드에 반영**하여 고객에게 제공하는 방법
- 새로운 코드 통합으로 인해 개발 및 운영팀에 발생하는 문제를 해결하기 위한 솔루션
- 애플리케이션 통합 및 테스트 단계부터 제공 및 배포에 이르는 애플리케이션의 라이프사이클 전체에 걸쳐 지속적인 자동화 및 모니터링 제공

### Q&A
#### 지속적인 전달과 지속적인 배포의 차이점은?
1. 지속적인 전달 (Continuous Delivery)
프로덕션에 새 버전의 코드를 **수동**으로 배포  

2. 지속적인 배포 (Continuous Deployment)
프로덕션에 새 버전의 코드를 **자동**으로 배포  
  
### 용어 정리
1. Web Hook
- Github의 특정 브랜치에 소스가 push 되면, 이를 Web Hook으로 젠킨스에게 알려주어 빌드를 유발하도록 설정

### Jenkins 설치 메뉴얼
#### 설치 환경
- OS : Linux Ubuntu 16:04
- Platform : Portainer
- registry : Docker Hub

**1. Portainer 접속 후 Jenkins 공식 템플릿 클릭**
- 왼쪽 메뉴에서 'App Templates' 클릭
- Templates 리스트에서 Jenkins 클릭
  
![1.png](/image/1.png)  
**2. 템플릿을 활용하여 Jenkins 컨테이너 배포**
- 컨테이너 이름 입력
- 'Deploy the container' 버튼 클릭
  
![2.png](/image/2.png)  
**3. 배포된 Jenkins 컨테이너가 정상적으로 작동하는지 확인**  
(1) Portainer에서 확인  
- 왼쪽 메뉴에서 'Containers' 클릭
- Container list에서 Jenkins 컨테이너 확인
  * Published Ports에서 해당 컨테이너 포트 확인
  
![3.png](/image/3.png)  
(2) 호스트 CLI에서 확인  
- Portainer가 설치된 호스트 CLI에 접속
- 아래 명령어를 입력하여 해당 컨테이너 포트 확인
``` $ docker ps -a ```
  
![4.png](/image/4.png)  

**4. Jenkins 웹페이지에 접속**  
- 웹페이지 접속을 위해 아래 항목에 대한 정보 확인이 필요
  * **Jenkins 컨테이너 IP 주소**
    * 외부 네트워크에서 접속 시, Jenkins 컨테이너의 공인 IP 주소
    * 내부 네트워크에서 접속 시, Jenkins 컨테이너의 사설 IP 주소
    * Portainer가 배포된 호스트에서 접속 시, Jenkins 컨테이너의 IP 주소는 127.0.0.1
  * **위에서 확인한 Jenkins 포트 번호**
    * 예제에 나온 포트 번호는 '32771'이니 참고  
-http://{Jenkins 컨테이너 IP 주소}:{Jenkins 포트 번호} URL로 접속  
![5.png](/image/5.png)  

**5. admin 생성을 위한 패스워드 입력**
- /var/jenkins_home/secrets/initialAdminPassword 파일 확인
  * 아래 사진 순서에 따라 확인할 것
    * Jenkins 컨테이너의 CLI 환경에 접속하는 순서임
  * 파일 확인 명령어는 아래와 같음  
  ``` $ cat /var/jenkins_home/secrets/initialAdminPassword```
  
![6.png](/image/6.png)  
![7.png](/image/7.png)  
![8.png](/image/8.png)  

**6. Jenkins 기본 플러그인 설치**
- 'Install suggested plugins' 클릭
  
![9.png](/image/9.PNG)  
**7. Jenkins 설치 완료**
  
![10.png](/image/10.PNG)
  
## Reference
1. CI/CD 개념  
https://jhleed.tistory.com/130  
https://www.redhat.com/ko/topics/devops/what-is-ci-cd  

2. Docker를 이용한 Jenkins 파이프라인 구축 예제  
https://freekim.tistory.com/14?category=887087

3. 지속적인 전달과 지속적인 배포의 차이점  
https://aws.amazon.com/ko/devops/continuous-delivery/#:~:text=%EC%A7%80%EC%86%8D%EC%A0%81%20%EC%A0%84%EB%8B%AC%EA%B3%BC%20%EC%A7%80%EC%86%8D%EC%A0%81%20%EB%B0%B0%ED%8F%AC,%EB%A6%B4%EB%A6%AC%EC%8A%A4%20%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4%EB%A5%BC%20%EC%9E%90%EB%8F%99%ED%99%94%ED%95%A9%EB%8B%88%EB%8B%A4.
