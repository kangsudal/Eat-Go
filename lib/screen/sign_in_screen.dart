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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: GestureDetector(
                child: Image.asset('assets/icons/apple_sq_ctn.png'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/home");
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: GestureDetector(
                child: Image.asset('assets/icons/google_light_sq_ctn.png'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
