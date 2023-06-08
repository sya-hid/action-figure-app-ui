import 'package:action_figure_app_ui/consts.dart';
import 'package:action_figure_app_ui/pages/main_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Image.asset(
              'assets/imageedit_16_4886890813.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 70),
            Text(
              'Explore and find\nThe Best Action Figure',
              textAlign: TextAlign.center,
              style: poppins.copyWith(
                  fontSize: 24, fontWeight: FontWeight.bold, color: black),
            ),
            const SizedBox(height: 20),
            Text(
              'The best platform to buy action\nfigure quickly and easily',
              textAlign: TextAlign.center,
              style: poppins.copyWith(color: black.withOpacity(0.6)),
            ),
            const SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const MainPage();
                      },
                    ));
              },
              child: Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    'Get Started',
                    style: poppins.copyWith(color: white, fontSize: 16),
                  ))),
            ),
            const SizedBox(height: 40),
            RichText(
                text: TextSpan(style: poppins, children: [
              const TextSpan(text: 'Don\'t have account ? '),
              TextSpan(
                  text: 'Sign Up',
                  style: poppins.copyWith(
                      color: green, fontWeight: FontWeight.bold)),
            ])),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
