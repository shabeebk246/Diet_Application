import 'dart:ui';

import 'package:diet_application/screens/user_info/user_info_page3.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constents.dart';
import '../../main.dart';

class UserInfoHeight extends StatefulWidget {
  const UserInfoHeight({super.key});

  @override
  State<UserInfoHeight> createState() => _UserInfoHeightState();
}

class _UserInfoHeightState extends State<UserInfoHeight> {
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
            child: Text(
              "What Is Your Height",
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
          VerticalHeightScale(
            minHeight: 90,
            maxHeight: 220,
            initialHeight: 170,
            onHeightChanged: (height) {
              print('New height: $height cm');
            },
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
                        builder: (context) => UserInfoPage3(),
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

class VerticalHeightScale extends StatefulWidget {
  final double minHeight;
  final double maxHeight;
  final double initialHeight;
  final void Function(double)? onHeightChanged;

  const VerticalHeightScale({
    Key? key,
    this.minHeight = 100,
    this.maxHeight = 220,
    this.initialHeight = 170,
    this.onHeightChanged,
  }) : super(key: key);

  @override
  _VerticalHeightScaleState createState() => _VerticalHeightScaleState();
}

class _VerticalHeightScaleState extends State<VerticalHeightScale> {
  late double _currentHeight;
  late ScrollController _scrollController;
  final double _scaleHeight = 300.0;
  final double _markInterval = 30.0;

  @override
  void _updateHeight() {
    // Calculate the height based on scroll position
    final double scrollPercentage = _scrollController.offset / (_scrollController.position.maxScrollExtent);
    final double heightRange = widget.maxHeight - widget.minHeight;
    final double newHeight = widget.minHeight + (scrollPercentage * heightRange);

    // Round to nearest whole number to align with scale marks
    final double roundedHeight = newHeight.round().toDouble();

    // Only update if the height has actually changed
    if (_currentHeight != roundedHeight && roundedHeight >= widget.minHeight && roundedHeight <= widget.maxHeight) {
      setState(() {
        _currentHeight = roundedHeight;
      });
      widget.onHeightChanged?.call(_currentHeight);
    }
  }

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.initialHeight;

    // Calculate initial scroll offset based on initial height
    final heightRange = widget.maxHeight - widget.minHeight;
    final scrollPercentage = (widget.initialHeight - widget.minHeight) / heightRange;
    final maxScroll = (widget.maxHeight - widget.minHeight) * _markInterval;

    _scrollController = ScrollController(
      initialScrollOffset: scrollPercentage * maxScroll,
    );

    _scrollController.addListener(_updateHeight);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final totalMarks = ((widget.maxHeight - widget.minHeight) + 1).toInt();
    final totalHeight = totalMarks * _markInterval;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Height Display
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            '${_currentHeight.toStringAsFixed(1)} cm',
            style: const TextStyle(
              color: ColorConst.text1,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Scale
        Container(
          height: _scaleHeight,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              // Scale Marks
              SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                  height: totalHeight,
                  child: CustomPaint(
                    size: Size(100, totalHeight),
                    painter: HeightScalePainter(
                      minHeight: widget.minHeight,
                      maxHeight: widget.maxHeight,
                      markInterval: _markInterval,
                    ),
                  ),
                ),
              ),
              // Center Indicator
              Center(
                child: Container(
                  height: 2,
                  width: 40,
                  color: ColorConst.subHead,
                  margin: const EdgeInsets.only(left: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeightScalePainter extends CustomPainter {
  final double minHeight;
  final double maxHeight;
  final double markInterval;

  HeightScalePainter({
    required this.minHeight,
    required this.maxHeight,
    required this.markInterval,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
    );

    final totalMarks = ((maxHeight - minHeight) + 1).toInt();

    for (var i = 0; i < totalMarks; i++) {
      final y = i * markInterval;
      // Reverse height calculation for drawing
      final height = minHeight + i;
      final isMajor = height.toInt() % 10 == 0;

      // Draw mark
      final markLength = isMajor ? 30.0 : 15.0;
      canvas.drawLine(
        Offset(size.width - 30, y),
        Offset(size.width - 30 + markLength, y),
        paint,
      );

      // Draw height number for major marks
      if (isMajor) {
        textPainter.text = TextSpan(
          text: height.toStringAsFixed(0),
          style: const TextStyle(
            color: ColorConst.text1,
            fontSize: 14,
          ),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(size.width - 70, y - textPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(HeightScalePainter oldDelegate) => false;
}