// auth_repository.dart
import 'package:eat_go/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required authService}) : _authService = authService;

  String? getCurrentUserUid() {
    return _authService.getCurrentUserUid();
  }

  Future<UserCredential?> authenticateWithGoogle() async {
    return await _authService.authenticateWithGoogle();
  }

  Future<UserCredential?> authenticateWithApple() async {
    return await _authService.authenticateWithApple();
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
