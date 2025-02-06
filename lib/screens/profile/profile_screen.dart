import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/image_constants.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:diet_application/screens/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: height*0.4,
                width: width*1,
                color: ColorConst.containerBackground,
              ),
              Positioned(
                top: width*0.07,
                left: width*0.35,
                child: CircleAvatar(
                  radius: width*0.15,
                  backgroundImage:AssetImage(ImageConst.profile),
                ),
              ),
              Positioned(
                top: width*0.37,
                left: width*0.28,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Madison Smith",style: TextStyle(
                      color: ColorConst.text1,
                      fontSize: width*0.04,
                      fontWeight: FontWeight.w600
                    ),),
                    Text("madison@examplw.com",style: TextStyle(
                      color: ColorConst.text1,
                    ),),
                    Row(
                      children: [
                        Text("Birthday:",style: TextStyle(
                          color: ColorConst.text1,
                          fontWeight: FontWeight.w600,
                          fontSize: width*0.035
                        ),),
                        Text("April 1",style: TextStyle(color: ColorConst.text1),)
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: height*0.33,
                left: width*0.1,
                child: Row(
                  children: [
                    Container(
                      height: height*0.13,
                      width: width*0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: ColorConst.nameText
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("75.kg",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorConst.text1,
                                fontSize: width*0.04
                              ),),
                              Text("Weight",style: TextStyle(
                                color: ColorConst.text1
                              ),)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("28",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorConst.text1,
                                fontSize: width*0.04
                              ),),
                              Text("years Old",style: TextStyle(
                                color: ColorConst.text1
                              ),)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1.65 CM",style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: ColorConst.text1,
                                fontSize: width*0.04
                              ),),
                              Text("Height",style: TextStyle(
                                color: ColorConst.text1
                              ),)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: height*0.08,),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(),));
            },
            child: ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: ColorConst.nameText,),
              title: Text("Profile",style: TextStyle(
                color: ColorConst.text1
              ),),
              trailing: Icon(Icons.arrow_right,color: ColorConst.subHead,),
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock,color: ColorConst.nameText,),
            title: Text("Privacy Policy",style: TextStyle(
              color: ColorConst.text1
            ),),
            trailing: Icon(Icons.arrow_right,color: ColorConst.subHead,),
          ),
          ListTile(
            leading: Icon(Icons.settings,color: ColorConst.nameText,),
            title: Text("Settings",style: TextStyle(
              color: ColorConst.text1
            ),),
            trailing: Icon(Icons.arrow_right,color: ColorConst.subHead,),
          ),
          ListTile(
            leading: Icon(Icons.help_center_rounded,color: ColorConst.nameText,),
            title: Text("Help",style: TextStyle(
              color: ColorConst.text1
            ),),
            trailing: Icon(Icons.arrow_right,color: ColorConst.subHead,),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined,color: ColorConst.nameText,),
            title: Text("Logout",style: TextStyle(
              color: ColorConst.text1
            ),),
            trailing: Icon(Icons.arrow_right,color: ColorConst.subHead,),
          ),
        ],
      ),
    );
  }
}
