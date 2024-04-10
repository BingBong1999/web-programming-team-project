# Project - SoSoMarket (회원 간 굿즈 거래 및 경매 시스템)

## 📌 프로젝트 정보

![image](https://github.com/BingBong1999/web-programming-team-project/assets/142529694/021c52e6-7715-451f-97dd-1bdbf7fb7f1c)

- **동덕여자대학교** 2학년 2학기 **웹 프로그래밍** 과목에서 수행한 프로젝트입니다.
- 총 3 명의 팀원으로 구성하여 한 학기동안 진행하였습니다.
- 해당 README.md 파일은 **요약된 정보**만 기재되어 있습니다. 더 많은 정보를 확인하시려면 아래 첨부된 **pdf 파일 공유 링크를 확인해주시면** 감사하겠습니다.
 	- https://drive.google.com/file/d/1HcYkglrOLJpaS3OkbAWgJ1bHG3U5FI2q/view?usp=sharing **(pdf 파일 링크)** @@@@@@@@@@@@@@@@@@@@@@@@@@@수정

## 🚀 개발 배경 및 목적

- 포켓몬빵의 띠부띠부씰은 여전히 많은 중고거래가 이루어지고 있습니다.
- 하지만 중고물품 거래 플랫폼을 확인하면 판매자 및 구매자들은 가격 설정에 대해 적지 않은 고민을 합니다.
- **소소마켓**은 구매자와 판매자들의 이러한 **가격 설정**에 대한 고민을 해결하기 위해서 서비스 사용자들의 소소한 상품들을 단순히 판매를 할 수 있는 것 뿐만이 아닌,
- 해당 상품의 구매를 희망하는 사용자들 간 **경매**에 참가하여 **가장 높은 가격에 입찰한 사용자**가 **해당 상품을 낙찰**하게 되는 기능을 추가하였습니다.

## 🛸 주요 기능 및 특징

### 1. 일반상품/경매상품

- 일반 상품 판매 게시글 작성/읽기/수정/삭제 가능
- 경매 상품 판매 게시글 작성/읽기/수정/삭제 가능
- 경매 상품의 경우, 게시글 삭제 시 게시글 작성자의 신용도 하락
- 경매 상품의 경우, 게시글 작성자가 설정한 경매 마감기한 이후 최고가 입찰 가격이 자동으로 낙찰 

### 2. 입찰

- 경매상품 판매 게시글에 입찰할 경우, 현재 입찰가보다 높은 값만 입찰 가능

### 3. 사용자

- 사용자 생성, 사용자 정보 조회, 사용자 정보 수정, 사용자 정보 삭제
- 사용자 로그인/로그아웃 가능
- 회원 탈퇴 시 비밀번호 재입력

### 4. 주문

- 사용자가 특정 상품에 구매를 진행하는 경우 주문서 생성
- 상품의 구매자와 판매자는 해당 주문서를 조회할 수 있음

### 5. 위시리스트

- 서비스 이용자가 위시리스트에 원하는 상품을 담기/조회/삭제 가능
- 해당 상품은 일반상품인지 경매상품인지에 따라 나누어 확인 가능

### 6. 기타

- 카테고리 및 키워드 별로 게시글 검색 가능

## 🛴 요구사항 분석

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/c838a05e-afcc-4276-881e-2f1174a02e97)

## 🧭 use-case model

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/6e30bd2d-8cda-4afa-b25f-cc2d68654bc3)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/2476b4e5-8dae-4783-9499-072b65d2d6d3)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/6e9d47d3-ef47-4379-a8d2-1836a4bc3cae)

## 🌊 시스템 구성도

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/40dffbd6-904f-4e22-836c-a59552608046)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/8c0d25a5-4b8d-4937-812f-fe089474d27e)


## 🚝 UI 설계

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/b1aeb27d-345d-4193-89ca-93c5765216f5)

- 해당 UI는 추후 와이어프레임으로 재설계되었습니다.
- (카카오 오븐) 다음 링크를 누르시면 자세한 UI 설계 내용을 확인할 수 있습니다. https://ovenapp.io/view/eCW3HIbZ8KcDWxVHeLJ5soTCYyFbJgrT#7PTcT

## 🚔 Domain

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/b46ac8c2-cb79-45e7-a43b-5cd0019d92fe)

## 🐤 DB

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/0b9ab447-af75-4537-ba82-40ce26456ef8)

## 🎈 Request Mapping

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/3ae913d4-078c-4a09-a5be-8cd239a4d4b1)

- (구글 스프레드 시트) 다음 링크를 누르시면 자세한 Request Mapping 내용을 확인할 수 있습니다. https://docs.google.com/spreadsheets/d/1fe1fcmk3U99QAK8U8Nj6eXWwVl_a3t45R8zvjZ1bkjA/edit#gid=0

## 🎯 비즈니스 로직이 사용된 프로그램 기능 이미지 파일

![image](https://github.com/BingBong1999/so-so-market/assets/142529694/ac4b4148-e968-4b03-a867-0307c8cfbf26)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/63fc1c6d-ce44-422f-9a2f-df8bb1c030d5)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/2b99e457-94c3-4928-a527-1c988cecb3bf)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/a568828e-7430-46a3-8c63-aad55a347372)
![image](https://github.com/BingBong1999/so-so-market/assets/142529694/d8f49243-da56-44f0-babb-37e80ebd621e)

- 더 자세한 내용은 README.md 파일 상단에 첨부한 pdf 공유 링크를 확인해주시면 감사하겠습니다.
