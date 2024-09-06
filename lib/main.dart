import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seequenze_task/pages/login_page.dart';

import 'pages/details_page';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 930),
      builder: (_, chlid) {
        return MaterialApp(
          routes: {
            '/login': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/details': (context) =>  DetailPage(),
          },
          title: 'Swift Cafe',
          theme: ThemeData(
            fontFamily: 'inter',
            useMaterial3: true,
          ),
          home:  LoginPage(),
        );
      },
    );
  }
}
