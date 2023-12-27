

<h2>Pulmuone Project</h2>

<div align=center>
  <img width="100%" alt="풀무원메인1" src="https://github.com/dhl1031/pulmuonePro/assets/141328665/66ed0c3f-837f-433d-aeec-7c16c9ee1155">
</div>

<!-- 프로젝트 소개 -->
## 프로젝트 소개
풀무원 녹즙 사이트 프로젝트 ( 2023/12/06 ~ 2023/12/27 )<br>
풀무원 녹즙은 매일배송과 택배배송으로 녹즙을 구매할 수 있는 쇼핑몰 사이트 입니다.<br>
맞춤 큐레이션을 통해서 구매자에게 맞는 녹즙 추천이 가능합니다.<br>
<br>
<br>
<br>

## 팀 구성 (6명)
고경림, 김정주, 박민석, 신종혁, 이동현, 이지현
<br>
<br>


## Environment

#### Skills
- jdk-11.0.19 (JAVA)
- Tomcat server 8.5v
- Oracle 11g
- ojdbc6
- Jsp & Servlet
- javascript
- jQuery
- html5 & css3

#### Tools
- STS 3.9.18.RELEASE
- Platform: Eclipse 2021-09 (4.21.0)
- exERD
- Draw.io
- Github

<br>
<br>
<br>

