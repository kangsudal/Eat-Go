import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                await updateAllRecipes();

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
}
