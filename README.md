# weverseProject
##### 아티스트와 팬들이 서로 소통할 수 있는 팬 커뮤니티 서비스 페이지 입니다.  특정 아티스트의 굿즈 샵이나 게시물, 영상들을 이용할 수 있습니다.
## 파일구조설명
### DB
1. 전체 테이블 erd파일
2. 테이블 관련 쿼리문
### data
1. API 주요로직 순서도
2. 프로젝트 구현 API목록 파일 
### sourceCode
1. weverse(SpringBoot) 프로젝트 BackEnd 소스코드
2. weverse(SpringBoot) 프로젝트 FrontEnd 소스코드
## 프로젝트설명
###  [weverseProject]
#### 참여인원 - 9명  
#### 진행방식
- 팬들과 아티스트들이 소통하는 'W'사 페이지를 참조하여 클론코딩을 진행하였습니다.
- Rest API방식으로 Back-End 작업과 Front-End 작업을 나누어 진행하였습니다.
#### 활용언어
- Java(Spring Boot, JDK17, JPA)
- JavaScript(React, Next.js, Node.js)
- DataBase(MySQL)
- Server(Tomcat v9)  
#### 맡은기능 참조코드
공통[sourceCode/back/weverse/src/main/java/com/weverse/sb]
- 사용자관련 API
  - user/controller/UserController
- 샵관련 API
  - product/controller/ProductController
- 아티스트별 SNS관련 API
  - media/controller/MediaController
- 테스트(sourceCode/back/weverse/src/test/java/com/weverse/sb, JUnit test사용)   
  - AtistTest.java, productDataTest, shopArtistTest, shopTest, storyTest
    
