import 'package:eat_go/model/user_model.dart';
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

  UserService({required this.userRepository});

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
  }
}
