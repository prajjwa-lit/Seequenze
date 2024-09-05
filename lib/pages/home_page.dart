import 'dart:ui';

import 'package:shadow/shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg_image.jpeg"),
                  fit: BoxFit.cover // Make image cover the entire container
                  ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Container(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 20.sp),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              "assets/images/hand_image.png",
                              scale: 3.5,
                            )
                          ],
                        ),
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "20/12/2022",
                              style: TextStyle(
                                  color: const Color(0xFFB6B6B6),
                                  fontSize: 13.sp),
                            ),
                            Text("Joshua Scanlan",
                                style: TextStyle(
                                    color: const Color(0xFFB6B6B6),
                                    fontSize: 18.sp)),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              color: const Color(0xFFF9F9F9).withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Image.asset("assets/images/bucket.png"),
                        ),
                        SizedBox(width: 10.w),
                        CircleAvatar(
                          radius: 24.r,
                          backgroundColor: Colors.green,
                          child: CircleAvatar(
                            radius: 23.r,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset("assets/images/user.jpeg")),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 35.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Image.asset("assets/images/search.png"),
                        hintText: 'Search favorite Beverages',
                        suffixIcon: Image.asset("assets/images/filter.png"),
                        prefixIconColor: const Color(0xFFBBBBBC),
                        suffixIconColor: const Color(0xFFBBBBBC),
                        hintStyle: const TextStyle(color: Color(0xFFBBBBBC)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: Text(
                      "Most Popular Beverages",
                      style: TextStyle(
                          color: const Color(0xFFB6B6B6), fontSize: 18.sp),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // scrollDirection: Axis.horizontal,
                      children: [
                        customCoffeeCard(
                            img: "assets/images/coffee1.png",
                            name: "Hot Cappuccino"),
                        customCoffeeCard(
                            img: "assets/images/coffee2.png",
                            name: "Hot Cappuccino"),
                        customCoffeeCard(
                            img: "assets/images/coffee3.png",
                            name: "Hot Cappuccino")
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: Text(
                      "Get it instantly",
                      style: TextStyle(
                          color: const Color(0xFFB6B6B6), fontSize: 18.sp),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Column(
                      children: [
                        customDetailCard(
                            img: "assets/images/coffee5.png", name: "Latte"),
                        customDetailCard(
                            img: "assets/images/coffee4.png",
                            name: "Flat White")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget customCoffeeCard({
  required String img,
  required String name,
  rating,
}) {
  return Padding(
    padding: EdgeInsets.only(left: 15.w),
    child: Container(
      width: 213.w,
      height: 265.h,
      decoration: BoxDecoration(
        color: Color(0xFFB4B4B4).withOpacity(0.33),
        borderRadius: BorderRadius.circular(7.r),
      ),
      child: Column(
        children: [
          // Image.asset("assets/images/card_bg.png"),
          SizedBox(height: 30.h),

          Image.asset(
            img,
            scale: 35,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style:
                    TextStyle(color: const Color(0xFFCDCDCD), fontSize: 18.sp),
              ),
            ),
          ),
          SizedBox(height: 5.h),

          Padding(
            padding: EdgeInsets.only(left: 25.sp, right: 20.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Espresso, Steamed Milk",
                        style: TextStyle(fontSize: 10.sp)),
                    SizedBox(height: 5.h),
                    Text("4.9 ⭐ (458)"),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(4.sp),
                  color: Color(0xFF66A35C),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}

Widget customDetailCard({
  required String img,
  required String name,
  rating,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Color(0xFFB4B4B4).withOpacity(0.33),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: Color(0xFFCDCDCD)),
              ),
              Wrap(
                children: [
                  Text("4.9 ⭐ (458) "),
                  SizedBox(width: 10.w),
                  Image.asset(
                    "assets/images/veg.png",
                    scale: 15,
                  )
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: Text(
                  "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
                  style: TextStyle(fontSize: 10.sp, color: Color(0xFFC0C0C0)),
                  softWrap: true,
                ),
              )
            ],
          ),
          SizedBox(
            width: 120.w,
            height: 120.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: Image.asset(
                img,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
