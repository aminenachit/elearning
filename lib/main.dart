import 'package:elearning/screeens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:elearning/constants/app_constants.dart';

import 'auth/forget_pass.dart';
import 'auth/login.dart';
import 'auth/register.dart';

void main() {
  runApp(const MyApp());
}

final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _firebaseInitialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(
                  body: Center(
                child: CircularProgressIndicator(),
              )),
            );
          } else if (snapshot.hasError) {
            const MaterialApp(
              home: Scaffold(
                  body: Center(
                child: Text('An error occured'),
              )),
            );
          }
          return MaterialApp(
              title: 'SkillShare',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: AppConstants.primaryColor,
              ),
              home: HomeScreen(),
              routes: {
                RegisterScreen.routeName: (ctx) => const RegisterScreen(),
                LoginScreen.routeName: (ctx) => const LoginScreen(),
                ForgetPasswordScreen.routeName: (ctx) =>
                    const ForgetPasswordScreen(),
              });
        });
  }
}
