// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth;

  AuthService({required this.auth});

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
      return await auth.signInWithCredential(credential);
    } catch (e) {
      print('Google 로그인 실패: $e');
      return null;
    }
  }

  // Firebase 로그아웃
  Future<void> signOut() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }
}
