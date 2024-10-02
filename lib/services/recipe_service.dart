import 'dart:convert'; // For jsonDecode
import 'dart:io'; // For reading files
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

//API 통신, 데이터베이스 접근, 외부 서버와의 데이터 교환 등을 담당
//결과를 viewmodel를 통해 view에게 전달

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Uuid uuid = const Uuid();

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
