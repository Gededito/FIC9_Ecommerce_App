import 'package:fic9_ecommerce_app/presentation/auth/login_page.dart';
import 'package:flutter/material.dart';

import '../../common/constants/images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
