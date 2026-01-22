//UserRepository: 사용자 정보(Firebase DB에서 사용자 데이터 가져오기, 업데이트 등)를 관리.
import 'package:eat_go/model/user_model.dart';
import 'package:eat_go/services/user_service.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
class UserRepository {
  UserRepository({required this.userService});
  final UserService userService;

  // 사용자 정보 저장
  Future<void> saveUser(User user) async {
    try {
      await userService.saveUserInfo(user);
    } catch (e) {
      logger.e('UserRepository에서 사용자 정보 저장 오류', error: e);
    }
  }

  // 사용자 정보 가져오기
  Future<Map<String, dynamic>?> getUser(String uid) async {
    try {
      return await userService.getUserInfo(uid);
    } catch (e) {
      logger.e('UserRepository에서 사용자 정보 로드 오류', error: e);
    }
    return null;
  }

  // 사용자 Firestore 데이터 삭제
  Future<void> deleteUserData(String uid) async {
    try {
      // Firestore에서 사용자 데이터 삭제
      await userService.deleteUserInfo(uid);
    } catch (e) {
      logger.e('UserRepository 오류 발생 - 회원 탈퇴 로직', error: e);
      throw Exception(e);
    }
  }

  Future<bool> updateUserData({
    required EatGoUser updatedUser,
  }) async {
    try {
      // Firestore에서 사용자 데이터 삭제
      await userService.updateUserInfo(updatedUser: updatedUser);
      return true;
    } catch (e) {
      logger.e('UserRepository 오류 발생 - 회원 업데이트 로직', error: e);
      return false;
    }
  }
}
