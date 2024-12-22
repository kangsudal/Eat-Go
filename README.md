# 🍀 Eat-Go! 🍀

<div align="center">
  <img src="https://github.com/user-attachments/assets/1c1619e5-00bc-47b1-91a7-7b75e6042cfa" width="310">
</div>

<div align="center">
  복잡하게 고민하지 말고 흔들어 보세요,<br>
  뜻밖의 맛있는 행운이 찾아올 거예요.<br>
  <br>
  우연한 발견의 즐거움!<br>
  <br>
  뭐 먹을지 모르겠어서 고민만하다가, 밥 제때 안챙겨먹고 건너뛰는 사람들!<br>
  <br>
  이제 먹으러 갑시다-!<br>
</div>


## 📸 스크린샷
<img width="1021" alt="image" src="https://github.com/user-attachments/assets/bdafbe27-bb91-4fb2-be02-3cd55fb53aef">

## 스토어
[<img src="https://github.com/user-attachments/assets/eae0bc49-ca8e-4051-b7a8-d0332b520d7d" width="100" height="40"/>](https://apps.apple.com/app/eat-go/id6738037068) 출시완료
<br>
[<img src="https://github.com/user-attachments/assets/70a9cb50-e8ce-4f35-8948-203cb82ed4fe" width="100" height="40"/>]() 심사중

## 🎬 데모 영상

[Watch the video](https://www.youtube.com/watch?v=J6zWyVfZNvc)

## 소개
가위바위보 하듯이 휴대폰을 흔들면 랜덤으로 메뉴 추천을 해드립니다!<br>
마음에 든다면 레시피를 보고 새로운 요리에 도전해보세요~<br>
뿐만아니라 관련 식당을 연결해드립니다!<br>
<br>

## ✨주요 기능
  + 랜덤 메뉴 추천
  + 북마크 기능
  + 식당 찾아주기 기능
  + 메뉴 필터 기능(재료로 검색)
  + 사용자 레시피 업로드 및 공유
<!--  + 레시피 공유하기 -->
<!--  + 자주먹는 top3 빈도수 체크 -->

<br>

## 🔧 기술스택:
- **Frontend**: Flutter
- **Backend**: Firebase (Firestore, Authentication, Storage)
- **API 연동**: Google Places API, Google Maps API
- **상태 관리**: Riverpod
- **아키텍처 패턴**: MVVM
- **라우터**: GoRouter

<br>

### 팀원 및 역할
- **기획**: 강수경
- **디자인**: 강수경
- **개발**: 강수경
- **배포**: 강수경

<br>

## Eat-Go! – App Store 음식 및 음료 카테고리 TOP 10 달성 🎉
<img width="464" alt="인기차트 10위" src="https://github.com/user-attachments/assets/c7f1aef3-29d4-4769-9a73-97464a7d5855">

<br>

## Class Diagram
```mermaid
classDiagram
   class EatGoUser {
      String uid
      String displayName
      String email
      double supportAmount
      bool isPremium
      DateTime premiumExpiration
      List~String~ bookmarkRecipeIds
      List~String~ clappedRecipeIds
      List~String~ recipeReportIds
      bool pushNotificationEnabled
   }

   class Recipe {
      String recipeId
      String title
      String ingredients
      String ingredientsImgUrl
      List~Description~ descriptions
      String category
      String hashTag
      String completedImgUrl
      DateTime createdAt
      String createdBy
      DateTime updatedAt
      List~ClapRecord~ clapRecords
      List~String~ bookmarkedBy
      List~String~ viewedBy
   }

   class Description {
      String description
      String descriptionImgUrl
   }

   class ClapRecord {
      String userUid
      int clapCount
   }

   class RecipeReport {
      String reportId
      String reportedBy
      String recipeId
      String reportReason
      DateTime reportedAt
      ReportStatus status
   }

   class ReportStatus {
      <<enumeration>>
      inProgress
      complete
      invalidation
   }

   class Restaurant {
      String name
      List~String~ photoUrls
      String businessStatus
      double rating
      int priceLevel
      String website
      String placeId
      String address
      String phoneNumber
      Location location
   }

   EatGoUser "1" --> "*" RecipeReport : reports
   Recipe "1" --> "*" Description : contains
   Recipe "1" --> "*" ClapRecord : clap records
   Recipe "1" --> "*" EatGoUser : bookmarkedBy
   Recipe "1" --> "*" EatGoUser : viewedBy
   RecipeReport "1" --> "1" ReportStatus : has status
   Recipe ..> Restaurant : fetches info from API
```
<h3>데이터 컬렉션</h3>

`users` 컬렉션
사용자 정보를 저장하는 컬렉션입니다. 각 사용자별 북마크, 박수, 신고 내역, 프리미엄 상태 등의 정보가 포함됩니다.
<br/>

`recipes` 컬렉션
레시피 정보를 저장하는 컬렉션입니다. 각 레시피에 대해 조회 및 북마크한 사용자 목록과 박수(클랩) 기록, 레시피 설명 등의 정보를 저장합니다.
또한 Google Places API를 통해 레시피 제목(`title`)을 기반으로 연관된 음식점(`Restaurant`) 정보를 동적으로 가져올 수 있습니다.
<br/>

`recipeReports` 컬렉션
레시피 게시물에 대한 신고 기록을 저장하는 컬렉션입니다. 사용자가 신고한 레시피와 신고 이유, 상태 등을 포함합니다.
<br/>
<br/>

<h3>클래스 구조</h3>
<h4>EatGoUser (User)</h4>
사용자의 정보와 관련된 기능을 정의하는 클래스입니다.

`uid`: 사용자 고유 ID
<br/>
`displayName`: 사용자 표시 이름 (null일 경우 이메일 ID 사용)
<br/>
`email`: 사용자 이메일 주소
<br/>
`supportAmount`: 후원 금액
<br/>
`isPremium`: 프리미엄 구독 상태
<br/>
`premiumExpiration`: 프리미엄 만료일
<br/>
`bookmarkRecipeIds`: 사용자가 북마크한 레시피 ID 목록
<br/>
`clappedRecipeIds`: 사용자가 박수를 친 레시피 ID 목록
<br/>
`recipeReportIds`: 사용자가 신고한 레시피 ID 목록
<br/>
`pushNotificationEnabled`: 푸시 알림 설정 상태
<br/>
<br/>

<h4>Recipe</h4>
레시피의 주요 정보와 사용자 상호작용 정보를 저장하는 클래스입니다.

`recipeId`: 레시피 고유 ID
<br>
`title`: 레시피 제목
<br>
`ingredients`: 필요한 재료 목록
<br>
`ingredientsImgUrl`: 재료 이미지 URL
<br>
`descriptions`: 레시피 단계별 설명 (`Description` 클래스의 리스트로 구성)
<br>
`category`: 레시피 카테고리
<br>
`hashTag`: 레시피와 관련된 해시태그
<br>
`completedImgUrl`: 완성된 레시피 이미지 URL
<br>
`createdAt`: 레시피 생성 날짜
<br>
`createdBy`: 작성자 ID (사용자 ID 또는 시스템 ID)
<br>
`updatedAt`: 마지막 업데이트 날짜
<br>
`clapRecords`: 사용자별 박수 기록 (`ClapRecord` 클래스의 리스트로 구성)
<br>
`bookmarkedBy`: 레시피를 북마크한 사용자 UID 목록
<br>
`viewedBy`: 레시피를 조회한 사용자 UID 목록
<br><br>
*참고*: `Recipe` 클래스는 `title`과 `hashTag`를 Google Places API의 쿼리로 사용하여 관련 음식점(`Restaurant`) 정보를 동적으로 가져옵니다.
<br/><br/>

<h4>Description</h4>
레시피 단계별 설명을 관리하는 클래스입니다.

`description`: 단계별 설명 문단
<br/>
`descriptionImgUrl`: 단계별 설명에 대한 이미지 URL
<br/><br/>

<h4>ClapRecord</h4>
특정 사용자가 레시피에 누른 박수 기록을 관리하는 클래스입니다.

`userUid`: 박수를 누른 사용자 ID
<br/>
`clapCount`: 해당 사용자가 누른 총 박수 수
<br/><br/>

<h4>RecipeReport</h4>
레시피 신고에 대한 정보를 관리하는 클래스입니다.

`reportId`: 신고 기록 고유 ID
<br/>
`reportedBy`: 신고한 사용자 ID
<br/>
`recipeId`: 신고된 레시피 ID
<br/>
`reportReason`: 신고 사유
<br/>
`reportedAt`: 신고 일시
<br/>
`status`: 신고 처리 상태 (`inProgress`, `complete`, `invalidation`)
<br/><br/>

<h4>ReportStatus (enum)</h4>
신고 처리 상태를 정의하는 열거형입니다.

`inProgress`: 신고 처리 중
<br/>
`complete`: 신고 처리 완료
<br/>
`invalidation`: 신고 무효화
<br/><br/>

<h4>Restaurant</h4>
Google Places API를 통해 가져온 음식점 정보를 저장하는 클래스입니다.

`name`: 음식점 이름
<br/>
`photoUrls`: 음식점 이미지 URL 리스트
<br/>
`businessStatus`: 운영 상태 (예: `OPERATIONAL`)
<br/>
`rating`: 음식점 평점
<br/>
`priceLevel`: 가격대 (0 - 무료, 4 - 매우 비쌈)
<br/>
`website`: 음식점 웹사이트 URL
<br/>
`placeId`: 음식점 고유 ID
<br>
`address`: 위치 주소
<br>
`phoneNumber`:  전화번호
<br>
`location`: 위도와 경도를 포함한 위치

## 프로젝트를 하면서 가장 어려웠던 상황은?
인증과 관련된 기능에서 상태 관리와 타이밍 이슈가 가장 어려웠습니다. 특히, 사용자가 탈퇴 후 재가입 시 현재 User 데이터가 갱신되지 않는 문제가 있었습니다.
<br>

이는 DB에 데이터가 저장되기 전에 인증이 완료되어 홈 화면으로 리다이렉트가 이루어졌고, 이로 인해 화면 갱신이 먼저 이뤄지면서 데이터베이스에서 null 값을 읽어오는 상황이었습니다.
<br>

이 문제를 해결하기 위해, 명시적으로 상태를 갱신하는 메서드(`signInViewModel.signInWithGoogle()`)를 작성하고 호출하여 화면에서 올바른 데이터를 반영할 수 있도록 수정하였습니다. 이를 통해 인증과 상태 관리 간의 타이밍 문제를 효과적으로 해결할 수 있었습니다.
<br>
[0bd64c](https://github.com/kangsudal/Eat-Go/commit/0bd64c057eb0cfcb9a8ba0135d71211bb095d869#diff-1d3db75ec69a30fc42b472889b887cf588d72b497023136dbbda4512bb6bc388R74)
[da4e25](https://github.com/kangsudal/Eat-Go/commit/da4e25e7e5bdaeb61b667d96a6aab343eaa4762c#diff-aa62413470e4747ba0805ff442318cc50230b9f0931037164a35e871cf55bc44R64)

## 코드 실행 방법
추가예정

## 📂 기획서
[Figma](https://www.figma.com/design/9dihzD5642Y9pduTTPtJ1R/Eat-Go!?node-id=17-250&t=H6rdwSURuCKQ0Gui-1)

[Google Slide](https://medium.com/@kangsudal/eat-go-%EA%B8%B0%ED%9A%8D%EC%84%9C-%EB%B0%9C%ED%91%9C-e0aedb679e3d)

## 📫 연락처
kangsudal@gmail.com
