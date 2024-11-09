import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // 버튼 클릭 시 일회성 작업 실행
                // await updateRecipesCollection();
                // textSearch("가지볶음");
                // await updateAllRecipesChangeCreatedBy();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('All users updated successfully!')),
                );
              },
              child: const Text('Update All Users'),
            ),
          ],
        ),
      ),
    );
  }

  // Firestore의 모든 레시피 문서를 업데이트
  Future<void> updateAllRecipes() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    WriteBatch batch = _firestore.batch();

    // 레시피 컬렉션의 모든 문서를 참조
    QuerySnapshot<Map<String, dynamic>> recipesSnapshot =
        await _firestore.collection('recipes').get();

    for (var doc in recipesSnapshot.docs) {
      // userClapCounts 필드를 삭제하고 clapRecords를 빈 리스트로 초기화
      batch.update(doc.reference, {
        'userClapCounts': FieldValue.delete(),
        'clapRecords': [], // ClapRecord 리스트로 초기화
      });
    }

    // 일괄 업데이트 실행
    await batch.commit();
    print("모든 레시피 문서가 업데이트되었습니다.");
  }

  Future<void> updateRecipesCollection() async {
    final firestore = FirebaseFirestore.instance;
    final batch = firestore.batch();

    try {
      // recipes 컬렉션의 모든 문서 가져오기
      final querySnapshot = await firestore.collection('recipes').get();

      for (var doc in querySnapshot.docs) {
        // batch에 업데이트 작업 추가: recipeId 필드를 삭제하고, createdBy 값을 업데이트
        batch.update(doc.reference, {
          'recipeId': FieldValue.delete(), // recipeId 필드 삭제
          'createdBy': 'DY1monVBKWcN2xVu17L91JqOgsh2', // createdBy 값 업데이트
        });
      }

      // batch 실행
      await batch.commit();
      print("recipes 컬렉션의 모든 문서가 성공적으로 업데이트되었습니다.");
    } catch (e) {
      print("업데이트 중 오류 발생: $e");
    }
  }

  void textSearch(String queryValue) async {
    final location = await Geolocator.getCurrentPosition();
    var headers = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'X-Goog-Api-Key': dotenv.env['GOOGLE_MAPS_API_KEY']!,
      'X-Goog-FieldMask': 'places.id,'
          'places.displayName,'
          'places.photos,'
          'places.businessStatus,'
          'places.rating,'
          'places.priceLevel,'
          'places.websiteUri,'
          'places.googleMapsUri,'
          'places.formattedAddress,'
          // 'places.nationalPhoneNumber' places.location과 함께 사용하면 Bad Request가 뜬다.
          'places.location'
    };
    var request = http.Request('POST',
        Uri.parse('https://places.googleapis.com/v1/places:searchText'));
    request.body = json.encode({
      "textQuery": queryValue,
      "languageCode": "ko",
      "locationBias": {
        "circle": {
          "center": {
            "latitude": location.latitude,
            "longitude": location.longitude,
          },
          "radius": 50000.0
        }
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String result = await response.stream.bytesToString();
      print(result);
      // do something with the result
    } else {
      print(response.reasonPhrase);
    }
  }

  // 모든 레시피 문서를 작성자 업데이트
  Future<void> updateAllRecipesChangeCreatedBy() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    WriteBatch batch = _firestore.batch();

    // 레시피 컬렉션의 모든 문서를 참조
    QuerySnapshot<Map<String, dynamic>> recipesSnapshot =
        await _firestore.collection('recipes').get();

    for (var doc in recipesSnapshot.docs) {
      // userClapCounts 필드를 삭제하고 clapRecords를 빈 리스트로 초기화
      batch.update(doc.reference, {
        'createdBy': 'ujNZ5NNbSaZ4ng6ec4lqAcsSldc2', // ClapRecord 리스트로 초기화
      });
    }

    // 일괄 업데이트 실행
    await batch.commit();
    print("모든 레시피 문서가 업데이트되었습니다.");
  }
}
