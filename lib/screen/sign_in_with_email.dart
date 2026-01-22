import 'package:eat_go/provider/eatgo_providers.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInWithEmail extends ConsumerWidget {
  const SignInWithEmail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SignInScreen(
      providers: [
        EmailAuthProvider(),
      ],
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) async {
          await ref.read(signInViewModelProvider.notifier).signInWithEmail();
        }),
        AuthStateChangeAction<UserCreated>((context, state) async {
          await ref.read(signInViewModelProvider.notifier).signInWithEmail();
        }),
      ],
    );
  }
}
