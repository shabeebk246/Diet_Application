import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:diet_application/constants/color_constents.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class UserInfoWeight extends StatefulWidget {
  const UserInfoWeight({super.key});

  @override
  State<UserInfoWeight> createState() => _UserInfoWeightState();
}

class _UserInfoWeightState extends State<UserInfoWeight> {
  int _currentIndex = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_left,
              size: width * 0.1,
              color: ColorConst.subHead,
            )),
        title: Text(
          "Back",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: width * 0.04,
              color: ColorConst.subHead),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "What Is Your Weight",
              style: TextStyle(
                  color: ColorConst.text1,
                  fontWeight: FontWeight.w600,
                  fontSize: width * 0.05),
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore\n et dolore magna aliqua.",
            style: TextStyle(color: ColorConst.text1, fontSize: width * 0.03),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "165",
                style: TextStyle(
                    color: ColorConst.text1,
                    fontWeight: FontWeight.w600,
                    fontSize: height * 0.065),
              ),
              Text(
                " cm",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorConst.textFieldText,
                    fontSize: height * 0.04),
              )
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: height * 0.16,
              enlargeCenterPage: true,
              viewportFraction: 0.2,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: List.generate(60, (index) {
              bool isSelected =
                  index == _currentIndex; // Highlight the selected number

              return Container(
                width: 100, // Adjust width as needed
                alignment: Alignment.center,
                child: Opacity(
                  opacity: isSelected ? 1.0 : 0.5, // Highlight selected number
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withOpacity(0.5), // Highlight color
                      fontSize: 40, // Bigger digits
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(20, (index) {
                  return Container(
                    width: 2,
                    height: index % 5 == 0 ? 50 : 30,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 7),
                  );
                }),
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_up_rounded,
            size: height * 0.13,
            color: ColorConst.subHead,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoWeight(),
                      ));
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.2), // Adjust opacity for better effect
                    borderRadius: BorderRadius.circular(width * 1),
                    border: Border.all(color: Colors.white.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: ColorConst.text1,
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.04),
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
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     Container(
//       height: height*0.5,
//       width: width*0.3,
//       child: CarouselSlider(
//         options: CarouselOptions(
//           scrollDirection: Axis.vertical,
//           height: height*0.16,
//           enlargeCenterPage: true,
//           viewportFraction: 0.2,
//           onPageChanged: (index, reason) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//         ),
//         items: List.generate(60, (index) {
//           bool isSelected = index == _currentIndex; // Highlight the selected number
//           return Container(
//             width: 100, // Adjust width as needed
//             alignment: Alignment.center,
//             child: Opacity(
//               opacity: isSelected ? 1.0 : 0.5, // Highlight selected number
//               child: Text(
//                 "${index + 1}",
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : Colors.white.withOpacity(0.5), // Highlight color
//                   fontSize: 40, // Bigger digits
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     ),
//     Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           height: height*0.5,
//           width: width*0.3,
//           color: ColorConst.containerBackground,
//         ),
//         Positioned(
//           top: height*0.5,
//           child: Container(
//             width: 100,
//             height: 3,
//             color: Colors.white.withOpacity(0.6),
//           ),
//         ),
//         Positioned(
//           top: height*0.5,
//           child: Container(
//             width: 100,
//             height: 3,
//             color: Colors.white.withOpacity(0.6),
//           ),
//         ),
//         Positioned(
//           top: height*0.5,
//           child: Container(
//             width: 100,
//             height: 3,
//             color: Colors.white.withOpacity(0.6),
//           ),
//         ),
//       ],
//     ),
//     Icon(Icons.arrow_left_rounded,size: height*0.13 ,color: ColorConst.subHead)
//   ],
// ),
// Stack(
//   alignment: Alignment.center,
//   children: [
//     // Main Container with Expanded to give it enough space
//     Container(
//       height: height*0.16,
//       width: double.infinity,
//       color: ColorConst.containerBackground,
//     ),
//
//     Container(
//       width: 3,
//       height: height*0.14,
//       color: Colors.white.withOpacity(0.6),
//     ),
//     Positioned(
//       left: width*0.54,
//       child: Container(
//         width: 3,
//         height: height*0.1,
//         color: Colors.white.withOpacity(0.6),
//       ),
//     ),
//     Positioned(
//       left: width*0.58,
//       child: Container(
//         width: 3,
//         height: height*0.1,
//         color: Colors.white.withOpacity(0.6),
//       ),
//     ),
//     Positioned(
//       left: width*0.62,
//       child: Container(
//         width: 3,
//         height: height*0.1,
//         color: Colors.white.withOpacity(0.6),
//       ),
//     ),
//     Positioned(
//       left: width*0.66,
//       child: Container(
//         width: 3,
//         height: height*0.1,
//         color: Colors.white.withOpacity(0.6),
//       ),
//     ),
//     Positioned(
//       left: width*0.7,
//         child:Container(
//           width: 3,
//           height: height*0.14,
//           color: Colors.white.withOpacity(0.6),
//         ),
//     )
//     // Second Vertical Divider (Right)
//     // Positioned(
//     //   left: MediaQuery.of(context).size.width * 0.6,
//     //   top: -30,
//     //   child: Container(
//     //     width: 2,
//     //     height: 180,
//     //     color: Colors.white.withOpacity(0.6),
//     //   ),
//     // ),
//   ],
// ),
