import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/screens/dietPlan/diet_plan.dart';
import 'package:flutter/material.dart';

import '../../constants/widget.dart';
import '../../main.dart';

class PlanLoadingScreen extends StatefulWidget {
  const PlanLoadingScreen({super.key});

  @override
  State<PlanLoadingScreen> createState() => _PlanLoadingScreenState();
}

class _PlanLoadingScreenState extends State<PlanLoadingScreen> {

  skip(){
    Future.delayed(
        Duration(seconds: 4)).then((value) => Navigator.push(context, MaterialPageRoute(
      builder: (context) => DietPlan())),);
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
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        title: Text(
          "Meal Plans",
          style: TextStyle(color: ColorConst.nameText),
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_left,
            size: height * 0.06,
            color: ColorConst.subHead,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: ColorConst.nameText),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: ColorConst.nameText),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: ColorConst.nameText),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: height*0.29,
              width: width*0.5,
              child: CircularProgressIndicator(
                color: ColorConst.nameText,
              ),
            ),
          ),
          Hgap,
          Text("Create A Plan For You",style: TextStyle(
            color: ColorConst.subHead,
            fontWeight: FontWeight.w600,
            fontSize: width*0.04
          ),)
        ],
      ),
    );
  }
}
