import 'dart:ui';

import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/image_constants.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:diet_application/screens/user_info/user_info_page1.dart';
import 'package:diet_application/userdata/user_info.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              height: height*0.5,
              width: width*1,
              child: Image.asset(ImageConst.background,fit: BoxFit.cover,)),
          Hgap,
          Center(
              child: Column(
                children: [
                  Text("Consistency Is",style:TextStyle(color: ColorConst.subHead,fontWeight: FontWeight.w600,
                  fontSize: width*0.06) ,),
                  Text("The Key To Progress.",style:TextStyle(color: ColorConst.subHead,fontWeight: FontWeight.w600,
                  fontSize: width*0.06) ,),
                  Text("Don't Give Up!",style:TextStyle(color: ColorConst.subHead,fontWeight: FontWeight.w600,
                  fontSize: width*0.06) ,),
                ],
              )),
          Hgap,
          Container(
            height: height*0.18,
            width: width*1,
            color: ColorConst.containerBackground,
            child: Center(
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore\n et dolore magna aliqua.",
              style: TextStyle(color: ColorConst.text,fontSize: width*0.03),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Hgap,
          Padding(
            padding:  EdgeInsets.only(left: width*0.1,right: width*0.1),
            child:  Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>UserInfoPage1(),));
                    },
                    child: Container(
                      height: height*0.07,
                      width: width*0.6,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Adjust opacity for better effect
                        borderRadius: BorderRadius.circular(width*1),
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(color: ColorConst.text1,
                              fontWeight: FontWeight.w600,
                              fontSize: width*0.04
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
