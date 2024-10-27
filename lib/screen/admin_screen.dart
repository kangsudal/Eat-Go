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
                await removeAdoptedRecipesFieldFromUsers();
                await removeAdoptedByFieldFromRecipes();
                await initializeClapsForAllRecipes();
                await initializeClappedRecipesForAllUsers();

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

  Future<void> updateAllUsersRecipeCreatedUpdatedTimeType() async {
    final firestore = FirebaseFirestore.instance;

    // 1. 'users' 컬렉션의 모든 사용자 문서 가져오기
    QuerySnapshot usersSnapshot = await firestore.collection('recipes').get();

    // 2. 각 문서에 대해 pushNotificationEnabled 필드 업데이트
    for (var doc in usersSnapshot.docs) {
      try {
        if (doc.exists) {
          await firestore.collection('recipes').doc(doc.id).update({
            'createdAt': DateTime.now(),
            'updatedAt': DateTime.now(),
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

  //reportedRecipe 필드 삭제
  Future<void> deleteReportedRecipesFieldForAllUsers() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final usersSnapshot = await usersCollection.get();

    for (var userDoc in usersSnapshot.docs) {
      await userDoc.reference.update({
        'reportedRecipes': FieldValue.delete(),
      });
    }
  }

  //recipeReportIds 필드 추가
  Future<void> updateAllUsersRecipeReportIdsField() async {
    final firestore = FirebaseFirestore.instance;

    // 1. 'users' 컬렉션의 모든 사용자 문서 가져오기
    QuerySnapshot usersSnapshot = await firestore.collection('users').get();

    // 2. 각 문서에 대해 recipeReportIds 필드 업데이트
    for (var doc in usersSnapshot.docs) {
      try {
        if (doc.exists) {
          // 문서의 데이터가 null이 아닌지 먼저 확인
          final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
          // 만약 recipeReportIds 필드가 없다면 빈 리스트로 업데이트
          if (data != null && !data.containsKey('recipeReportIds')) {
            await firestore.collection('users').doc(doc.id).update({
              'recipeReportIds': [],
            });
            debugPrint('User ${doc.id} updated with recipeReportIds: []');
          } else {
            debugPrint('User ${doc.id} already has recipeReportIds field.');
          }
        } else {
          debugPrint('User document ${doc.id} does not exist.');
        }
      } catch (e) {
        debugPrint('Error updating user ${doc.id}: $e');
      }
    }
  }

  //blockedRecipes 필드 추가
  Future<void> updateAllUsersBlockedRecipesField() async {
    final firestore = FirebaseFirestore.instance;

    // 1. 'users' 컬렉션의 모든 사용자 문서 가져오기
    QuerySnapshot usersSnapshot = await firestore.collection('users').get();

    // 2. 각 문서에 대해 blockedRecipes 필드 업데이트
    for (var doc in usersSnapshot.docs) {
      try {
        if (doc.exists) {
          // 문서의 데이터가 null이 아닌지 먼저 확인
          final Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
          // 만약 blockedRecipes 필드가 없다면 빈 리스트로 업데이트
          if (data != null && !data.containsKey('blockedRecipes')) {
            await firestore.collection('users').doc(doc.id).update({
              'blockedRecipes': [],
            });
            debugPrint('User ${doc.id} updated with blockedRecipes: []');
          } else {
            debugPrint('User ${doc.id} already has blockedRecipes field.');
          }
        } else {
          debugPrint('User document ${doc.id} does not exist.');
        }
      } catch (e) {
        debugPrint('Error updating user ${doc.id}: $e');
      }
    }
  }

  //users 컬렉션에서 adoptedRecipes 필드 제거하기
  Future<void> removeAdoptedRecipesFieldFromUsers() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final usersSnapshot = await usersCollection.get();

    for (var userDoc in usersSnapshot.docs) {
      await userDoc.reference.update({
        'adoptedRecipes': FieldValue.delete(),
      });
    }
  }

  //recipes 컬렉션에서 adoptedBy 필드 제거하
  Future<void> removeAdoptedByFieldFromRecipes() async {
    final recipesCollection = FirebaseFirestore.instance.collection('recipes');
    final recipesSnapshot = await recipesCollection.get();

    for (var recipeDoc in recipesSnapshot.docs) {
      await recipeDoc.reference.update({
        'adoptedBy': FieldValue.delete(),
      });
    }
  }

  //recipes 컬렉션에서 claps, userClapCounts 초기화 함수
  Future<void> initializeClapsForAllRecipes() async {
    final recipesCollection = FirebaseFirestore.instance.collection('recipes');
    final recipesSnapshot = await recipesCollection.get();

    for (var recipeDoc in recipesSnapshot.docs) {
      await recipeDoc.reference.update({
        'claps': 0, // 기본 클랩 수를 0으로 설정
        'userClapCounts': {}, // 사용자별 클랩 수를 기록할 빈 맵 추가
      });
    }
  }

  //users 컬렉션에서 clappedRecipes 필드 초기화 함수
  Future<void> initializeClappedRecipesForAllUsers() async {
    final usersCollection = FirebaseFirestore.instance.collection('users');
    final usersSnapshot = await usersCollection.get();

    for (var userDoc in usersSnapshot.docs) {
      await userDoc.reference.update({
        'clappedRecipes': [], // 사용자가 박수를 친 레시피 목록을 초기화
      });
    }
  }
}
