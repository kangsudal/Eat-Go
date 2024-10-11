// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth;
  final FlutterSecureStorage secureStorage;

  AuthService({required this.auth, required this.secureStorage});

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
      final User? user = authResult.user;

      if (user != null) {
        // 자동로그인을 위해 토큰 저장
        String? token = await user.getIdToken();
        await secureStorage.write(key: 'authToken', value: token);
      }

      return authResult;
    } catch (e) {
      print('Google 로그인 실패: $e');
      return null;
    }
  }

  // Firebase 로그아웃 및 토큰 삭제
  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
    await secureStorage.delete(key: 'authToken'); // 토큰 삭제
  }

  // 저장된 토큰 불러오기
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'authToken');
  }

  // 자동 로그인 체크
  Future<bool> isLoggedIn() async {
    String? token = await getToken();
    return token != null; // 토큰이 있으면 로그인된 상태
  }
}
