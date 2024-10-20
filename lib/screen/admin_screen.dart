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
                await updateAllUsersRecipeId();
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

  Future<void> updateAllUsersPushNotificationEnabled() async {
    final firestore = FirebaseFirestore.instance;

    // 1. 'users' 컬렉션의 모든 사용자 문서 가져오기
    QuerySnapshot usersSnapshot = await firestore.collection('users').get();

    // 2. 각 문서에 대해 pushNotificationEnabled 필드 업데이트
    for (var doc in usersSnapshot.docs) {
      try {
        if (doc.exists) {
          // 문서의 데이터가 null이 아닌지 먼저 확인
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
          // 만약 pushNotificationEnabled 필드가 없다면 true로 업데이트
          if (data != null && !data.containsKey('pushNotificationEnabled')) {
            await firestore.collection('users').doc(doc.id).update({
              'pushNotificationEnabled': true,
            });
            debugPrint(
                'User ${doc.id} updated with pushNotificationEnabled: true');
          } else {
            debugPrint(
                'User ${doc.id} already has pushNotificationEnabled field.');
          }
        } else {
          debugPrint('User document ${doc.id} does not exist.');
        }
      } catch (e) {
        debugPrint('Error updating user ${doc.id}: $e');
      }
    }
  }

  Future<void> updateAllUsersRecipeId() async {
    final firestore = FirebaseFirestore.instance;

    // 1. 'users' 컬렉션의 모든 사용자 문서 가져오기
    QuerySnapshot usersSnapshot = await firestore.collection('recipes').get();

    // 2. 각 문서에 대해 pushNotificationEnabled 필드 업데이트
    for (var doc in usersSnapshot.docs) {
      try {
        if (doc.exists) {
          await firestore.collection('recipes').doc(doc.id).update({
            'recipeId': doc.id,
          });
          debugPrint('User ${doc.id} is updated');
        } else {
          debugPrint('User document ${doc.id} does not exist.');
        }
      } catch (e) {
        debugPrint('Error updating user ${doc.id}: $e');
      }
    }
    debugPrint("Update Done.");
  }
}
