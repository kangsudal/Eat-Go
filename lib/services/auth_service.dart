import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
  Future<UserCredential?> authenticateWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          // AppleIDAuthorizationScopes.fullName,
        ], //scopes의 내용으로 user의 email, fullName을 선택 동의로 받아올수 있음
      );

      // Apple의 인증 자격(credential)을 기반으로 OAuth 인증 자격을 생성
      // 'apple.com'은 OAuth 공급자로, Apple OAuth 인증을 나타냄
      // OAuth 인증 자격(OAuth Credential)은 OAuth 프로세스에서 사용자의 신원과 권한을 증명하는 데 사용되는 토큰을 포함하는 객체.
      // 이를 통해 사용자는 비밀번호를 제공하지 않고도 서비스에 로그인하거나 권한을 부여할 수 있음
      final OAuthCredential credential = OAuthProvider('apple.com').credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Firebase Authentication에 위에서 생성한 OAuthCredential을 전달하여 로그인 처리
      final UserCredential authResult =
          await auth.signInWithCredential(credential);

      return authResult; // 로그인 처리 후, 로그인된 사용자의 UserCredential 객체를 반환
    } catch (e) {
      debugPrint('AuthRepository 오류 발생 - Apple 로그인 실패: $e');
      return null;
    }
  }

  // Firebase 로그아웃
  Future<void> signOut() async {
    await auth.signOut();
  }
}
