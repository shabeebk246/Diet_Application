import 'package:diet_application/screens/Nutrition/nutrition_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constents.dart';
import '../../constants/image_constants.dart';
import '../../constants/widget.dart';
import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        elevation: 0,
        centerTitle: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, User",style: TextStyle(
                color: ColorConst.nameText,
                fontSize: width*0.055,
                fontWeight: FontWeight.w600
            ),),
            Text("It's time to challenge your limits",style: TextStyle(
              color: ColorConst.text1,
              fontSize: width*0.035
            ),)
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.search)
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Icon(Icons.fitness_center_outlined,
                      color: ColorConst.containerBackground,
                    size: width*0.1,
                  ),
                  Text("Workout",style: TextStyle(
                    color: ColorConst.containerBackground
                  ),)
                ],
              ),
              Column(
                children: [
                  Icon(Icons.event_note_outlined,
                      color: ColorConst.containerBackground,
                    size: width*0.1,
                  ),
                  Text("Progress\n Tracking",style: TextStyle(
                    color: ColorConst.containerBackground
                  ),)
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NutritionSplashScreen(),));
                },
                child: Column(
                  children: [
                    Icon(Icons.apple_outlined,
                        color: ColorConst.containerBackground,
                      size: width*0.1,
                    ),
                    Text("Nutrition",style: TextStyle(
                      color: ColorConst.containerBackground
                    ),)
                  ],
                ),
              ),
              Column(
                children: [
                  Icon(Icons.groups,
                      color: ColorConst.containerBackground,
                    size: width*0.1,
                  ),
                  Text("Community",style: TextStyle(
                    color: ColorConst.containerBackground
                  ),)
                ],
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(width*0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommendations",style: TextStyle(
                      color: ColorConst.subHead,
                      fontWeight: FontWeight.w600,
                      fontSize: width*0.04
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("See All",style: TextStyle(
                          color: ColorConst.text1,
                          fontWeight: FontWeight.w600
                        ),),
                        Icon(Icons.arrow_right_outlined,color: ColorConst.subHead,size: width*0.08,)
                      ],
                    )
                  ],
                ),
              ),
              Hgap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: height*0.25,
                        width: width*0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03),
                            border: Border.all(color: ColorConst.text1),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height*0.17,
                            width: width*0.42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(width*0.03),
                               topLeft: Radius.circular(width*0.03)
                              ),
                              // color: Colors.greenAccent
                            ),
                            child: Image.asset(ImageConst.exercise,fit: BoxFit.cover,),
                          ),
                          SizedBox(height: width*0.02,),
                          Padding(
                            padding: EdgeInsets.only(left: width*0.03),
                            child: Text("Squat Exercise",style: TextStyle(
                              color: ColorConst.subHead,
                              fontSize: width*0.03
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.timer_fill,color: ColorConst.nameText,
                                    size: width*0.04,
                                    ),
                                    Text("12 Minutes",style: TextStyle(
                                      color: ColorConst.text1,
                                      fontSize: width*0.028
                                    ),)
                                  ],
                                ) ,
                                Row(
                                  children: [
                                    Icon(Icons.local_fire_department_outlined,color: ColorConst.nameText,
                                    size: width*0.045,
                                    ),
                                    Text("120 Kcal",style: TextStyle(
                                      color: ColorConst.text1,
                                      fontSize: width*0.028
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: height*0.25,
                        width: width*0.42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width*0.03),
                            border: Border.all(color: ColorConst.text1),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height*0.17,
                            width: width*0.42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(width*0.03),
                               topLeft: Radius.circular(width*0.03)
                              ),
                              // color: Colors.greenAccent
                            ),
                            child: Image.asset(ImageConst.stretching,fit: BoxFit.cover,),
                          ),
                          SizedBox(height: width*0.02,),
                          Padding(
                            padding: EdgeInsets.only(left: width*0.03),
                            child: Text("Squat Exercise",style: TextStyle(
                              color: ColorConst.subHead,
                              fontSize: width*0.03
                            ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width*0.03,right: width*0.03),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(CupertinoIcons.timer_fill,color: ColorConst.nameText,
                                    size: width*0.04,
                                    ),
                                    Text("12 Minutes",style: TextStyle(
                                      color: ColorConst.text1,
                                      fontSize: width*0.028
                                    ),)
                                  ],
                                ) ,
                                Row(
                                  children: [
                                    Icon(Icons.local_fire_department_outlined,color: ColorConst.nameText,
                                    size: width*0.045,
                                    ),
                                    Text("120 Kcal",style: TextStyle(
                                      color: ColorConst.text1,
                                      fontSize: width*0.028
                                    ),)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            height:height*0.25,
            width: width*1,
            color: ColorConst.containerBackground,
          )
        ],
      ),
    );
  }
}
