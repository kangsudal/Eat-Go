import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  // Google 로그인 처리
  Future<UserCredential?> authenticateWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null; // 사용자가 로그인 취소
      }

      // 구글 인증 정보를 가져옴
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // 자격 증명 생성
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase에 로그인
      final UserCredential authResult =
          await auth.signInWithCredential(credential);

      return authResult;
    } catch (e) {
      debugPrint('Google 로그인 실패: $e');
      return null;
    }
  }

  // Apple 로그인 처리
/*  Future<UserCredential?> authenticateWithApple() async {
    try {
      final appleProvider = AppleAuthProvider();
      final UserCredential authResult;
      if (kIsWeb) {
        authResult = await FirebaseAuth.instance.signInWithPopup(appleProvider);
      } else {
        authResult =
            await FirebaseAuth.instance.signInWithProvider(appleProvider);
      }
      return authResult;
    } catch (e) {
      debugPrint('AuthRepository 오류 발생 - Apple 로그인 실패: $e');
      return null;
    }
  }*/

  // Firebase 로그아웃 및 토큰 삭제
  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }
}
