import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/screens/user_info/user_info_height.dart';
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
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //   ],
          // ),
          WeightScaleWidget(
            minWeight: 0,
            maxWeight: 200,
            initialWeight: 70,
            onWeightChanged: (weight) {
              print('New weight: $weight');
            },
          ),
          // Icon(
          //   Icons.arrow_drop_up_rounded,
          //   size: height * 0.13,
          //   color: ColorConst.subHead,
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoHeight(),
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
                      "Continue",
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

class WeightScaleWidget extends StatefulWidget {
  final double minWeight;
  final double maxWeight;
  final double initialWeight;
  final void Function(double)? onWeightChanged;

  const WeightScaleWidget({
    Key? key,
    this.minWeight = 0,
    this.maxWeight = 200,
    this.initialWeight = 70,
    this.onWeightChanged,
  }) : super(key: key);

  @override
  _WeightScaleWidgetState createState() => _WeightScaleWidgetState();
}

class _WeightScaleWidgetState extends State<WeightScaleWidget> {
  late TextEditingController _controller;
  late double _currentWeight;

  @override
  void initState() {
    super.initState();
    _currentWeight = widget.initialWeight;
    _controller = TextEditingController(text: _currentWeight.toStringAsFixed(1));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateWeight(double value) {
    setState(() {
      _currentWeight = value;
      _controller.text = value.toStringAsFixed(1);
    });
    widget.onWeightChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Digital display
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                child: TextField(
                  controller: _controller,
                  readOnly: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: ColorConst.text1),
                  decoration: const InputDecoration(
                    suffix: Text('kg'),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    final newWeight = double.tryParse(value);
                    if (newWeight != null &&
                        newWeight >= widget.minWeight &&
                        newWeight <= widget.maxWeight) {
                      _updateWeight(newWeight);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        // Scale widget
        Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              // Scale lines
              CustomPaint(
                size: Size.infinite,
                painter: ScalePainter(
                  minWeight: widget.minWeight,
                  maxWeight: widget.maxWeight,
                  currentWeight: _currentWeight,
                ),
              ),
              // Slider
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: Colors.yellow,
                  inactiveTrackColor: Colors.grey[300],
                  thumbColor: Colors.yellow,
                  overlayColor: Colors.yellow.withOpacity(0.3),
                ),
                child: Slider(
                  value: _currentWeight,
                  min: widget.minWeight,
                  max: widget.maxWeight,
                  onChanged: _updateWeight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ScalePainter extends CustomPainter {
  final double minWeight;
  final double maxWeight;
  final double currentWeight;

  ScalePainter({
    required this.minWeight,
    required this.maxWeight,
    required this.currentWeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0;

    final highlightPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 2.0;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    final step = (maxWeight - minWeight) / 50; // Number of major scale lines
    final width = size.width - 40; // Padding on both sides

    for (var i = 0; i <= 50; i++) {
      final x = 20 + (i * width / 50);
      final weight = minWeight + (i * step);
      final isMajor = i % 5 == 0;
      final isHighlighted =
          weight >= currentWeight - step / 2 && weight <= currentWeight + step / 2;

      // Draw scale line
      canvas.drawLine(
        Offset(x, size.height - (isMajor ? 40 : 30)),
        Offset(x, size.height - 20),
        isHighlighted ? highlightPaint : paint,
      );

      // Draw weight number for major lines
      if (isMajor) {
        textPainter.text = TextSpan(
          text: weight.toStringAsFixed(0),
          style: TextStyle(
            color: isHighlighted ? Colors.yellow : Colors.grey,
            fontSize: 12,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(x - textPainter.width / 2, size.height - 60),
        );
      }
    }
  }

  @override
  bool shouldRepaint(ScalePainter oldDelegate) =>
      oldDelegate.currentWeight != currentWeight;
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
