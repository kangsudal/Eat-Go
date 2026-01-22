import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/utils/app_logger.dart';
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
                // await textSearch("가지볶음");
                // await updateAllRecipesChangeCreatedBy();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('All users updated successfully!'),
                  ),
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
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final WriteBatch batch = firestore.batch();

    // 레시피 컬렉션의 모든 문서를 참조
    final QuerySnapshot<Map<String, dynamic>> recipesSnapshot =
        await firestore.collection('recipes').get();

    for (var doc in recipesSnapshot.docs) {
      // userClapCounts 필드를 삭제하고 clapRecords를 빈 리스트로 초기화
      batch.update(doc.reference, {
        'userClapCounts': FieldValue.delete(),
        'clapRecords': [], // ClapRecord 리스트로 초기화
      });
    }

    // 일괄 업데이트 실행
    await batch.commit();
    logger.d('모든 레시피 문서가 업데이트되었습니다.');
  }

  void textSearch(String queryValue) async {
    final location = await Geolocator.getCurrentPosition();
    final headers = {
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
          'places.location',
    };
    final request = http.Request(
      'POST',
      Uri.parse('https://places.googleapis.com/v1/places:searchText'),
    );
    request.body = json.encode({
      'textQuery': queryValue,
      'languageCode': 'ko',
      'locationBias': {
        'circle': {
          'center': {
            'latitude': location.latitude,
            'longitude': location.longitude,
          },
          'radius': 50000.0,
        },
      },
    });
    request.headers.addAll(headers);

    final http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final String result = await response.stream.bytesToString();
      logger.d(result);
    } else {
      logger.e(response.reasonPhrase);
    }
  }
}
