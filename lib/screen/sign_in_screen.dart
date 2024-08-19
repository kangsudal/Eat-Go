import 'package:eat_go/palette.dart';
import 'package:eat_go/screen/home_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onTap: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
            const SizedBox(height: 10),
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
              onTap: () {
                Navigator.pushReplacementNamed(context, "/home");
              },
            ),
          ],
        ),
      ),
    );
  }
}
