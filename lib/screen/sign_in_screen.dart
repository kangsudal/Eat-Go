import 'dart:io';

import 'package:eat_go/eatgo_providers.dart';
import 'package:eat_go/palette.dart';
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
                        const Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    try {
                      bool success = await signInViewModel.signInWithGoogle();
                      if (success) {
                        if (context.mounted) {
                          context.go("/home");
                        }
                        return;
                      }
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')));
                      }
                    } on FirebaseAuthException catch (error) {
                      debugPrint(
                          'Google 로그인 실패(FirebaseAuthException): ${error.toString()}');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')));
                      }
                    } catch (error) {
                      debugPrint(
                          'Google 로그인 실패(FirebaseAuthException 제외): ${error.toString()}');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')));
                      }
                    }
                  },
                ),
                const SizedBox(height: 10),
                if (Platform.isIOS)
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
                          Image.asset('assets/icons/Apple.png'),
                          const SizedBox(width: 5),
                          const Text(
                            'Continue with Apple',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () async {
                    try {
                      bool success = await signInViewModel.signInWithApple();
                      if (success) {
                        if (context.mounted) {
                          context.go("/home");
                        }
                        return;
                      }
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')));
                      }
                    } on FirebaseAuthException catch (error) {
                      debugPrint(
                          'Apple 로그인 실패(FirebaseAuthException): ${error.toString()}');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')));
                      }
                    } catch (error) {
                      debugPrint(
                          'Apple 로그인 실패(FirebaseAuthException 제외): ${error.toString()}');
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('인증 실패하였습니다.')));
                      }
                    }
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
