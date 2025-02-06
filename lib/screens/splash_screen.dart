import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/image_constants.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:diet_application/screens/home/home_page.dart';
import 'package:diet_application/screens/login&signup/login_or_signup.dart';
import 'package:diet_application/screens/login&signup/login_page.dart';
import 'package:diet_application/screens/login&signup/signup_page.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  skip(){
    Future.delayed(
        Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder:(context) => LoginOrSignup(),)));
  }

  @override
  void initState() {
    skip();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                  height: height*1,
                  width: width*1,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.asset(ImageConst.splashBackground,fit: BoxFit.cover,
                    ),
                  )),
              Column(
                children: [
                  Text("Welcome to",style: TextStyle(color: ColorConst.subHead,fontSize: width*0.05,fontWeight: FontWeight.w600),),
                  CircleAvatar(radius: width*0.2,backgroundColor: ColorConst.nameText,),
                  Text("Diet App",style: TextStyle(color: ColorConst.subHead,fontSize: width*0.05,fontWeight: FontWeight.w600),),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
