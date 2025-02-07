import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/screens/user_info/user_info_weight.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class UserInfoPage2 extends StatefulWidget {
  const UserInfoPage2({super.key});

  @override
  State<UserInfoPage2> createState() => _UserInfoPage2State();
}

class _UserInfoPage2State extends State<UserInfoPage2> {

  int _currentIndex = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_left,size: width*0.1,color: ColorConst.subHead,),
        title: Text(
          "Back",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: width * 0.04, color: ColorConst.subHead),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text("How Old Are You?",style: TextStyle(
              color: ColorConst.text1, fontWeight: FontWeight.w600,fontSize: width*0.05
            ),),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore\n et dolore magna aliqua.",
            style: TextStyle(color: ColorConst.text1, fontSize: width * 0.03),
            textAlign: TextAlign.center,
          ),
          Text("${_currentIndex + 1 }",style: TextStyle(color: ColorConst.text1,
          fontSize: height*0.08,
            fontWeight: FontWeight.w600
          ),),
          Icon(Icons.arrow_drop_up_rounded,size: height*0.13 ,color: ColorConst.subHead,),
          Stack(
            alignment: Alignment.center,
            children: [
              // Main Container with Expanded to give it enough space
              Container(
                height: height*0.16,
                width: double.infinity,
                color: ColorConst.containerBackground,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height*0.16,
                    enlargeCenterPage: true,
                    viewportFraction: 0.2,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: List.generate(60, (index) {
                    bool isSelected = index == _currentIndex; // Highlight the selected number

                    return Container(
                      width: 100, // Adjust width as needed
                      alignment: Alignment.center,
                      child: Opacity(
                        opacity: isSelected ? 1.0 : 0.5, // Highlight selected number
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.white.withOpacity(0.5), // Highlight color
                            fontSize: 40, // Bigger digits
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // First Vertical Divider (Left)
              Positioned(
                left: MediaQuery.of(context).size.width * 0.38,
                top: -30,
                child: Container(
                  width: 2,
                  height: 180,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),

              // Second Vertical Divider (Right)
              Positioned(
                left: MediaQuery.of(context).size.width * 0.6,
                top: -30,
                child: Container(
                  width: 2,
                  height: 180,
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoWeight(),));
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
                      "Continue",
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
// import 'dart:ui';
//
// import 'package:diet_application/constants/color_constents.dart';
// import 'package:flutter/material.dart';
//
// import '../../main.dart';
//
// class UserInfoPage2 extends StatefulWidget {
//   const UserInfoPage2({super.key});
//
//   @override
//   State<UserInfoPage2> createState() => _UserInfoPage2State();
// }
//
// class _UserInfoPage2State extends State<UserInfoPage2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorConst.background1,
//       appBar: AppBar(
//         backgroundColor: ColorConst.background1,
//         automaticallyImplyLeading: false,
//         leading: Icon(Icons.arrow_left,size: width*0.1,color: ColorConst.subHead,),
//         title: Text(
//           "Back",
//           style: TextStyle(fontWeight: FontWeight.w600, fontSize: width * 0.04, color: ColorConst.subHead),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Center(
//             child: Text("How Old Are You?",style: TextStyle(
//                 color: ColorConst.text1, fontWeight: FontWeight.w600,fontSize: width*0.05
//             ),),
//           ),
//           Text(
//             "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore\n et dolore magna aliqua.",
//             style: TextStyle(color: ColorConst.text1, fontSize: width * 0.03),
//             textAlign: TextAlign.center,
//           ),
//           Text("28",style: TextStyle(color: ColorConst.text1,
//               fontSize: height*0.08,
//               fontWeight: FontWeight.w600
//           ),),
//           Icon(Icons.arrow_drop_up_rounded,size: height*0.13 ,color: ColorConst.subHead,),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               // Main Container
//               Container(
//                 height: height * 0.16,
//                 width: width * 1,
//                 color: ColorConst.containerBackground,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: List.generate(60, (index) {
//                       // Check if the number is in the center between the dividers
//                       bool isSelected = index >= 25 && index <= 29; // Adjust for the center range
//
//                       return Container(
//                         width: width * 0.12, // Adjust width to display exactly 5 numbers on screen
//                         alignment: Alignment.center,
//                         child: Opacity(
//                           opacity: isSelected ? 1.0 : 0.5, // Highlight the number in between the dividers
//                           child: Text(
//                             "${index + 1}",
//                             style: TextStyle(
//                               color: isSelected ? Colors.blue : Colors.white.withOpacity(0.5), // Different color for the selected number
//                               fontSize: width * 0.1, // Bigger and more bold digits
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ),
//
//               // First Vertical Divider (Left)
//               Positioned(
//                 left: width * 0.4, // Adjust divider position
//                 top: -height * 0.02, // Slightly above container
//                 child: Container(
//                   width: 2, // Divider thickness
//                   height: height * 0.25, // Longer than the container
//                   color: Colors.white.withOpacity(0.6),
//                 ),
//               ),
//
//               // Second Vertical Divider (Right)
//               Positioned(
//                 left: width * 0.6, // Adjust divider position
//                 top: -height * 0.02, // Slightly above container
//                 child: Container(
//                   width: 2, // Divider thickness
//                   height: height * 0.25, // Longer than the container
//                   color: Colors.white.withOpacity(0.6),
//                 ),
//               ),
//             ],
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
//               child: InkWell(
//                 onTap: () {
//
//                 },
//                 child: Container(
//                   height: height * 0.07,
//                   width: width * 0.6,
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2), // Adjust opacity for better effect
//                     borderRadius: BorderRadius.circular(width * 1),
//                     border: Border.all(color: Colors.white.withOpacity(0.3)),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Next",
//                       style: TextStyle(color: ColorConst.text1, fontWeight: FontWeight.w600, fontSize: width * 0.04),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
