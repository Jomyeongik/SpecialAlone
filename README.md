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






### 77. 취미 게시판

로그인 안하면 상세 페이지 조회 불가
<img width="1800" alt="스크린샷 2023-10-04 12 46 56" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/2d9e5fc5-46fe-4a14-9a0c-8d7d23ff0696">
<img width="1800" alt="스크린샷 2023-10-04 12 47 26" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/8ff4f96c-19f1-4a4a-8d51-26cf129fe154">
<img width="1800" alt="스크린샷 2023-10-04 12 47 37" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/ba15cc7d-1ed8-483a-bf96-834df37a5375">
<img width="1800" alt="스크린샷 2023-10-04 12 47 47" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/ac7802bb-af01-481b-930f-c8c256e0653c">

로그인 후 상세 페이지와 댓글
<img width="1800" alt="스크린샷 2023-10-04 12 48 12" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/2ed79e22-6dd0-43f9-8751-f134055f1054">
<img width="1800" alt="스크린샷 2023-10-04 12 48 28" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/8bd92ed9-47aa-43ee-9a03-e1f349609a06">
<img width="1800" alt="스크린샷 2023-10-04 12 48 48" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/81b73dac-fb45-4167-801c-ffe08f1b8bf1">

게시글 작성
<img width="1800" alt="스크린샷 2023-10-04 12 49 01" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/1e47a7d2-c621-4282-a58f-da1824c16a0f">

게시글 작성시 소모임 모집 옵션을 선택하면 정보를 기입할 수 있으며, 파일을 함께 게시할 수 있다.
<img width="1800" alt="스크린샷 2023-10-04 12 49 11" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/5ef8f737-d574-4cad-b5f1-e5ac19e63337">
<img width="1800" alt="스크린샷 2023-10-04 12 49 19" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/18ba873d-69bf-4ac4-8267-ffafd1fe2628">
<img width="1800" alt="스크린샷 2023-10-04 15 37 43" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/c8d48a36-28a7-40c9-a5c7-9beaeeeca1e5">

본인의 게시글은 수정, 삭제 버튼이 나타나며 파일도 함께 수정할 수 있다.
<img width="1800" alt="스크린샷 2023-10-04 15 37 54" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/e01bcaa9-3b79-448f-8285-bf8b39e8658e">
<img width="1800" alt="스크린샷 2023-10-04 15 38 09" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/5f2e0b15-41c6-41c6-b5e7-9122a92cfcc1">

소모임 게시글은 작성자가 아니면 신청 버튼이 나타나게 되며, 신청하기와 취소하기를 누르면 아이디와 신청인원에 값이 적용된다.
<img width="1800" alt="스크린샷 2023-10-04 15 38 39" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/8984b20e-c15e-4d7b-99aa-cfc8c66010a6">
<img width="1800" alt="스크린샷 2023-10-04 15 38 48" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/a9130242-db82-4236-8402-8f8236c4ea83">
<img width="1800" alt="스크린샷 2023-10-04 15 38 58" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/9691afb9-bff3-43c9-b9c9-720a0d4f29cd">

댓글을 작성하면 게시글의 댓글 수가 카운트 된다.
<img width="1800" alt="스크린샷 2023-10-04 15 39 56" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/b62b0699-37b8-4437-ab13-ecbe29d3dd0d">
<img width="1800" alt="스크린샷 2023-10-04 15 40 05" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/ed835731-ecf9-4380-89db-4525dc14fe8c">

이미 신청한 사람이 있는 소모임모집 게시글에 또 신청을하면 ','와 함께 아이디가 적용되며 취소하기를 선택하면 ','와 함께 아이디가 사라진다.
<img width="1800" alt="스크린샷 2023-10-04 15 40 15" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/f8c52e46-808d-4185-9a52-db69f48c41a9">
<img width="1800" alt="스크린샷 2023-10-04 15 40 24" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/2de81b38-2abe-4f93-be02-d39c6a64ec7a">

신청인원이 모두 차게되면 소모임 게시글이 자동 생성된다.
<img width="1800" alt="스크린샷 2023-10-04 15 40 52" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/a804da80-9193-4c3f-9d29-16d81c2566b3">

신청인원에 따른 값을 게시판에서 조회할 수 있다.
<img width="1800" alt="스크린샷 2023-10-04 15 41 16" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/61754ded-9b0b-4298-8e14-cf1291f4ce21">

생성된 소모임 게시글에는 정보가 기입되며, 신청인원이 아닌 회원은 소모임 게시글을 조회할 수 없다.
<img width="1800" alt="스크린샷 2023-10-04 15 41 31" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/de00d676-cc77-422d-99e7-1ed77393611d">
<img width="1800" alt="스크린샷 2023-10-04 15 41 55" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/f818eda3-40d0-48a0-96e2-f91432f42e73">

