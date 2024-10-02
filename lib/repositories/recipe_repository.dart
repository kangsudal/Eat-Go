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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/recipe_model.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class RecipeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid uuid = const Uuid();

  // Firestore에서 실시간으로 레시피 목록을 가져오는 Stream
  Stream<List<Recipe>> fetchRecipesStream() {
    return _firestore.collection('recipes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Recipe.fromJson(doc.data());
      }).toList();
    });
  }

  // 로컬 텍스트 파일 -> 파이어스토어
  // JSON 파일을 읽고 Firestore에 저장하는 함수
  Future<void> uploadJsonToFirestore(
      String filePath, String collectionName) async {
    try {
      // 로컬 파일에서 JSON 읽기
      String jsonString = await rootBundle.loadString(filePath);

      // JSON 데이터를 Map으로 변환
      Map<String, dynamic> jsonData = jsonDecode(jsonString);

      for (Map<String, dynamic> item in jsonData['COOKRCP01']["row"]) {
        Map<String, dynamic> insertMap = {
          'recipeId': uuid.v4(),
          'title': item["RCP_NM"],
          'ingredients': item["RCP_PARTS_DTLS"],
          'ingredientsImgUrl': item["ATT_FILE_NO_MK"],
          //ATT_FILE_NO_MK에는 썸네일이나 재료용 사진이 들어가 있다.
          'descriptions': [
            {
              'description': item["MANUAL01"],
              'descriptionImgUrl': item['MANUAL_IMG01'],
            },
            {
              'description': item["MANUAL02"],
              'descriptionImgUrl': item['MANUAL_IMG02'],
            },
            {
              'description': item["MANUAL03"],
              'descriptionImgUrl': item['MANUAL_IMG03'],
            },
            {
              'description': item["MANUAL04"],
              'descriptionImgUrl': item['MANUAL_IMG04'],
            },
            {
              'description': item["MANUAL05"],
              'descriptionImgUrl': item['MANUAL_IMG05'],
            },
            {
              'description': item["MANUAL06"],
              'descriptionImgUrl': item['MANUAL_IMG06'],
            },
            {
              'description': item["MANUAL07"],
              'descriptionImgUrl': item['MANUAL_IMG07'],
            },
            {
              'description': item["MANUAL08"],
              'descriptionImgUrl': item['MANUAL_IMG08'],
            },
            {
              'description': item["MANUAL09"],
              'descriptionImgUrl': item['MANUAL_IMG09'],
            },
            {
              'description': item["MANUAL10"],
              'descriptionImgUrl': item['MANUAL_IMG10'],
            },
            {
              'description': item["MANUAL11"],
              'descriptionImgUrl': item['MANUAL_IMG11'],
            },
            {
              'description': item["MANUAL12"],
              'descriptionImgUrl': item['MANUAL_IMG12'],
            },
            {
              'description': item["MANUAL13"],
              'descriptionImgUrl': item['MANUAL_IMG13'],
            },
            {
              'description': item["MANUAL14"],
              'descriptionImgUrl': item['MANUAL_IMG14'],
            },
            {
              'description': item["MANUAL15"],
              'descriptionImgUrl': item['MANUAL_IMG15'],
            },
            {
              'description': item["MANUAL16"],
              'descriptionImgUrl': item['MANUAL_IMG16'],
            },
            {
              'description': item["MANUAL17"],
              'descriptionImgUrl': item['MANUAL_IMG17'],
            },
            {
              'description': item["MANUAL18"],
              'descriptionImgUrl': item['MANUAL_IMG18'],
            },
            {
              'description': item["MANUAL19"],
              'descriptionImgUrl': item['MANUAL_IMG19'],
            },
            {
              'description': item["MANUAL20"],
              'descriptionImgUrl': item['MANUAL_IMG20'],
            },
          ],
          'category': item['RCP_PAT2'],
          'hashTag': item['HASH_TAG'],
          'completedImgUrl': item['ATT_FILE_NO_MAIN'],
          'createdAt': DateTime.now().millisecondsSinceEpoch,
          'createdBy': 'MFDS',
          'updatedAt': DateTime.now().millisecondsSinceEpoch,
          'adoptedBy': [],
          'bookmarkedBy': [],
          'viewedBy': [],
        };
        // Firestore에 JSON 데이터 저장
        await _firestore.collection(collectionName).add(insertMap);
      }
      print('JSON 데이터가 Firestore에 성공적으로 업로드되었습니다.');
    } catch (e) {
      print('JSON 데이터 업로드 중 오류 발생: $e');
    }
  }
}
