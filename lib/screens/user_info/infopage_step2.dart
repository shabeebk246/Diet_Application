import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/color_constents.dart';
import '../../../constants/widget.dart';
import '../../../main.dart';
import 'congrats_page.dart';

class InfoPageStep2 extends StatefulWidget {
  const InfoPageStep2({super.key});

  @override
  State<InfoPageStep2> createState() => _InfoPageStep2State();
}

class _InfoPageStep2State extends State<InfoPageStep2> {

  TextEditingController heightController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  String? dropDownValue;
    List<String> items=[
    "male",
    "female",
    "other"
  ];

    _datePicker(BuildContext context){
      showModalBottomSheet(
        // backgroundColor: ColorConst.background,
        context: context,
        builder: (context) {
          return Container(
            width: width*1,
            height: height*0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(width*0.03),
                    topRight: Radius.circular(width*0.03)
                )
            ),
            child: CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1980),
              lastDate: DateTime.now(),
              onDateChanged: (selectDate) {
                setState(() {
                  birthDateController.text = "${selectDate.day}/${selectDate.month}/${selectDate.year}";
                });
                Navigator.pop(context);
              },
            ),
          );
        },
      );
    }

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
      appBar: AppBar(
        backgroundColor: ColorConst.background,
        elevation: 0,
        centerTitle: true,
        title:Text("Your Info",style: TextStyle(
          color: ColorConst.text,
        ),) ,
        iconTheme: IconThemeData(
            color: ColorConst.text
        ),
        actions: [
          Text("Step 2/2",style: TextStyle(
              color: ColorConst.text
          ),)
        ],
      ),
      backgroundColor: ColorConst.background,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(constraints: BoxConstraints(
            minHeight: constraints.maxHeight
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
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
                  // onTap: () {
                  //   showCupertinoModalPopup(
                  //       context: context,
                  //       builder: (context) {
                  //         return CupertinoActionSheet(
                  //           title: Text('choose a file from',
                  //             style: TextStyle(
                  //                 color: ColorConst.text
                  //             ),
                  //           ),
                  //           actions: [
                  //             CupertinoActionSheetAction(
                  //                 onPressed: () {
                  //                   pickImage(ImageSource.gallery);
                  //                 },
                  //                 child: Text("Gallery",style: TextStyle(
                  //                     color:ColorConst.text
                  //                 ),)),
                  //             CupertinoActionSheetAction(
                  //                 onPressed: () {
                  //                   pickImage(ImageSource.camera);
                  //                 },
                  //                 child: Text("Camera",style: TextStyle(
                  //                     color:ColorConst.text
                  //                 ),)
                  //             )
                  //
                  //           ],
                  //         );
                  //       },
                  //   );
                  // },
                  child: CircleAvatar(
                    radius: width*0.15,
                    backgroundColor: ColorConst.textFieldText,
                    backgroundImage: files != null ? FileImage(files!) : null,
                    child: files == null ? Icon(Icons.camera_alt_outlined) : null,
                  ),
                ),
                Text("Add Profile Picture",style: TextStyle(
                  color: ColorConst.text
                ),),
                Padding(
                  padding:  EdgeInsets.all(width*0.03),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: heightController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Height*',
                          labelStyle: TextStyle(color: ColorConst.textFieldText),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(color: ColorConst.textField)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorConst.textField),
                            borderRadius: BorderRadius.circular(width*0.03)
                          )
                        ),
                      ),
                       Hgap,
                      TextFormField(
                        controller: heightController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Weight*',
                          labelStyle: TextStyle(color: ColorConst.textFieldText),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(color: ColorConst.textField)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorConst.textField),
                            borderRadius: BorderRadius.circular(width*0.03)
                          )
                        ),
                      ),
                      Hgap,
                      Container(
                        height: height*0.08,
                        width: width*1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          border: Border.all(color: ColorConst.textField)
                        ),
                        child: DropdownButton<Object>(
                          underline: SizedBox(),
                          hint: Padding(
                            padding:  EdgeInsets.only(left: width*0.03),
                            child: Text("Gender",style: TextStyle(
                              color: ColorConst.textFieldText,
                            ),),
                          ),
                          icon: Icon(Icons.chevron_right,color: ColorConst.textFieldText,),
                          isExpanded: true,
                          value: dropDownValue,
                          dropdownColor: ColorConst.background,
                          items: items.map((String? value) {
                            return DropdownMenuItem<Object>(
                              value: value,
                              child: Padding(
                                padding:  EdgeInsets.only(left: width*0.03),
                                child: Text(value!,style: TextStyle(
                                  color: ColorConst.textField
                                ),),
                              ),
                            );
                          }).toList(), // Add `.toList()` to convert Iterable to List
                          onChanged: (value) {
                            setState(() {
                              dropDownValue = value as String?;
                            });
                          },
                        )
                      ),
                      Hgap,
                      TextFormField(
                        controller: birthDateController,
                        readOnly: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onTap: () {
                          _datePicker(context);
                        },
                        decoration: InputDecoration(
                            labelText: "Birth Date*",
                            labelStyle: TextStyle(color: ColorConst.textFieldText),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: ColorConst.textField),
                              borderRadius: BorderRadius.circular(width*0.03)
                            ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width*0.03),
                            borderSide: BorderSide(color: ColorConst.textField)
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Hgaaaap,
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CongratsPage(),));
                  },
                  child: Container(
                    margin: EdgeInsets.all(width*0.03),
                    height: height*0.08,
                    width: width*1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width*0.03),
                        color: ColorConst.button
                    ),
                    child: Center(
                      child: Text("Next",style: TextStyle(
                          color: ColorConst.buttonText,
                          fontWeight: FontWeight.w600,
                          fontSize: width*0.04
                      ),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
