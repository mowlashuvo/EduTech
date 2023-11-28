import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../authentication/presentation/pages/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
      Timer(const Duration(seconds: 2), () =>
          Navigator.pushReplacementNamed(context, LoginScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: EdgeInsets.symmetric(horizontal: 54.0.w),
        child: const Image(
          width: double.infinity,
          image: AssetImage('assets/images/app_icon.png'),
        ),
      ),
    );
  }

}

