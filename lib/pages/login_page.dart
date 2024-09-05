import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_image.jpeg"),
                  fit: BoxFit.cover 
                  ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 32.w, right: 23.w, top: 70.h, bottom: 80.h),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 366.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white,
                        width: 0.2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 57.h),
                        SizedBox(
                            height: 70.h,
                            child: Image.asset("assets/images/app_logo.png")),
                        Text("Swift",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 64.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'raleway')),
                        Text("Cafe",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'raleway')),
                        GlowText(
                          '\"Latte but never late\"',
                          style: TextStyle(
                            color: const Color(0xFFABABAB),
                            fontSize: 15.sp,
                          ),
                          glowColor: Colors.white,
                          blurRadius: 30.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "User Name",
                                contentPadding: EdgeInsets.all(15),
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                contentPadding: EdgeInsets.all(15),
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200)),
                          ),
                        ),
                        SizedBox(height: 70.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Container(
                            height: 50.h,
                            width: 245.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF4D2B1A),
                                  Color(0xFFA7745A),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 10.0,
                                  offset: Offset(5.0, 5.0),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.sp),
                        Container(
                          height: 50.h,
                          width: 245.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        const Text(
                          "Privacy Policy",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
