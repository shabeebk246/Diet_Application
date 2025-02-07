import 'dart:io';

import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:diet_application/screens/login&signup/success_page.dart';
import 'package:diet_application/screens/user_info/info_success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../constants/image_constants.dart';
import '../../main.dart';

class UserInfoPage3 extends StatefulWidget {
  const UserInfoPage3({super.key});

  @override
  State<UserInfoPage3> createState() => _UserInfoPage3State();
}

class _UserInfoPage3State extends State<UserInfoPage3> {

  TextEditingController nameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  var files;
  pickImage(ImageSource source) async {
    final imgFile = await ImagePicker.platform.pickImage(source: source);
    if (imgFile != null) {
      files = File(imgFile.path);

      // Update state to show the image in the EditProfile screen
      if (mounted) {
        setState(() {
          files = File(imgFile.path);
        });
      }
    }
  }

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
              "Fill Your Profile",
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
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: height*0.2,
                width: width*1,
                color: ColorConst.containerBackground,
              ),
              Positioned(
                // top: width*0.07,
                left: width*0.35,
                child: CircleAvatar(
                  radius: width*0.13,
                  backgroundImage:AssetImage(ImageConst.profile),
                ),
              ),
              Positioned(
                top: height*0.12,
                left: width*0.55,
                child: InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text(
                            "Choose a file from",
                            style: TextStyle(color: ColorConst.textFieldText),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () {
                                pickImage(ImageSource.gallery); // Use the defined pickImage method
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Gallery",
                                style: TextStyle(color: ColorConst.textFieldText),
                              ),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () {
                                pickImage(ImageSource.camera); // Option to pick from the camera
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Camera",
                                style: TextStyle(color: ColorConst.textFieldText),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    radius: width*0.04,
                    backgroundColor: ColorConst.subHead,
                    child: Center(child: Icon(CupertinoIcons.pen,color: ColorConst.nameText,size: width*0.07,)),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(width*0.03),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: ColorConst.text1
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: ColorConst.text1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.text1),
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      labelText:"Full name",
                      labelStyle: TextStyle(
                          color: ColorConst.text1,
                          fontSize: width*0.035
                      )
                  ),
                ),
                Hgap,
                TextFormField(
                  controller: nickNameController,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: ColorConst.text1
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: ColorConst.text1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.text1),
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      labelText:"Nick name",
                      labelStyle: TextStyle(
                          color: ColorConst.text1,
                          fontSize: width*0.035
                      )
                  ),
                ),
                Hgap,
                TextFormField(
                  // readOnly: true,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                      color: ColorConst.text1
                  ),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: ColorConst.text1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: ColorConst.text1)
                      ),
                      labelStyle: TextStyle(
                          color: ColorConst.text1,
                          fontSize: width*0.035
                      ),
                      labelText: "Email"
                  ),
                ),
                Hgap,
                IntlPhoneField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: numberController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: TextStyle(
                      color: ColorConst.text1
                  ),
                  decoration: InputDecoration(
                      labelText:'Your Phone number',
                      labelStyle: TextStyle(
                          color: ColorConst.text1,
                          fontSize: width*0.035
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: ColorConst.text1),
                          borderRadius: BorderRadius.circular(width*0.03)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width*0.03),
                          borderSide: BorderSide(color: ColorConst.text1)
                      ),
                      counterText: ""
                  ),
                  initialCountryCode: "IN",
                ),
                Hgaaaap,
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(ColorConst.subHead)
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => InfoSuccessPage(),));
                    },
                    child: Center(
                      child: Text("Start",style: TextStyle(
                          color: ColorConst.text,
                          fontWeight: FontWeight.w600
                      ),),
                    )
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
