import 'dart:io';

import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../constants/image_constants.dart';
import '../../main.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController dateOfBirtController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

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
      body: LayoutBuilder(
        builder: (context, constraints) {
         return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:  BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
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
                          top: height*0.14,
                          left: width*0.58,
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
                              radius: width*0.045,
                              backgroundColor: ColorConst.subHead,
                              child: Center(child: Icon(CupertinoIcons.pen,color: ColorConst.nameText,size: width*0.07,)),
                            ),
                          ),
                        ),
                        Positioned(
                          top: height*0.22,
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
                                mainAxisAlignment: MainAxisAlignment.center,
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
                          Hgap,
                          TextFormField(
                            // readOnly: true,
                            controller: dateOfBirtController,
                            keyboardType: TextInputType.number,
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
                              labelText: "Date of birth"
                            ),
                          ),
                          Hgap,
                          TextFormField(
                            // readOnly: true,
                            controller: weightController,
                            keyboardType: TextInputType.number,
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
                              labelText: "Weight"
                            ),
                          ),Hgap,
                          TextFormField(
                            // readOnly: true,
                            controller: heightController,
                            keyboardType: TextInputType.number,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            textInputAction: TextInputAction.done,
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
                              labelText: "Height"
                            ),
                          ),
                        ],
                      ),
                    ),
                    Hgaaaap,
                    Padding(
                      padding:  EdgeInsets.all(width*0.03),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConst.subHead,
                          minimumSize: Size(double.infinity, 50),
                        ),
                          onPressed: () {

                          },
                          child: Text("Update Profile",style: TextStyle(
                              color: ColorConst.text,
                              fontWeight: FontWeight.w600,
                              fontSize: width*0.035
                          ),)
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
