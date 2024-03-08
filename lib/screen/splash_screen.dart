// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:healthy_pet_app/screen/dashboard_screen.dart';
import 'package:healthy_pet_app/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const DashboardScreen(
                    currentTab: 0,
                  )),
          (route) => false);
    });

    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/Background.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/Logo.png',
                  width: 144,
                ),
                const SizedBox(
                  height: 74,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Helping you\nto keep ',
                    style: TextStyle(
                        color: Color(0xFFDEE1FE),
                        fontSize: 24,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5),
                    children: [
                      TextSpan(
                        text: 'your bestie',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5),
                      ),
                      TextSpan(
                        text: '\nstay healthy!',
                        style: TextStyle(
                            color: Color(0xFFDEE1FE),
                            fontSize: 24,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
