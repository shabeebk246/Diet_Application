import 'package:diet_application/bottom_navigation.dart';
import 'package:diet_application/constants/color_constents.dart';
import 'package:flutter/material.dart';

class InfoSuccessPage extends StatefulWidget {
  const InfoSuccessPage({super.key});

  @override
  State<InfoSuccessPage> createState() => _InfoSuccessPageState();
}

class _InfoSuccessPageState extends State<InfoSuccessPage> {

  skip(){
    Future.delayed(
        Duration(seconds: 3)).then((value) => Navigator.push(context, MaterialPageRoute(builder:(context) => BottomNavigation(),)));
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator(color: ColorConst.subHead,))
        ],
      ),
    );
  }
}