## ERD
![Frame 1](https://github.com/dhl1031/pulmuonePro/assets/141328665/e7d926ee-72e6-4ea8-8b1f-13b16951c3a2)
<br>
<br>
<br>


## 폴더구조
```
├─java
│  └─org
│      └─pro
│          └─pulmuone
│              ├─controller
│              │  ├─brand
│              │  ├─cart
│              │  ├─coupon
│              │  ├─curation
│              │  ├─etc
│              │  ├─event
│              │  ├─faq
│              │  ├─franchiseSearch
│              │  ├─info
│              │  ├─inquiry
│              │  ├─member
│              │  ├─modal
│              │  ├─mypage
│              │  │  ├─drink
│              │  │  │  └─payMethod
│              │  │  └─personal
│              │  │      ├─address
│              │  │      ├─info
│              │  │      └─refund
│              │  ├─notice
│              │  ├─order
│              │  ├─product
│              │  ├─taste
│              │  └─upload
│              ├─domain
│              │  ├─auth
│              │  ├─cart
│              │  ├─coupon
│              │  ├─curation
│              │  ├─deregist
│              │  ├─event
│              │  ├─faq
│              │  ├─franchiseSearch
│              │  ├─inquiry
│              │  ├─member
│              │  ├─mypage
│              │  │  ├─drink
│              │  │  │  └─payMethod
│              │  │  ├─order
│              │  │  └─personal
│              │  │      ├─address
│              │  │      └─refund
│              │  ├─notice
│              │  ├─order
│              │  │  ├─box
│              │  │  └─daily
│              │  └─product
│              ├─mapper
│              │  ├─cart
│              │  ├─coupon
│              │  ├─curation
│              │  ├─deregist
│              │  ├─event
│              │  ├─faq
│              │  ├─franchiseSearch
│              │  ├─inquiry
│              │  ├─main
│              │  ├─member
│              │  ├─modal
│              │  ├─mypage
│              │  │  ├─drink
│              │  │  │  └─payMethod
│              │  │  ├─order
│              │  │  └─personal
│              │  │      ├─address
│              │  │      └─refund
│              │  ├─notice
│              │  ├─order
│              │  └─product
│              ├─security
│              │  └─domain
│              └─service
│                  ├─coupon
│                  ├─event
│                  ├─faq
│                  ├─franchiseSearch
│                  ├─inquiry
│                  ├─member
│                  ├─mypage
│                  │  ├─drink
│                  │  │  └─payMethod
│                  │  ├─order
│                  │  └─personal
│                  │      ├─address
│                  │      ├─info
│                  │      └─refund
│                  ├─notice
│                  └─order
├─resources
│  ├─META-INF
│  └─org
│      └─pro
│          └─pulmuone
│              └─mapper
│                  ├─cart
│                  ├─coupon
│                  ├─curation
│                  ├─deregist
│                  ├─event
│                  ├─faq
│                  ├─franchiseSearch
│                  ├─inquiry
│                  ├─main
│                  ├─member
│                  ├─modal
│                  ├─mypage
│                  │  ├─drink
│                  │  │  └─payMethod
│                  │  ├─order
│                  │  └─personal
│                  │      ├─address
│                  │      └─refund
│                  ├─notice
│                  ├─order
│                  └─product
└─webapp
    ├─file
    │  └─download
    │      ├─banner
    │      ├─brand
    │      ├─product
    │      └─tour
    ├─images
    ├─META-INF
    ├─resources
    │  └─assets
    │      ├─css
    │      ├─images
    │      │  ├─common
    │      │  ├─contents
    │      │  ├─event
    │      │  │  ├─thumbnail
    │      │  │  └─view
    │      │  ├─gift
    │      │  └─ui
    │      └─js
    │          ├─build
    │          └─order
    ├─upload
    └─WEB-INF
        ├─classes
        ├─spring
        │  └─appServlet
        ├─tiles
        └─views
            ├─brand
            ├─cart
            ├─common
            ├─curation
            │  └─result
            ├─etc
            ├─event
            ├─faq
            ├─franchiseSearch
            ├─info
            ├─inquiry
            ├─layouts
            │  ├─event
            │  │  └─content
            │  ├─forum
            │  ├─member
            │  │  ├─login
            │  │  ├─quit
            │  │  └─regist
            │  ├─mypage
            │  │  └─order
            │  └─order
            │      ├─box
            │      └─daily
            ├─member
            │  ├─find
            │  └─regist
            ├─modal
            ├─mypage
            │  ├─benefit
            │  ├─drink
            │  │  └─paymethod
            │  ├─home
            │  ├─inquiry
            │  ├─order
            │  ├─personal
            │  │  ├─address
            │  │  ├─info
            │  │  └─refund
            │  ├─review
            │  └─wish
            ├─notice
            ├─order
            │  ├─box
            │  └─daily
            ├─product
            ├─taste
            ├─temp
            └─ui
```



## 팀원 담당 페이지 소개
<details open>
<summary>고경림</summary>
<div markdown="1">
<h4>🌴 맞춤큐레이션</h4>
🌟 큐레이션 진행 <br><br>
  
  - 결과 출력 <br>
  - 키즈 프로그램 조회<br>

🌟 장바구니 조회<br>

</div>
<hr>
</details>

<details open>
<summary>김정주</summary>
<div markdown="1">
<h4>🌴 이벤트</h4>
🌟 이벤트 페이지 <br><br>
  
  - 진행중인이벤트 <br>
  - 종료된이벤트<br>
  - 당첨자발표<br>
  - 친구초대<br>
  - 회원혜택<br>

</div>
<hr>
</details>

<details open>
<summary>박민석</summary>
<div markdown="1">
<h4>🌴 메인 페이지</h4>
  
<h4>🌴 택배배송/매일배송 페이지</h4>
🌟 상품<br><br>

  - 상품 조회
  - 상품 검색
  - 찜
  - 상품 상세보기
  - 상품 검색
  - 리뷰 페이지(일부 구현)

<h4>💻 MARKUP </h4>

  - 시음선물(주문X)
  - 창업안내(글작성X)
  - 브랜드소개

</div>
<hr>
</details>

<details open>
<summary>신종혁</summary>
<div markdown="1"><br>
🌟 로그인/회원가입 <br><br>
  
  - 로그인<br>
  - 회원가입<br>
  - 아이디 찾기<br>
  - 비밀번호 찾기<br>

🌟 주소록 <br>

  - 주소록 목록<br>
  - 주소록 등록/수정/삭제<br>
  
🌟 개인정보 변경<br>

  - 비밀번호 재확인<br>
  - 개인정보 변경 <br>
  - 회원 탈퇴 <br>
  
🌟 결제수단 관리 페이지<br>

  - 음용내역 목록 <br>
  - 대상 음용내역의 결제수단 변경<br>

🌟 환불계좌 변경<br><br>

  - 환불계좌 목록 <br>
  - 환불계좌 등록/수정/삭제 <br>


</div>
<hr>
</details>

<details open>
<summary>이동현</summary>
<div markdown="1">
<h4>🌴 고객기쁨센터</h4>
🌟<strong>FAQ</strong> <br> <br>
  
  - FAQ 검색<br>
  - 카테고리별 목록 조회<br>
  - (관리자) FAQ 등록<br>
  - (관리자) FAQ 삭제<br><br>
  
🌟<strong>1:1문의</strong> <br>
  - 1:1 문의등록<br>
  - 1:1 문의내역<br>
  - 1:1 문의 유형별 보기<br>
  - 1:1 문의 삭제<br><br>

🌟<strong>공지사항</strong> <br>
  - (관리자) 공지사항 등록<br>
  - (관리자) 수정하기 <br>
  - (관리자) 삭제하기 <br>
  - 공지사항 목록 조회<br><br>
  
🌟<strong>배송가능지역</strong> <br>
  - 배송가능 지역 검색하기 <br><br>

<h4>💻 MARKUP </h4>

- 제휴브랜드
</div>
<hr>
</details>

<details open>
<summary>이지현</summary>
<div markdown="1"><br>
🌟<strong>택배배송 주문</strong><br><br>
  
  - 주문서 작성<br>
  - 주문서 작성 완료 -> 확인

🌟<strong>마이페이지</strong><br>

  - My녹즙(택배 배송 관련 부분)<br>
  - 택배배송 주문내역<br>
  - 주문 취소<br>
  - 주문 내역 조회<br>
  - 배송 조회<br><br>
</div>
</details>
