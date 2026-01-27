# Eat-Go 프로젝트 전체 개선 계획

## 📋 목차
1. [현황 분석](#현황-분석)
2. [Phase 1: 보안 강화](#phase-1-보안-강화-긴급) - ⏳ 대기
3. [Phase 2: 안정성 개선](#phase-2-안정성-개선) - ✅ 완료
4. [Phase 3: 코드 품질 향상](#phase-3-코드-품질-향상) - ✅ 완료
5. [Phase 4: 성능 최적화](#phase-4-성능-최적화) - ✅ 완료
6. [Phase 5: 테스트 및 문서화](#phase-5-테스트-및-문서화) - ⏳ 대기
7. [파일별 수정 사항](#파일별-수정-사항)

---

## 📊 진행 현황 요약 (2025-01-27 업데이트)

| Phase | 상태 | 완료 항목 |
|-------|------|----------|
| Phase 1 | ⏳ 대기 | 수동 작업 필요 (API 키 재생성, Firebase 규칙) |
| Phase 2 | ✅ 완료 | Race Condition 해결 ✅, Late 초기화 개선 ✅ |
| Phase 3 | ✅ 완료 | BookmarkService ✅, Provider 분리 ✅, 상수 클래스 ✅ |
| Phase 4 | ✅ 완료 | 위젯 최적화 ✅, CachedNetworkImage ✅, 캐싱 ✅ |
| Phase 5 | ⏳ 대기 | 테스트 작성 필요 |

---

## 현황 분석

### 프로젝트 구조
```
lib/ (93개 파일)
├── model/           # 데이터 모델 (Freezed)
├── services/        # Firebase 호출
├── repository/      # 데이터 소스 추상화
├── viewmodels/      # 상태 관리 (Riverpod)
├── provider/        # DI 설정
├── screen/          # UI
└── utils/           # 유틸리티
```

### 발견된 문제 수
| 심각도 | 개수 | 즉시 대응 필요 |
|--------|------|--------------|
| 🔴 높음 | 3개 | ✅ |
| 🟠 중간 | 7개 | - |
| 🟡 낮음 | 4개 | - |

---

## Phase 1: 보안 강화 (긴급)

### 1.1 API 키 재생성 및 보안 설정

#### 작업 항목
- [ ] Firebase Console에서 API 키 재생성
- [ ] Google Cloud Console에서 Maps API 키 재생성
- [ ] API 키에 앱 제한 설정 (패키지명, SHA-1)

#### 수정 파일
```
lib/firebase_options.dart
.env
android/app/build.gradle
```

#### 상세 작업
1. **Firebase API 키 재생성**
   - Firebase Console → 프로젝트 설정 → 일반
   - 각 플랫폼(Web, Android, iOS) API 키 재생성
   - `firebase_options.dart` 업데이트

2. **Google Maps API 키 보안**
   - Google Cloud Console → API 및 서비스 → 사용자 인증 정보
   - 앱 제한 설정: Android 앱, iOS 앱만 허용
   - 패키지명: `com.kangsudal.eatgo`

3. **환경 변수 보안**
   ```yaml
   # .gitignore에 추가
   .env
   .env.*
   ```

   ```yaml
   # pubspec.yaml에서 .env를 assets에서 제거
   assets:
     - assets/
     - assets/icons/
     - assets/images/
     # - .env  ← 제거
   ```

4. **Git 히스토리 정리**
   ```bash
   # BFG Repo-Cleaner 사용
   bfg --delete-files .env
   bfg --replace-text passwords.txt
   git reflog expire --expire=now --all
   git gc --prune=now --aggressive
   ```

### 1.2 Firebase 보안 규칙 강화

#### 현재 문제
- 클라이언트에서 전체 데이터 접근 가능
- 사용자 권한 검증 부재

#### 권장 Firestore 규칙
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // 사용자 컬렉션
    match /users/{userId} {
      allow read: if request.auth != null && request.auth.uid == userId;
      allow write: if request.auth != null && request.auth.uid == userId;
    }

    // 레시피 컬렉션
    match /recipes/{recipeId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null;
      allow update: if request.auth != null &&
                      (request.auth.uid == resource.data.createdBy ||
                       request.resource.data.diff(resource.data).affectedKeys()
                         .hasOnly(['bookmarkedBy', 'clapCount']));
      allow delete: if request.auth != null &&
                      request.auth.uid == resource.data.createdBy;
    }
  }
}
```

---

## Phase 2: 안정성 개선 ✅ (2025-01-23 완료)

- **2.1 Race Condition 해결** - BookmarkService로 Future.wait 병렬 처리
- **2.2 Late 초기화 개선** - getter 방식으로 변경

---

## Phase 3: 코드 품질 향상 ✅ (2025-01-23 완료)

- **3.1 BookmarkService 추출** - `lib/services/bookmark_service.dart`
- **3.2 Provider 파일 분리** - auth, user, recipe, bookmark, location 분리
- **3.3 상수 클래스 추출** - `lib/constants/app_dimensions.dart`, `app_values.dart`

---

## Phase 4: 성능 최적화 ✅ (2025-01-27 완료)

- **4.1 위젯 Rebuild 최적화** - HomeScreen, BookmarkScreen 위젯 분리
- **4.2 데이터 로딩 최적화** - `lib/services/recipe_cache_service.dart` 캐싱 도입
- **4.3 이미지 최적화** - Image.network를 CachedNetworkImage로 교체

---

## Phase 5: 테스트 및 문서화

### 5.1 테스트 구조 설정

```
test/
├── unit/
│   ├── services/
│   │   ├── bookmark_service_test.dart
│   │   └── recipe_service_test.dart
│   ├── repositories/
│   │   └── recipe_repository_test.dart
│   └── viewmodels/
│       └── home_viewmodel_test.dart
├── widget/
│   ├── home_screen_test.dart
│   └── recipe_card_test.dart
└── integration/
    └── bookmark_flow_test.dart
```

### 5.2 핵심 테스트 케이스

```dart
// test/unit/services/bookmark_service_test.dart
void main() {
  group('BookmarkService', () {
    late BookmarkService bookmarkService;
    late MockUserService mockUserService;
    late MockRecipeService mockRecipeService;

    setUp(() {
      mockUserService = MockUserService();
      mockRecipeService = MockRecipeService();
      bookmarkService = BookmarkService(
        userService: mockUserService,
        recipeService: mockRecipeService,
      );
    });

    test('북마크 추가 시 사용자와 레시피 모두 업데이트', () async {
      // Arrange
      final user = EatGoUser(uid: 'user1', bookmarkRecipeIds: []);
      final recipe = Recipe(recipeId: 'recipe1', bookmarkedBy: []);

      // Act
      final (updatedUser, updatedRecipe) = await bookmarkService.toggleBookmark(
        user: user,
        recipe: recipe,
      );

      // Assert
      expect(updatedUser.bookmarkRecipeIds, contains('recipe1'));
      expect(updatedRecipe.bookmarkedBy, contains('user1'));
    });

    test('북마크 제거 시 사용자와 레시피 모두 업데이트', () async {
      // ...
    });
  });
}
```

---

## 파일별 수정 사항

### 신규 생성 파일
| 파일 | 설명 |
|------|------|
| `lib/services/bookmark_service.dart` | 북마크 로직 통합 |
| `lib/services/recipe_cache_service.dart` | 레시피 메모리 캐싱 |
| `lib/constants/app_dimensions.dart` | UI 상수 |
| `lib/constants/app_values.dart` | 앱 상수 |
| `lib/provider/auth_providers.dart` | 인증 provider 분리 |
| `lib/provider/recipe_providers.dart` | 레시피 provider 분리 |

### 수정 파일
| 파일 | 수정 내용 |
|------|----------|
| `lib/firebase_options.dart` | API 키 재생성 후 업데이트 |
| `lib/viewmodels/home_viewmodel.dart` | Race condition 해결, BookmarkService 사용 |
| `lib/viewmodels/recipe_detail_viewmodel.dart` | Race condition 해결, BookmarkService 사용 |
| `lib/viewmodels/bookmark_viewmodel.dart` | Race condition 해결, BookmarkService 사용 |
| `lib/provider/eatgo_providers.dart` | 분리 후 re-export만 |
| `lib/screen/home_screen/home_screen.dart` | 위젯 분리, CachedNetworkImage |
| `lib/screen/bookmark_screen.dart` | 위젯 분리로 rebuild 최적화 |
| `lib/screen/restaurant_screen/scrollable_cards.dart` | CachedNetworkImage 적용 |
| `lib/repository/recipe_repository.dart` | 캐싱 서비스 연동 |
| `pubspec.yaml` | .env 제거, 폰트 최적화 |
| `.gitignore` | .env 추가 |

---

## 실행 체크리스트

### Phase 1 완료 확인
- [ ] API 키 재생성 완료
- [ ] .env가 .gitignore에 추가됨
- [ ] Firebase 보안 규칙 적용됨
- [ ] 앱 정상 실행 확인

### Phase 2 ✅ 완료 (2025-01-23)

### Phase 3 ✅ 완료 (2025-01-23)

### Phase 4 ✅ 완료 (2025-01-27)

### Phase 5 완료 확인
- [ ] 단위 테스트 작성
- [ ] 주요 플로우 통합 테스트
- [ ] 코드 커버리지 50% 이상

---

## 예상 효과

| 항목 | 개선 전 | 개선 후 |
|------|--------|--------|
| 보안 | API 키 노출 | 보안 강화 |
| 데이터 일관성 | Race condition | 트랜잭션 보장 |
| 코드 중복 | 180줄 중복 | 0줄 |
| 테스트 커버리지 | 0% | 50%+ |
| 위젯 rebuild | 전체 | 부분 |
| APK 크기 | 기준 | 약 15% 감소 |
