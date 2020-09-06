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

## Reference
1. CI/CD 개념  
https://jhleed.tistory.com/130  
https://www.redhat.com/ko/topics/devops/what-is-ci-cd  

2. Docker를 이용한 Jenkins 파이프라인 구축 예제  
https://freekim.tistory.com/14?category=887087

3. 지속적인 전달과 지속적인 배포의 차이점  
https://aws.amazon.com/ko/devops/continuous-delivery/#:~:text=%EC%A7%80%EC%86%8D%EC%A0%81%20%EC%A0%84%EB%8B%AC%EA%B3%BC%20%EC%A7%80%EC%86%8D%EC%A0%81%20%EB%B0%B0%ED%8F%AC,%EB%A6%B4%EB%A6%AC%EC%8A%A4%20%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4%EB%A5%BC%20%EC%9E%90%EB%8F%99%ED%99%94%ED%95%A9%EB%8B%88%EB%8B%A4.
