import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eat_go/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserService {
  final FirebaseFirestore firestore;

  UserService({required this.firestore});

  // Firebase에 사용자 정보를 저장하는 메서드
  Future<void> saveUserInfo(User user) async {
    try {
      final userDoc = firestore.collection('users').doc(user.uid);
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        // 최초 로그인일 때만 Firestore에 사용자 정보 저장
        await userDoc.set({
          'uid': user.uid,
          'displayName': user.email!.split("@")[0], // user.displayName
          'email': user.email,
          'supportAmount': 0, //후원 비용
          'isPremium': false, //프리미엄 상태 FieldValue.serverTimestamp()
          'premiumExpiration': DateTime.now(),
          'bookmarks': [], // 사용자가 북마크한 레시피 목록
          'adoptedRecipes': [], // 사용자가 채택한 레시피 목록
          'recipeReportIds': [], // 사용자 신고한 레시피 목록, 목록에서 차단해주기
          'pushNotificationEnabled': true,
        });
      }
    } catch (e) {
      throw Exception('사용자 정보 저장 중 오류 발생: $e');
    }
  }

// 사용자 정보를 Firebase에서 가져오는 메서드
  Future<Map<String, dynamic>?> getUserInfo(String uid) async {
    try {
      final userDoc = await firestore.collection('users').doc(uid).get();
      return userDoc.exists ? userDoc.data() : null;
    } catch (e) {
      throw Exception('사용자 정보 불러오기 중 오류 발생: $e');
    }
  }

  // Firestore에서 사용자 데이터 삭제
  Future<void> deleteUserInfo(String uid) async {
    try {
      // Firestore에서 uid로 저장된 사용자 문서 삭제
      await firestore.collection('users').doc(uid).delete();
    } catch (e) {
      throw Exception('사용자 데이터 삭제 중 오류 발생: $e');
    }
  }

  Future<bool> updateUserInfo({required EatGoUser updatedUser}) async {
    try {
      Map<String, dynamic> userMap = updatedUser.toJson();
      // debugPrint(userMap.toString());
      // Firestore에서 uid로 저장된 사용자 문서 삭제
      await firestore.collection('users').doc(updatedUser.uid).update(userMap);
      return true;
    } catch (e) {
      debugPrint('UserService - 사용자 데이터 업데이트 중 오류 발생: $e');
      return false;
    }
  }
}