내가 쓴 글 조회
<img width="1800" alt="스크린샷 2023-10-04 15 42 25" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/c89398b0-b7c3-45ba-bc02-375e1f864f89">

카테고리 값에 따른 조회
<img width="1800" alt="스크린샷 2023-10-04 15 42 39" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/60816716-3598-4116-a6bd-6fbc9c216f86">

카테고리 값에 따른 게시글이 없으면 조회가 되지 않는다.
<img width="1800" alt="스크린샷 2023-10-04 15 42 51" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/e82fcd58-3f55-425c-bc3d-c7950c5460be">

관리자는 소모임 게시글을 수정, 삭제할 수 있다. (만원이 된 소모임 모집 게시글과 생성된 소모임 글은 작성자도 수정, 삭제가 불가하다.)
<img width="1800" alt="스크린샷 2023-10-04 15 43 21" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/8a103cab-0d81-4b72-84dd-d925aef10ce8">

취미 목록에서 태그를 선택하면 태그에 따른 조회가 가능하다.
<img width="1800" alt="스크린샷 2023-10-04 15 43 48" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/5c055c0d-70fc-45c7-afcd-9c8c131a2bce">

검색으로도 조회가 가능하다.
<img width="1800" alt="스크린샷 2023-10-04 15 44 08" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/0f830436-8537-4448-9757-9c250a141a7b">
<img width="1800" alt="스크린샷 2023-10-04 15 44 19" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/939e8d7c-4dcd-478b-9352-9b25218ff3d5">

관리자는 새로운 취미 목록을 등록할 수 있다. (등록 시에는 썸네일, 태그, 제목을 필수로 기입해야한다.)
<img width="1800" alt="스크린샷 2023-10-04 15 44 37" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/5091fa7d-753a-4d41-b809-8f0da7bbf679">
<img width="1800" alt="스크린샷 2023-10-04 15 45 09" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/4d43f7ca-0ddb-4d60-bd15-c9edb9b70187">
<img width="1800" alt="스크린샷 2023-10-04 15 45 27" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/1122377f-503d-4715-aac4-3390feaae12b">
<img width="1800" alt="스크린샷 2023-10-04 15 46 09" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/e2813bbd-b96b-4e40-a7dd-b82ff94f7f8b">

관리자는 취미 목록을 삭제할 수 있다.
<img width="1800" alt="스크린샷 2023-10-04 15 46 21" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674932/0719ca81-0ad8-401c-84cc-b8c5aceaf735">
### 88. 안전게시판
관리자는 상품을 삽입할 수 있고, 수정,삭제 할 수 있다.
<img width="1440" alt="안전상품삽입" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674147/00f6254e-f30e-462e-83fd-99062b1e857f">
<img width="1440" alt="안전상품상세수정삭제 src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674147/bd559065-984a-4a98-a430-520d18c85ab0">

회원은 안전 상품 리스트를 별점 순으로 볼 수 있고, 상품 상세 페이지에 들어 갈 때마다, 최근 본 상품 목록에 추가되어 보여진다. 그리고 상품 전체,제목,내용으로 상품을 검색 할 수 있다.
<img width="1440" alt="안전상품리스트" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674212/60fc5c3c-ffed-404b-9e11-c2f2f414d79c">
<img width="1440" alt="안전상품별점" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674147/288f851a-83cf-455b-888b-37ba11874bf2">

회원은 안전 상품에 대한 리뷰를 등록하면서 별점을 줄 수 있고, 상품 리뷰 이미지를 삽입 할 수 있다. 그리고 자신이 쓴 리뷰는 수정 삭제가 가능하며, 남의 리뷰를 신고하여 관리자 게시글로 넘길 수 있고, 추천 할 수 있다.
<img width="1440" alt="안전상품리뷰등록" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674147/b9b22069-2103-4de9-9eb7-44c3b7c41bda">

### 88. 안전지도
회원은 안전 지도를 볼 수 있고, 마커를 클릭하면, 등록된 info를 통하여 관련된 간략한 정보와 링크를 타고 관련 뉴스를 볼 수 있다.
<img width="1440" alt="안전지도조회" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674147/723be4da-075e-463a-9467-83fd06e6e125">
회원은 댓글을 등록,수정,삭제,조회(작성자,내용)할 수 있고, 남이 쓴 댓글을 추천 할 수 있다.
<img width="1440" alt="안전지도댓글" src="https://github.com/2305PublicDataWebApp/SpecialAlone/assets/134674147/892f9de1-27e1-4b98-87d4-61347293889d">



