import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/main.dart';
import 'package:diet_application/screens/Nutrition/meal_planing_food.dart';
import 'package:flutter/material.dart';

import '../../constants/widget.dart';

class MealPlaning extends StatefulWidget {
  const MealPlaning({super.key});

  @override
  State<MealPlaning> createState() => _MealPlaningState();
}

class _MealPlaningState extends State<MealPlaning> {

  String? _selectedValue;

  List items = [
    "Loosing Weight",
    "Gaining Weight",
    "Keeping Weight",
    "Being Fit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        title: Text("Meal Plans",style: TextStyle(
          color: ColorConst.nameText,
        ),),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_left,size: height*0.06,
            color: ColorConst.subHead,),
        ),
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.search,color: ColorConst.nameText,)
          ),
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.notifications,color: ColorConst.nameText,)
          ),
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.person,color: ColorConst.nameText,)
          ),
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("You are here for",style: TextStyle(
                color: ColorConst.subHead,
                fontWeight: FontWeight.w600,
                fontSize: width*0.045
            ),),
            Text("what is the purpose about your diet?",style: TextStyle(
                color: ColorConst.text1,
                fontSize: width*0.03
            ),),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 options per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3, // Controls the shape of each option box
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedValue = items[index];
                    });
                  },
                  child: Row(
                    children: [
                      Radio<String>(
                        activeColor: ColorConst.nameText,
                        value: items[index],
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value ;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          items[index],
                          style: TextStyle(fontSize: width*0.03,
                          color: ColorConst.text1
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MealPlaningFood(),));
              },
              child: Container(
                height: height*0.08,
                width: width*0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*1),
                  color: ColorConst.subHead
                ),
                child: Center(
                  child: Text("Next",style: TextStyle(
                    color: ColorConst.text,
                    fontWeight: FontWeight.w600,
                    fontSize: width*0.04
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
