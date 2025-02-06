import 'package:flutter/material.dart';

import '../constants/color_constents.dart';

class UserInfoSecond extends StatefulWidget {
  const UserInfoSecond({super.key});

  @override
  State<UserInfoSecond> createState() => _UserInfoSecondState();
}

class _UserInfoSecondState extends State<UserInfoSecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.background,
        elevation: 0,
        centerTitle: true,
        title: Text("Your Information",style: TextStyle(
            color: ColorConst.text,
            fontWeight: FontWeight.w600
        ),),
        actions: [
          Text("Step 2/2",style: TextStyle(
              color: ColorConst.text
          ),)
        ],
        iconTheme: IconThemeData(color:ColorConst.text),
      ),
      backgroundColor: ColorConst.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

        ],
      ),
    );
  }
}
