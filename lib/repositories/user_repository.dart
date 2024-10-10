import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseFirestore firestore;

  UserRepository({required this.firestore});

  // Firebase에 사용자 정보를 저장하는 메서드
  Future<void> saveUserInfo(User user) async {
    try {
      final userDoc = firestore.collection('users').doc(user.uid);
      final docSnapshot = await userDoc.get();

      if (!docSnapshot.exists) {
        // 최초 로그인일 때만 Firestore에 사용자 정보 저장
        await userDoc.set({
          'uid': user.uid,
          'displayName': user.displayName,
          'email': user.email,
          'supportAmount': 0, //후원 비용
          'isPremium': false, //프리미엄 상태 FieldValue.serverTimestamp()
          'premiumExpiration': DateTime.now().millisecondsSinceEpoch,
          'bookmarks': [], // 사용자가 북마크한 레시피 목록
          'adoptedRecipes': [], // 사용자가 채택한 레시피 목록
          'reportedRecipes': [], // 사용자 신고한 레시피 목록, 목록에서 차단해주기
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
}
