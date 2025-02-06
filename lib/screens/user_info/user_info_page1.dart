import 'dart:ui';
import 'package:diet_application/screens/user_info/user_info_page2.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:diet_application/constants/color_constents.dart';

class UserInfoPage1 extends StatefulWidget {
  const UserInfoPage1({super.key});

  @override
  State<UserInfoPage1> createState() => _UserInfoPage1State();
}

class _UserInfoPage1State extends State<UserInfoPage1> {
  String selectedGender = ""; // Track selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        leading: Icon(Icons.arrow_left, color: ColorConst.subHead, size: width * 0.1),
        automaticallyImplyLeading: false,
        title: Text(
          "Back",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: width * 0.04, color: ColorConst.subHead),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "What's Your Gender",
              style: TextStyle(color: ColorConst.text1, fontSize: width * 0.05, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: height * 0.18,
            width: width * 1,
            color: ColorConst.containerBackground,
            child: Center(
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore\n et dolore magna aliqua.",
                style: TextStyle(color: ColorConst.text, fontSize: width * 0.03),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Male Selection
          GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Male";
              });
            },
            child: Column(
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: height * 0.23,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedGender == "Male" ? ColorConst.subHead : ColorConst.text1.withOpacity(0.2),
                        border: Border.all(
                          color: selectedGender == "Male" ? ColorConst.subHead : ColorConst.text1.withOpacity(0.3),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.male_outlined,
                          color: selectedGender == "Male" ? Colors.black : ColorConst.text1,
                          size: height * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Male",
                  style: TextStyle(color: ColorConst.text1, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // Female Selection
          GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "Female";
              });
            },
            child: Column(
              children: [
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: height * 0.23,
                      width: width * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedGender == "Female" ? ColorConst.subHead : ColorConst.text1.withOpacity(0.2),
                        border: Border.all(
                          color: selectedGender == "Female" ? ColorConst.subHead: ColorConst.text1.withOpacity(0.3),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.female_outlined,
                          color: selectedGender == "Female" ? Colors.black : ColorConst.text1,
                          size: height * 0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Female",
                  style: TextStyle(color: ColorConst.text1, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          // Next Button
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: InkWell(
                onTap: () {
                  if (selectedGender.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserInfoPage2()),
                    );
                  }
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2), // Adjust opacity for better effect
                    borderRadius: BorderRadius.circular(width * 1),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(color: ColorConst.text1, fontWeight: FontWeight.w600, fontSize: width * 0.04),
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
