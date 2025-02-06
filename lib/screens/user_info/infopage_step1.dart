import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../main.dart';
import 'infopage_step2.dart';



class InfoPageStep1 extends StatefulWidget {
  const InfoPageStep1({super.key});

  @override
  State<InfoPageStep1> createState() => _InfoPageStep1State();
}

class _InfoPageStep1State extends State<InfoPageStep1> {

  TextEditingController nameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String radioController = "LW";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background,
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
          Text("Step 1/2",style: TextStyle(
            color: ColorConst.text
          ),)
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
         return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(width*0.03),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: 'Your Name*',
                                labelStyle: TextStyle(
                                    color: ColorConst.textFieldText
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorConst.textField),
                                  borderRadius: BorderRadius.circular(width*0.03),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(width*0.03),
                                    borderSide: BorderSide(color: ColorConst.textField)
                                )
                            ),
                          ),
                          Hgap,
                          TextFormField(
                            controller: nickNameController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelText: 'Your Nickname*',
                                labelStyle: TextStyle(
                                    color: ColorConst.textFieldText
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorConst.textField),
                                  borderRadius: BorderRadius.circular(width*0.03),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(width*0.03),
                                    borderSide: BorderSide(color: ColorConst.textField)
                                )
                            ),
                          ),
                          Hgap,
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(
                                    color: ColorConst.textFieldText
                                ),
                                labelText: 'Your Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: ColorConst.textField),
                                  borderRadius: BorderRadius.circular(width*0.03),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(width*0.03),
                                    borderSide: BorderSide(color: ColorConst.textField)
                                )
                            ),
                          ),
                          Hgap,
                          IntlPhoneField(
                            controller: numberController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                labelText:'Your Phone number',
                                labelStyle: TextStyle(
                                  color: ColorConst.textFieldText,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: ColorConst.textField),
                                    borderRadius: BorderRadius.circular(width*0.03)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(width*0.03),
                                    borderSide: BorderSide(color: ColorConst.textField)
                                )
                            ),
                            initialCountryCode: "IN",
                          ),
                          // InkWell(
                          //   onTap: () {
                          //      showModalBottomSheet(
                          //          context: context,
                          //          builder: (context) {
                          //            return Container(
                          //              height: height*0.4,
                          //              width: width*1,
                          //              decoration: BoxDecoration(
                          //                color: ColorConst.background,
                          //                borderRadius: BorderRadius.only(topRight:Radius.circular(width*0.03),topLeft: Radius.circular(width*0.03))
                          //              ),
                          //              child: Column(
                          //                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                crossAxisAlignment: CrossAxisAlignment.start,
                          //                children: [
                          //                  Row(
                          //                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //                    children: [
                          //                      Text("You're here for",style: TextStyle(
                          //                        color: ColorConst.text,
                          //                        fontWeight: FontWeight.w600,
                          //                        fontSize: width*0.045
                          //                      ),),
                          //                      Container(
                          //                        height: height*0.04,
                          //                        width: width*0.3,
                          //                        decoration: BoxDecoration(
                          //                          borderRadius: BorderRadius.circular(width*0.02),
                          //                          border: Border.all(color: ColorConst.textField)
                          //                        ),
                          //                        child: Row(
                          //                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                          children: [
                          //                            Icon(Icons.cancel_outlined,color: ColorConst.textFieldText,),
                          //                            Text("Cancel",style: TextStyle(
                          //                                color: ColorConst.textFieldText
                          //                            ),)
                          //                          ],
                          //                        ),
                          //                      )
                          //                    ],
                          //                  ),
                          //                  ListTile(
                          //                    leading: Radio(
                          //                      activeColor: Colors.blueAccent,
                          //                      fillColor: MaterialStatePropertyAll(Colors.blueAccent),
                          //                      value: "LW",
                          //                      groupValue: radioController,
                          //                      onChanged: (value) {
                          //                        setState(() {
                          //                          radioController = value!;
                          //                        });
                          //                      },
                          //                    ),
                          //                   title: Text("Loosing Weight",style: TextStyle(color: ColorConst.text),),
                          //                  ),
                          //                ListTile(
                          //                 leading:  Radio(
                          //                    activeColor: Colors.blueAccent,
                          //                    fillColor: MaterialStatePropertyAll(Colors.blueAccent),
                          //                    value: "GW",
                          //                    groupValue: radioController,
                          //                    onChanged: (value) {
                          //                      setState(() {
                          //                        radioController = value!;
                          //                      });
                          //                    },
                          //                  ),
                          //                  title:  Text("Gaining Weight",style: TextStyle(color: ColorConst.text),),
                          //                ),
                          //                ListTile(
                          //                 leading:  Radio(
                          //                    activeColor: Colors.blueAccent,
                          //                    fillColor: MaterialStatePropertyAll(Colors.blueAccent),
                          //                    value: "KW",
                          //                    groupValue: radioController,
                          //                    onChanged: (value) {
                          //                      setState(() {
                          //                        radioController = value!;
                          //                      });
                          //                    },
                          //                  ),
                          //                  title:  Text("Keeping Weight",style: TextStyle(color: ColorConst.text),),
                          //                ),
                          //                ListTile(
                          //                 leading:  Radio(
                          //                    activeColor: Colors.blueAccent,
                          //                    fillColor: MaterialStatePropertyAll(Colors.blueAccent),
                          //                    value: "BF",
                          //                    groupValue: radioController,
                          //                    onChanged: (value) {
                          //                      setState(() {
                          //                        radioController = value!;
                          //                      });
                          //                    },
                          //                  ),
                          //                  title:  Text("Being Fit",style: TextStyle(color: ColorConst.text),),
                          //                ),
                          //
                          //                ],
                          //              ),
                          //            );
                          //          },
                          //      );
                          //   },
                          //   child: Container(
                          //     height: height*0.08,
                          //     width: width*1,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(width*0.03),
                          //       border: Border.all(color: ColorConst.textField)
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         Text("You're here for",style: TextStyle(
                          //           color: ColorConst.textFieldText
                          //         ),),
                          //         Icon(Icons.chevron_right,color: ColorConst.textFieldText,),
                          //
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPageStep2(),));
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
            ),
          );
        },
      ),
    );
  }
}
