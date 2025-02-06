import 'package:diet_application/bottom_navigation.dart';
import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/image_constants.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class CongratsPage extends StatefulWidget {
  const CongratsPage({super.key});

  @override
  State<CongratsPage> createState() => _CongratsPageState();
}

class _CongratsPageState extends State<CongratsPage> {

  skip(){
    Future.delayed(
        Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(
      builder: (context) => BottomNavigation(),)),);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    skip();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text("Congratulations!!",style: TextStyle(
              color: ColorConst.congratsText,
              fontSize: width*0.075,
              fontWeight: FontWeight.w600
            ),),
          ),
          Center(child: Image.asset(ImageConst.congrats,height: height*0.3,)),
          Center(
            child: Text("your finished\n the registration process\n successfully!",
            style: TextStyle(color: ColorConst.text),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
