import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<bool> _switches = List.filled(11, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_image.jpeg"),
                    fit: BoxFit.cover // Make image cover the entire container
                    ),
              ),
            ),
            Positioned(
              top: -140.h,
              left: 1,
              right: 1,
              child: Image.asset(
                "assets/images/coffee5.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Lattè",
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(height: 5.h),
                            Wrap(
                              children: [
                                const Text(
                                  "4.9 ⭐ (458) ",
                                  style: TextStyle(color: Color(0xFFC4C4C4)),
                                ),
                                SizedBox(width: 10.w),
                                Image.asset(
                                  "assets/images/veg.png",
                                  scale: 15,
                                )
                              ],
                            ),
                          ],
                          //TODO: Dropdown menu
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Caffè latte is a milk coffee that is a made up of one or two shots of espresso, steamed milk and a final, thin layer of frothed milk on top.",
                      style: TextStyle(
                          color: const Color(0xFFC0C0C0), fontSize: 10.sp),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Choice of Cup Filling",
                      style: (TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(height: 20.h),
                    customTiles(),
                    Text(
                      "Choice of Milk",
                      style: (TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700)),
                    ),
                    Switch(
                        trackColor:
                            MaterialStateProperty.all(const Color(0xFF238544)),
                        value: _switches[0],
                        onChanged: (value) {
                          setState(() {
                            _switches[0] = value;
                          });
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class customTiles extends StatefulWidget {
  @override
  State<customTiles> createState() => _customTilesState();
}

class _customTilesState extends State<customTiles> {
  List<bool> _isSelected = [true, false, false, false];

  List<String> _texts = ["Full", "1/2 Full", "3/4 Full", "1/4 Full"];

  Widget customTile({required String text, required bool isSelected}) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF37AD54) : const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(7.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Text(
          text,
          style: TextStyle(
              color: isSelected ? const Color(0xFFD9D9D9) : Colors.black),
        ),
      ),
    );
  }

  void select(index) {
    for (int i = 0; i < 4; i++) {
      _isSelected[i] = index == i;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () => select(0),
            child: customTile(text: _texts[0], isSelected: _isSelected[0])),
        GestureDetector(
            onTap: () => select(1),
            child: customTile(text: _texts[1], isSelected: _isSelected[1])),
        GestureDetector(
            onTap: () => select(2),
            child: customTile(text: _texts[2], isSelected: _isSelected[2])),
        GestureDetector(
            onTap: () => select(3),
            child: customTile(text: _texts[3], isSelected: _isSelected[3])),
      ],
    );
  }
}
