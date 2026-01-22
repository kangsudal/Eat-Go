import 'dart:io';

import 'package:eat_go/palette.dart';
import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:eat_go/utils/app_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends ConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInViewModel = ref.read(signInViewModelProvider.notifier);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                context.go('/home');
              },
            ),
          ),
          body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/eatgo-logo-opacity0.png',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.fill,
                ),
                Text(
                  'Eat-Go!',
                  style: Theme.of(context).textTheme.displayLarge!,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: EatGoPalette.mainTextColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/Google.png'),
                        const SizedBox(width: 5),
                        const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    try {
                      await signInViewModel.signInWithGoogle();
                      //authStateProvider에서 인증상태 변화 감지 -> GoRouter redirect 실행됨 -> Home으로 이동
                    } on FirebaseAuthException catch (error) {
                      logger.e(
                        'Google 로그인 실패(FirebaseAuthException)',
                        error: error,
                      );
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('인증 실패하였습니다.')),
                      );
                    } catch (error) {
                      logger.e(
                        'Google 로그인 실패(FirebaseAuthException 제외)',
                        error: error,
                      );

                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('인증 실패하였습니다.')),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                if (Platform.isIOS)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: EatGoPalette.mainTextColor,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/icons/Apple.png'),
                            const SizedBox(width: 5),
                            const FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Continue with Apple',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () async {
                        try {
                          await signInViewModel.signInWithApple();
                          //authStateProvider에서 인증상태 변화 감지 -> GoRouter redirect 실행됨 -> Home으로 이동
                        } on FirebaseAuthException catch (error) {
                          logger.e(
                            'Apple 로그인 실패(FirebaseAuthException)',
                            error: error,
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')),
                          );
                        } catch (error) {
                          logger.e(
                            'Apple 로그인 실패(FirebaseAuthException 제외)',
                            error: error,
                          );
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')),
                          );
                        }
                      },
                    ),
                  ),
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: EatGoPalette.mainTextColor,
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(width: 5),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Continue with Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    context.go('/sign_in_with_email');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
