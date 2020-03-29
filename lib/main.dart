import 'package:flutter/material.dart';
import 'package:twenty4seven_utility/screens/onboarding_screen.dart';
import 'package:twenty4seven_utility/screens/auth_sign_up_screen.dart';
import 'package:twenty4seven_utility/screens/auth_setup_screen.dart';
import 'package:twenty4seven_utility/screens/dashboard.dart';
import 'package:twenty4seven_utility/screens/recharge_history.dart';
import 'package:twenty4seven_utility/screens/usage_stats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {

    return MaterialApp(
      title: "247 Utilities",
      initialRoute: OnboardingScreen.routeName,
      routes: <String, WidgetBuilder>{
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
        AuthSignUpScreen.routeName: (context) => AuthSignUpScreen(),
        AuthSetupScreen.routeName: (context) => AuthSetupScreen(),

        Dashboard.routeName: (context) => Dashboard(),
        RechargeHistory.routeName: (context) => RechargeHistory(),
        UsageStats.routeName: (context) => UsageStats(),
      },
      theme: ThemeData(
        fontFamily: 'Electrolize',
        textTheme: TextTheme(
          button: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
          )
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )
        )
      ),
    );
  }
}