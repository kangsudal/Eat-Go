/*
Repository: "피자 창고 관리자"
Repository는 창고 관리자라고 생각할 수 있어. 창고에는 다양한 피자 재료가 있고, 그걸 필요에 따라 주방으로 보내주지. 만약 창고에 재료가 없으면 창고 관리자는 외부에서 새 재료를 사 오기도 하고(API 호출), 이미 있는 재료를 주방에 가져다주기도 해(캐시, 로컬 DB).

Repository는 데이터를 어디서 가져올지 결정하는 역할을 해. 데이터가:

API에서 직접 가져와야 하는지(주방에서 피자를 만들지),
이미 캐시에 있는 데이터(창고에 남아 있는 재료)를 쓸 건지,
로컬 데이터베이스에서 가져와야 하는지(창고 안 재고를 쓸 건지).
Repository는 데이터 소스를 추상화해서, **주방(Services)**에 재료를 전달하기 전에 여러 경로를 관리해.

차이를 정리하자면:
Services(주방): 데이터를 실제로 처리하는 곳. 예를 들어, 서버에서 데이터를 가져오거나, API를 호출하는 일을 함.
Repository(창고 관리자): 데이터를 어디서 가져올지 결정하는 중간 관리자. 데이터를 API에서 바로 가져오거나, 캐시나 로컬 데이터베이스에서 가져오는 방법을 결정함.
예를 들어:
손님이 **피자(데이터)**를 주문하면:
**Repository(창고 관리자)**는 먼저 창고에 재료가 있는지 확인하고, 만약 있다면 주방에 재료를 전달해.
만약 창고에 없으면 **Services(주방)**에 요청해서 재료를 새로 준비하거나 외부에서 사 오도록 시켜.
Repository는 데이터의 출처를 관리하는 책임이 있고, Services는 그 데이터를 처리하는 실질적인 작업을 담당해.

 */
