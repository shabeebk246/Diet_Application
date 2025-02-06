import 'dart:ui';

import 'package:diet_application/constants/image_constants.dart';
import 'package:diet_application/screens/Nutrition/meal_planing.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constents.dart';
import '../../constants/widget.dart';
import '../../main.dart';

class NutritionSplashScreen extends StatefulWidget {
  const NutritionSplashScreen({super.key});

  @override
  State<NutritionSplashScreen> createState() => _NutritionSplashScreenState();
}

class _NutritionSplashScreenState extends State<NutritionSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      body: Container(
            height: height*1,
            width: width*1,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImageConst.nutrition),fit: BoxFit.cover)
            ),
            child: Stack(
              children: [
                Positioned(
                  top: height*0.07,
                  left: width*0.03,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_left,color: ColorConst.text1,
                          size: width*0.1,
                        ),
                      )
                    ],
                  ),
                ),
               Positioned(
                 top: height*0.4,
                 child: Column(
                  children: [
                    Container(
                      height: height*0.25,
                      width: width*1,
                      color: ColorConst.containerBackground,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageConst.vector,height: height*0.05,),
                              Wgap,
                              Text("Meal Plans",style: TextStyle(
                                  color: ColorConst.text1,
                                  fontSize: width*0.06,
                                  fontWeight: FontWeight.w600
                              ),)
                            ],
                          ),
                          Hgaaaap,
                          Text("Lorem ipsum dolor sit amet, consectetur adipiscing\n elit, sed do eiusmod tempor incididunt ut labore.",
                            style: TextStyle(
                                fontSize: width*0.028
                            ),
                          )
                        ],
                      ),
                    ),
                    Hgaaaap,
                    Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => MealPlaning(),));
                                },
                                child: Container(
                                  height: height*0.08,
                                  width: width*0.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2), // Adjust opacity for better effect
                                    borderRadius: BorderRadius.circular(width*1),
                                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Know Your Plan",
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
                      ],
                    ),
                  ],
                               ),
               ),
        ]
            ),
          ),
    );
  }
}
