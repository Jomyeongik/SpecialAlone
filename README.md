# SpecialAlone
개발마을 - 세미프로젝트
## 1인주거 환경개선을 위한 커뮤니티

## 🏠 프로젝트 목적

✔ 늘어나는 1인가구에 대해 다양한 기회와 정보 제공</br>
✔ 다양한 사람들과 함께 할 수 있는 소모임 게시판</br>
✔ 눈치보지 않고 혼자서도 밥을 먹을수 있는 혼밥 가능 식당 추천</br>
✔ 묻지마 사건등 다양한 강력범죄로부터 나를 지키기 위한 방호상품 추천</br>

## 🏘 개발기간

2023.09.01 ~ 2023.09.22
</br>

## 💻 개발 환경
### 사용언어
<img src="https://img.shields.io/badge/java-2C2255?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS&logoColor=white"> <img src="https://img.shields.io/badge/JSTL-E34F26?style=for-the-badge&logo=JSTL&logoColor=white">

### 기술스택
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Apache Maven-C71A36?style=for-the-badge&logo=Apache Maven&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-2C2255?style=for-the-badge&logo=mybatis&logoColor=white">

### 개발환경
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=Apache Tomcat&logoColor=white"> <img src="https://img.shields.io/badge/VISUAL STUDIO CODE-1572B6?style=for-the-badge&logo=VISUAL STUDICODE&logoColor=white"> <img src="https://img.shields.io/badge/GITHUB-2C2255?style=for-the-badge&logo=GITHUB&logoColor=white">
</br>

## 🍟 팀 소개 및 팀원 역할분담
### 개발마을 : 팀원들이 지식을 공유하고 협력하여 소프트웨어를 개발하는 장소나 온라인 커뮤니티를 조성하는 마을
### 팀원  
🍖 강정대 (회원가입, 마이페이지, 깃허브관리)</br>
🍖 조명익 (음식상품추천, 식당추천)</br>
🍖 이기진 (취미별 인원모집, 소모임게시판 생성)</br>
🍖 정유송 (공지사항, 관리자페이지, 이벤트게시판)</br>
🍖 김현정 (상품리뷰 및 평점, 상품 추천 서비스, 지도API 서비스)</br>

## 🪑 주요기능
### 회원관리
기능명 | 상세
-------|-----
회원가입 | 아이디, 비밀번호, 이름, 성별, 이메일, 전화번호, 주소, 관심사를 입력하면 가입이 가능하며, 아이디와 이메일 유효성 체크를하여 중복되지 않은 아이디와 이메일을 사용하여 가입한다.
로그인 | 회원가입 시 입력한 정보와 아이디, 비밀번호가 일치하면 로그인이 가능하다. 로그인 창에서 아이디 찾기, 비밀번호 찾기, 회원가입 페이지로 갈 수 있다. 이메일을 입력하면 아이디를 찾을 수 있고, 아이디와 이메일을 입력하면 비밀번호 찾기가 가능하다.
마이페이지 | 개인정보 수정이 가능하다. 수정항목은 비밀번호, 이메일, 전화번호, 주소, 관심사이다.

### 음식,식당 게시판
기능명 | 상세
-------|-----
게시판 목록 | 비회원의 경우 전체 리스트 조회만 가능하며 로그인 시 상세정보 조회가 가능하다. 전체 목록은 지역을 선택하여 해당 지역 상품,식당 리스트를 조회할 수 있다. 관리자로 로그인 시 상품등록 버튼이 활성화되고 상품,식당 등록폼으로 이동이 가능하다.
게시판 상세 | 상세페이지에서 상품에 대한 상세 정보를 조회할 수 있고 상품,식당 리뷰에 입력된 별점들의 평균점수를 조회할 수 있다. 리뷰작성 버튼을 통해 작성폼으로 이동가능하고, 리뷰로 이동 버튼을 통해 리뷰리스트로 이동이 가능하다.
음식게시판 리뷰 | 리뷰작성폼에서 상품에 대한 포토리뷰를 작성할 수 있다. 리뷰내용을 입력하고 리뷰 이미지를 등록할 수 있다. 상품리뷰리스트에서 포토리뷰 리스트를 조회,삭제할 수 있고, 한줄리뷰 등록,조회,삭제 할 수 있다.
식당게시판 리뷰 | 리뷰작성폼에서 식당에 대한 리뷰를 작성할 수 있다. 리뷰내용을 입력하고 리뷰 이미지를 등록할 수 있다. 식당리뷰리스트에서 전체리뷰 리스트를 조회,삭제할 수 있다.







### 66. 음식추천게시판
66-1 추천상품 리스트
<img width="1440" alt="추천상품리스트" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/23e1161d-bc9c-4ef9-9155-f0c3d05293d9">

66-2 추천상품 상세
<img width="1440" alt="추천상품상세" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/a4ad47f1-07ee-40c1-8fef-e5a06ddd377a">

66-3 추천상품 정보등록
<img width="1440" alt="추천상품정보등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/0945009c-e2d5-4b63-ad07-361fbb6908c8">

66-4 추천상품 이미지등록
<img width="1440" alt="추천상품이미지등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/7395bea2-f1ad-4c6a-b088-f9500aa98146">

66-5 추천상품 리뷰 리스트
<img width="1440" alt="추천상품리뷰리스트" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/70d2cb66-f541-4172-bede-9184e554fd69">

66-6 추천상품 한줄리뷰
<img width="1440" alt="추천상품한줄리뷰" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/06f5f1b2-785d-4c33-b706-a96d289e6138">

66-7 포토리뷰 정보등록
<img width="1440" alt="포토리뷰정보등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/583ea93b-3acb-4f99-b46d-caf566370a54">

66-8 포토리뷰 이미지등록
<img width="1440" alt="포토리뷰이미지등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/6b822124-45dd-446c-9021-eecd6af291fb">

### 66. 식당추천게시판
66-1 추천식당 리스트
<img width="1440" alt="추천식당리스트" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/38506bdb-d5fb-429b-8de0-f3a248976bc6">

66-2 추천식당 상세
<img width="1440" alt="추천식당상세" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/1bdfe2e2-9d1d-4127-a000-83075e43a8a0">

66-3 추천식당 정보등록
<img width="1440" alt="추천식당정보등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/579d188a-0fac-4247-9fb9-902adf0899da">

66-4 추천식당 이미지등록
<img width="1440" alt="추천식당이미지등록1" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/7deeb17b-2a14-44d0-aac4-66af8861e7e4">
<img width="1440" alt="추천식당이미지등록2" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/51aab8d5-900f-4053-82e3-82268f780b56">

66-5 추천식당 리뷰목록
<img width="1440" alt="추천식당리뷰목록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/b121578e-ef25-4d00-be4a-ecaf317ad57a">

66-6 추천식당 리뷰 정보등록
<img width="1440" alt="추천식당리뷰정보등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/fac8447d-21f9-4002-9f54-2aeaf989baeb">

66-6 추천식당 리뷰 이미지등록
<img width="1440" alt="추천식당리뷰이미지등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/60fc5c3c-ffed-404b-9e11-c2f2f414d79c">

