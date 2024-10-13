import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/repositories/auth_repository.dart';
import 'package:eat_go/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

/*
  책임: 사용자 데이터(User Data)와 관련된 비즈니스 로직을 처리합니다.
  역할: 인증 이후의 사용자 정보 저장, 프로필 관리, 데이터베이스에서 사용자 정보 CRUD(Create, Read, Update, Delete) 작업을 수행합니다.
  처리 대상: Firestore, Realtime Database 등과의 상호작용을 통한 사용자 데이터 관리.
  주요 기능:

  사용자 정보 저장
  사용자 정보 업데이트
  사용자 정보 가져오기
  사용자 프로필 관리
 */
class UserService {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  UserService({required this.userRepository, required this.authRepository});

  // 사용자 정보 저장
  Future<void> saveUser(User user) async {
    try {
      await userRepository.saveUserInfo(user);
    } catch (e) {
      debugPrint('UserService에서 사용자 정보 저장 오류: $e');
    }
  }

  // 사용자 정보 가져오기
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      return await userRepository.getUserInfo(uid);
    } catch (e) {
      debugPrint('UserService에서 사용자 정보 로드 오류: $e');
    }
    return null;
  }

  // 사용자 계정 삭제와 Firestore 데이터 삭제
  Future<void> deleteUserAccountAndInfo() async {
    try {
      // 1. 현재 로그인된 사용자의 UID 가져오기
      String? uid = authRepository.getCurrentUserUid();
      if (uid == null) {
        throw Exception('사용자가 로그인되어 있지 않습니다.');
      }

      // 2. Firestore에서 사용자 데이터 삭제
      await userRepository.deleteUserInfo(uid);

      // 3. Firebase Authentication에서 사용자 계정 삭제
      await authRepository.deleteUserAccount();
    } catch (e) {
      debugPrint('UserService 오류 발생 - 회원 탈퇴 로직: $e');
      throw Exception(e);
    }
  }
}
