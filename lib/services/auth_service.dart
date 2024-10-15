import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService {
  final FirebaseAuth auth;

  AuthService({required this.auth});

  // 현재 로그인된 사용자의 UID 가져오기
  String? getCurrentUserUid() {
    User? user = auth.currentUser;
    return user?.uid; // 현재 로그인된 사용자의 UID를 반환, 없으면 null
  }

  // 사용자 계정 삭제
  Future<void> deleteUserAccount() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.delete(); // Firebase Authentication에서 사용자 계정 삭제
      } else {
        throw Exception("사용자가 로그인되어 있지 않습니다.");
      }
    } catch (e) {
      debugPrint('AuthRepository 오류 발생 - 회원 데이터 삭제 실패: $e');
      throw Exception(e);
    }
  }
}
