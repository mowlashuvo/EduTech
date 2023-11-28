import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return HomeScreen.route();
      // case LandingScreen.routeName:
      //   return LandingScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case VerifyScreen.routeName:
        return VerifyScreen.route();
      case VerifyResetPasswordScreen.routeName:
        return VerifyResetPasswordScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case ResetPasswordScreen.routeName:
        return ResetPasswordScreen.route(userId: settings.arguments as String);
      case ForgetPasswordScreen.routeName:
        return ForgetPasswordScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
