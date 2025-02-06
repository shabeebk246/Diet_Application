import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/userdata/user_info2.dart';
import 'package:flutter/material.dart';

import '../constants/widget.dart';
import '../main.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {

  int? _selectedValue;

  List items = [
    "Loosing Weight",
    "Gaining Weight",
    "Keeping Weight",
    "Being Fit"
  ];
  List<Color> primaryColors = [Colors.green[600]!, Colors.red[600]!, Colors.blue[500]!, Colors.deepPurple[600]!];
  List<Color> accentColors = [Colors.limeAccent, Colors.orangeAccent, Colors.cyanAccent, Colors.pinkAccent];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background,
      appBar: AppBar(
        backgroundColor: ColorConst.background,
        elevation: 0,
        centerTitle: true,
        title: Text("Your Information",style: TextStyle(
          color: ColorConst.text,
          fontWeight: FontWeight.w600
        ),),
        actions: [
          Text("Step 1/2",style: TextStyle(
              color: ColorConst.text
          ),)
        ],
        // iconTheme: IconThemeData(color:ColorConst.text),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:  EdgeInsets.all(width*0.03),
              child: Container(
                height: height*0.66,
                width: width*1,
                // color: Colors.green,
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: height*0.15,
                      width: width*1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          color: accentColors[index].withOpacity(0.2)
                      ),
                      child: RadioListTile(
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          return ColorConst.textFieldText;
                        },),
                        activeColor: ColorConst.textField,
                        selectedTileColor: ColorConst.textFieldText,
                        title: Text(items[index],style: TextStyle(
                            color: primaryColors[index],
                            fontWeight: FontWeight.bold
                        ),),
                        value: index,
                        groupValue: _selectedValue,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedValue = value;
                          });
                        },
                      ),
                    );
                  },
                  itemCount: items.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Hgap;
                  },
                ),
              ),
            ),
            if (_selectedValue != null)
              GestureDetector(
                // onTap: () {
                //   print("Next button tapped! Selected: ${items[_selectedValue!]}");
                //   // Navigate to the next page or perform action
                // },
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoSecond(),));
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: ColorConst.container,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
