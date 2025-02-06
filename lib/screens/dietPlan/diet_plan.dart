import 'package:flutter/material.dart';

import '../../constants/color_constents.dart';
import '../../main.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
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
      backgroundColor: ColorConst.background1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Column(
              children: [
                Text("30 Days Diet Plan",style: TextStyle(
                  color: ColorConst.nameText,
                  fontSize: width*0.055,
                  fontWeight: FontWeight.w600
                ),),
                Text("Day 1 of 30",style: TextStyle(
                  color: ColorConst.text1
                ),)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               ElevatedButton(
                   style: ButtonStyle(
                     backgroundColor:WidgetStatePropertyAll(ColorConst.subHead),
                     shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(width*0.03))),
                   ),
                   onPressed: () {

                   },
                   child: Icon(Icons.arrow_left,color: ColorConst.text,size: width*0.08,)
               ),
               Text("Day 1",style: TextStyle(
                 color: ColorConst.nameText,
                 fontWeight: FontWeight.w600,
                 fontSize: width*0.04
               ),),
               ElevatedButton(
                 style: ButtonStyle(
                   backgroundColor:WidgetStatePropertyAll(ColorConst.subHead),
                   shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(width*0.03))),
                 ),
                   onPressed: () {

                   },
                   child: Icon(Icons.arrow_right,color: ColorConst.text,size: width*0.08,)
               )
             ],
          ),
          Column(
            children: [
              Container(
                height: height*0.2,
                width: width*1,
                margin: EdgeInsets.all(width*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  color: ColorConst.button
                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Breakfast",style: TextStyle(
                        color: ColorConst.text,
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      Text("Breakfast for Day 1 ",style: TextStyle(
                        color: ColorConst.text
                      ),)
                    ],
                  ),
                ),
              ),
              Container(
                height: height*0.2,
                width: width*1,
                margin: EdgeInsets.all(width*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  color: ColorConst.button
                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lunch",style: TextStyle(
                        color: ColorConst.text,
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      Text("Lunch for Day 1",style: TextStyle(
                        color: ColorConst.text
                      ),)
                    ],
                  ),
                ),
              ),
              Container(
                height: height*0.2,
                width: width*1,
                margin: EdgeInsets.all(width*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.03),
                  color: ColorConst.button
                ),
                child: Padding(
                  padding:  EdgeInsets.all(width*0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dinner",style: TextStyle(
                        color: ColorConst.text,
                        fontSize: width*0.04,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      Text("Dinner for Day 1",style: TextStyle(
                        color: ColorConst.text
                      ),)
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