import 'dart:convert'; // For jsonDecode
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class RecipeService {
  RecipeService({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;
  final Uuid uuid = const Uuid();

  // Firestore에서 실시간으로 레시피 목록을 가져오는 Stream
  Stream<List<Recipe>> fetchRecipesStream() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> recipesStream =
        _firestore.collection('recipes').snapshots();
    return recipesStream.map((snapshot) {
      return snapshot.docs.map((doc) {
        final recipeData = doc.data();
        return Recipe.fromJson({
          ...recipeData,
          'recipeId': doc.id,
        });
      }).toList();
    });
  }

  // 로컬 텍스트 파일 -> 파이어스토어
  // JSON 파일을 읽고 Firestore에 저장하는 함수
  Future<void> uploadJsonToFirestore(
    String filePath,
    String collectionName,
  ) async {
    try {
      // 로컬 파일에서 JSON 읽기
      final String jsonString = await rootBundle.loadString(filePath);

      // JSON 데이터를 Map으로 변환
      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final Map<String, dynamic> cookrcp01 =
          jsonData['COOKRCP01'] as Map<String, dynamic>;

      for (final Map<String, dynamic> item
          in cookrcp01['row'] as List<dynamic>) {
        final Map<String, dynamic> insertMap = {
          'title': item['RCP_NM'],
          'ingredients': item['RCP_PARTS_DTLS'],
          'ingredientsImgUrl': item['ATT_FILE_NO_MK'],
          //ATT_FILE_NO_MK에는 썸네일이나 재료용 사진이 들어가 있다.
          'descriptions': [
            {
              'description': item['MANUAL01'],
              'descriptionImgUrl': item['MANUAL_IMG01'],
            },
            {
              'description': item['MANUAL02'],
              'descriptionImgUrl': item['MANUAL_IMG02'],
            },
            {
              'description': item['MANUAL03'],
              'descriptionImgUrl': item['MANUAL_IMG03'],
            },
            {
              'description': item['MANUAL04'],
              'descriptionImgUrl': item['MANUAL_IMG04'],
            },
            {
              'description': item['MANUAL05'],
              'descriptionImgUrl': item['MANUAL_IMG05'],
            },
            {
              'description': item['MANUAL06'],
              'descriptionImgUrl': item['MANUAL_IMG06'],
            },
            {
              'description': item['MANUAL07'],
              'descriptionImgUrl': item['MANUAL_IMG07'],
            },
            {
              'description': item['MANUAL08'],
              'descriptionImgUrl': item['MANUAL_IMG08'],
            },
            {
              'description': item['MANUAL09'],
              'descriptionImgUrl': item['MANUAL_IMG09'],
            },
            {
              'description': item['MANUAL10'],
              'descriptionImgUrl': item['MANUAL_IMG10'],
            },
            {
              'description': item['MANUAL11'],
              'descriptionImgUrl': item['MANUAL_IMG11'],
            },
            {
              'description': item['MANUAL12'],
              'descriptionImgUrl': item['MANUAL_IMG12'],
            },
            {
              'description': item['MANUAL13'],
              'descriptionImgUrl': item['MANUAL_IMG13'],
            },
            {
              'description': item['MANUAL14'],
              'descriptionImgUrl': item['MANUAL_IMG14'],
            },
            {
              'description': item['MANUAL15'],
              'descriptionImgUrl': item['MANUAL_IMG15'],
            },
            {
              'description': item['MANUAL16'],
              'descriptionImgUrl': item['MANUAL_IMG16'],
            },
            {
              'description': item['MANUAL17'],
              'descriptionImgUrl': item['MANUAL_IMG17'],
            },
            {
              'description': item['MANUAL18'],
              'descriptionImgUrl': item['MANUAL_IMG18'],
            },
            {
              'description': item['MANUAL19'],
              'descriptionImgUrl': item['MANUAL_IMG19'],
            },
            {
              'description': item['MANUAL20'],
              'descriptionImgUrl': item['MANUAL_IMG20'],
            },
          ],
          'category': item['RCP_PAT2'],
          'hashTag': item['HASH_TAG'],
          'completedImgUrl': item['ATT_FILE_NO_MAIN'],
          'createdAt': DateTime.now(),
          'createdBy': 'MFDS',
          'updatedAt': DateTime.now(),
          'clapRecords': [], // List<ClapRecord> 필드 초기화
          'bookmarkedBy': [],
          'viewedBy': [],
        };
        // Firestore에 JSON 데이터 저장
        await _firestore.collection(collectionName).add(insertMap);
      }
      logger.i('JSON 데이터가 Firestore에 성공적으로 업로드되었습니다.');
    } catch (e) {
      logger.e('JSON 데이터 업로드 중 오류 발생', error: e);
    }
  }

  Future<List<Recipe>> fetchRecipesFuture() async {
    try {
      // Firestore의 모든 레시피 문서를 가져옴
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('recipes').get();

      // 각 문서를 Recipe 객체로 변환
      return snapshot.docs.map((doc) {
        final recipeData = doc.data();

        // `recipeData`와 `doc.id`를 출력하여 확인
        // debugPrint('Recipe Data: $recipeData');
        // debugPrint('Document ID (recipeId): ${doc.id}');

        return Recipe.fromJson({
          ...recipeData,
          'recipeId': doc.id, // Firestore 문서 ID를 recipeId로 할당
        });
      }).toList();
    } catch (e) {
      logger.e('RecipeService - 레시피를 가져오는 중 오류 발생', error: e);
      return []; // 오류 발생 시 빈 리스트 반환
    }
  }

  Future<List<Recipe>> fetchRecipesFutureByIds(
    List<String> bookmarkedRecipeIds,
  ) async {
    try {
      if (bookmarkedRecipeIds.isEmpty) {
        return []; // ID 리스트가 비어있으면 빈 리스트 반환
      }

      // Firestore에서 각 recipeId로 병렬로 get() 요청
      final List<Future<DocumentSnapshot<Map<String, dynamic>>>> futures =
          bookmarkedRecipeIds.map((recipeId) {
        return _firestore.collection('recipes').doc(recipeId).get();
      }).toList();

      // 모든 요청이 완료될 때까지 기다리고 결과를 가져옴
      List<DocumentSnapshot<Map<String, dynamic>>> snapshots =
          await Future.wait(futures);

      snapshots = snapshots
          .where((snapshot) => snapshot.exists)
          .toList(); // 존재하는 문서만 필터링

      final List<Recipe> bookmarkedRecipeList = snapshots.map((snapshot) {
        final recipeData = snapshot.data() ?? {};
        return Recipe.fromJson({
          ...recipeData,
          'recipeId': snapshot.id, // Firestore 문서 ID를 recipeId로 추가
        });
      }).toList(); //snapshot.exists 처리했으므로 snapshot.data()는 null이 아니다.

      return bookmarkedRecipeList;
    } catch (e) {
      logger.e('RecipeService - 레시피를 가져오는 중 오류 발생', error: e);
      return []; // 오류 발생 시 빈 리스트 반환
    }
  }

  String generateRandomDocId() {
    try {
      final String randomId = _firestore.collection('dummy').doc().id;
      return randomId;
    } catch (e) {
      logger.e('RecipeRepository - 랜덤 doc ID 생성중 오류 발생', error: e);
      return '';
    }
  }

  Future<Recipe?> getFilteredRandomRecipeWithoutKeywords({
    required Map<String, dynamic> categories,
  }) async {
    //1. true인 카테고리 라벨 목록 생성
    final List<String> selectedCategories =
        categories.keys.where((key) => categories[key] == true).toList();

    //2. 랜덤 시작점
    final String randomId = generateRandomDocId();
    if (randomId == '') {
      logger.w("RecipeService - Random Doc Id가 ''입니다.");
      return null;
    }
    try {
      //1. 카테고리 필터 쿼리
      Query query = _firestore
          .collection('recipes')
          .where('category', whereIn: selectedCategories);

      //2. 랜덤 ID보다 큰 문서 중 7개 문서를 가져옴
      query = query
          .where(FieldPath.documentId, isGreaterThanOrEqualTo: randomId)
          .limit(7);

      //쿼리 실행
      final QuerySnapshot querySnapshot = await query.get();

      // 쿼리 결과가 없으면(랜덤하게 생성된 ID보다 큰 문서가 없다면) null 반환
      if (querySnapshot.docs.isEmpty) {
        logger.w(
          'RecipeService - 조건에 맞는 문서가 없습니다(랜덤하게 생성된 ID보다 큰 문서가 없을 가능성이있습니다)',
        );
        return null;
      }

      // 결과가 있는 경우 무작위로 선택
      final randomDoc =
          querySnapshot.docs[Random().nextInt(querySnapshot.docs.length)];
      final Map<String, Object?> dataMap =
          randomDoc.data() as Map<String, Object?>;
      return Recipe.fromJson({
        ...dataMap,
        'recipeId': randomDoc.id,
      });
    } catch (e) {
      logger.e('RecipeService - 랜덤 레시피 생성중 오류발생', error: e);
      return null;
    }
  }

  //홈화면 랜덤 레시피
  Future<Recipe?> getFilteredRandomRecipeWithKeywords({
    required Map<String, dynamic> categories,
    required String keywords, // 키워드 필터 ('두부 버섯')
  }) async {
    //1. true인 카테고리 라벨 목록 생성
    final List<String> selectedCategories =
        categories.keys.where((key) => categories[key] == true).toList();

    //2. 키워드 필터 생성
    final List<String> keywordList =
        keywords.trim().isNotEmpty ? keywords.trim().split(' ') : [];

    try {
      //1. 카테고리 필터 쿼리
      final Query query = _firestore
          .collection('recipes')
          .where('category', whereIn: selectedCategories);

      //쿼리 실행
      final QuerySnapshot querySnapshot = await query.get();

      // 쿼리 결과가 없으면(랜덤하게 생성된 ID보다 큰 문서가 없다면) null 반환
      if (querySnapshot.docs.isEmpty) {
        logger.w('RecipeService - 조건에 맞는 문서가 없습니다.');
        return null;
      }

      //2. 키워드 필터가 있는 경우, keywordList에 있는 키워드들이 포함된 모든 문서
      if (keywordList.isNotEmpty) {
        // 필터링: title, hashTag, descriptions에서 키워드가 포함된 레시피 찾기
        final List<DocumentSnapshot> filteredDocs =
            querySnapshot.docs.where((doc) {
          final title = doc['title'] as String;
          final ingredients = doc['ingredients'] as String;
          final hashTag =
              doc['hashTag'] as String? ?? ''; // 해시태그가 없을 경우 빈 문자열로 처리

          // 키워드 리스트를 돌며 title, hashTag, descriptions에서 일치 여부 확인
          return keywordList.every(
            (keyword) =>
                title.contains(keyword) ||
                ingredients.contains(keyword) ||
                hashTag.contains(keyword),
          );
        }).toList();

        // 필터링된 문서들이 없다면 null 반환
        if (filteredDocs.isEmpty) {
          logger.w('RecipeService - 키워드와 일치하는 문서가 없습니다.');
          return null;
        }

        // 필터링된 문서들을 Recipe 객체로 변환
        final List<Recipe> filteredRecipes = filteredDocs.map((doc) {
          return Recipe.fromJson({
            ...doc.data() as Map<String, dynamic>,
            'recipeId': doc.id, // Firestore 문서 ID를 recipeId로 할당
          });
        }).toList();

        return filteredRecipes[Random().nextInt(filteredRecipes.length)];
      }

      //키워드가 비어있는 경우 이 메서드는 null을 반하여 상위 메서드에서 다른 로직이 작동하도록 합니다.
      //(getRandomRecipeWithoutKeywords가 호출될 수 있게 합니다.)
      return null;
    } catch (e) {
      logger.e('RecipeService - 랜덤 레시피 생성중 오류발생', error: e);
      return null;
    }
  }

  //전체 화면 페이지
  Future<List<Recipe>?> getFilteredRecipeList({
    required Map<String, dynamic> categories,
    required String keywords, // 키워드 필터 ('두부 버섯')
  }) async {
    // 1. true인 카테고리 라벨 목록 생성
    final List<String> selectedCategories =
        categories.keys.where((key) => categories[key] == true).toList();

    // 2. 키워드 필터 생성
    final List<String> keywordList =
        keywords.trim().isNotEmpty ? keywords.trim().split(' ') : [];

    try {
      // 카테고리 필터 쿼리 생성
      final Query query = _firestore
          .collection('recipes')
          .where('category', whereIn: selectedCategories);

      // 쿼리 실행
      final QuerySnapshot querySnapshot = await query.get();

      // 쿼리 결과가 없으면 빈 리스트 반환
      if (querySnapshot.docs.isEmpty) {
        logger.w('RecipeService - 조건에 맞는 문서가 없습니다.');
        return [];
      }

      // 키워드가 없는 경우 모든 결과 반환
      if (keywordList.isEmpty) {
        return convertToRecipes(querySnapshot.docs);
      }

      // 키워드 필터가 있는 경우 필터링된 결과 반환
      final List<DocumentSnapshot> filteredDocs =
          querySnapshot.docs.where((doc) {
        final title = doc['title'] as String;
        final ingredients = doc['ingredients'] as String;
        final hashTag =
            doc['hashTag'] as String? ?? ''; // 해시태그가 없을 경우 빈 문자열로 처리

        // 키워드 리스트를 돌며 title, ingredients, hashTag에서 일치 여부 확인
        return keywordList.every(
          (keyword) =>
              title.contains(keyword) ||
              ingredients.contains(keyword) ||
              hashTag.contains(keyword),
        );
      }).toList();

      // 필터링된 문서들이 없다면 빈 리스트 반환
      if (filteredDocs.isEmpty) {
        logger.w('RecipeService - 키워드와 일치하는 문서가 없습니다.');
        return [];
      }

      // 필터링된 문서들을 Recipe 객체로 변환 후 반환
      return convertToRecipes(filteredDocs);
    } catch (e) {
      logger.e('RecipeService - 필터된 전체 레시피 생성 중 오류 발생', error: e);
      return [];
    }
  }

  // Recipe 변환 함수 (공통 로직을 함수로 추출)
  List<Recipe> convertToRecipes(List<DocumentSnapshot> docs) {
    return docs.map((doc) {
      final recipeData = doc.data() as Map<String, dynamic>;
      return Recipe.fromJson({
        ...recipeData,
        'recipeId': doc.id,
      });
    }).toList();
  }

  //상세 레시피 페이지
  Future<Recipe> getRecipeById({required String recipeId}) async {
    try {
      final DocumentReference docReference =
          _firestore.collection('recipes').doc(recipeId);
      final docSnapshot = await docReference.get();

      //데이터가 존재하지않으면
      if (!docSnapshot.exists) {
        throw Exception('해당 recipeId의 레시피가 존재하지 않습니다.');
      }
      //Firestore 문서를 Recipe 객체로 변환
      final Map<String, dynamic> recipeData =
          docSnapshot.data() as Map<String, dynamic>;
      //Recipe 객체로 변환
      final recipe = Recipe.fromJson({
        ...recipeData,
        'recipeId': docSnapshot.id,
      });
      return recipe;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> updateRecipeData({required Recipe updatedRecipe}) async {
    try {
      final Map<String, dynamic> recipeMap = updatedRecipe.toJson();
      await _firestore
          .collection('recipes')
          .doc(updatedRecipe.recipeId)
          .update(recipeMap);
      return true;
    } catch (e) {
      logger.e('RecipeService - 레시피 데이터 업데이트 중 오류 발생', error: e);
      return false;
    }
  }

  Future<List<Recipe>> fetchRecipesByCreatedBy({
    required String createdBy,
  }) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('recipes')
          .where('createdBy', isEqualTo: createdBy)
          .get();

      // 쿼리 결과가 없으면 빈 리스트 반환
      if (snapshot.docs.isEmpty) {
        logger.w('RecipeService -fetchRecipesByCreatedBy- 조건에 맞는 문서가 없습니다.');
        return [];
      }

      // 각 문서를 Recipe 객체로 변환
      return convertToRecipes(snapshot.docs);
    } catch (e) {
      logger.e(
        'RecipeService fetchRecipesByCreatedBy- 레시피를 가져오는 중 오류 발생',
        error: e,
      );
      throw Exception(
        'RecipeService fetchRecipesByCreatedBy- 레시피를 가져오는 중 오류 발생: $e',
      ); // 오류 발생 시 빈 리스트 반환
    }
  }
}
