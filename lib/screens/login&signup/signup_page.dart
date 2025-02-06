import 'dart:ui';

import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/constants/widget.dart';
import 'package:diet_application/screens/login&signup/login_page.dart';
import 'package:diet_application/screens/login&signup/success_page.dart';
import 'package:flutter/material.dart';

import '../../constants/image_constants.dart';
import '../../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();

  bool visible = true;
  bool touch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      appBar: AppBar(
        backgroundColor: ColorConst.background1,
        centerTitle: true,
        title: Text("Create Account",style: TextStyle(
            color: ColorConst.subHead,
        fontWeight: FontWeight.w600
        ),),
        iconTheme: IconThemeData(color: ColorConst.subHead),
        automaticallyImplyLeading:false,
        leading: InkWell(onTap: () {
          Navigator.pop(context);
        },
            child: Icon(Icons.arrow_left,size: width*0.1,)),
        elevation: 0,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Let's Start",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: ColorConst.text1,
                      fontSize: width*0.05
                    ),),
                    Container(
                      height: height*0.33,
                      width: width*1,
                      color: ColorConst.containerBackground,
                      child: Padding(
                        padding:  EdgeInsets.all(width*0.03),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: ColorConst.text,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              style: TextStyle(color: ColorConst.text),
                              decoration: InputDecoration(
                                  enabledBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(width*0.03),
                                      borderSide:BorderSide(color: ColorConst.text1)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(width*0.03),
                                      borderSide: BorderSide(color: ColorConst.text1)
                                  ),
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: ColorConst.text
                                  )
                              ),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: passwordController,
                              cursorColor: ColorConst.text,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              obscuringCharacter: "*",
                              obscureText: visible ? true : false,
                              style: TextStyle(color: ColorConst.text),
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: ColorConst.text),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      visible = !visible;
                                      setState(() {

                                      });
                                    },
                                    child: Icon(
                                      visible ? Icons.visibility_off : Icons.visibility,
                                      color: ColorConst.text,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorConst.text1),
                                      borderRadius: BorderRadius.circular(width*0.03)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(width*0.03),
                                      borderSide: BorderSide(color: ColorConst.text1)
                                  )
                              ),
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              controller: conformPasswordController,
                              cursorColor: ColorConst.text,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              obscuringCharacter: "*",
                              obscureText: touch ? true : false,
                              style: TextStyle(color: ColorConst.text),
                              decoration: InputDecoration(
                                  labelText: "Conform Password",
                                  labelStyle: TextStyle(
                                      color: ColorConst.text),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      touch = !touch;
                                      setState(() {

                                      });
                                    },
                                    child: Icon(
                                      touch ? Icons.visibility_off : Icons.visibility,
                                      color: ColorConst.text,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: ColorConst.text1),
                                      borderRadius: BorderRadius.circular(width*0.03)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(width*0.03),
                                      borderSide: BorderSide(color: ColorConst.text1)
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text("By Consuming, you agree to",style: TextStyle(color: ColorConst.text1,fontSize: width*0.025),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Terms of Use",style: TextStyle(color: ColorConst.subHead,fontSize:width*0.025),),
                            Text(" and ",style: TextStyle(color: ColorConst.text1,fontSize: width*0.025),),
                            Text("Privacy Policy",style: TextStyle(fontSize: width*0.025,color: ColorConst.subHead),)
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: width*0.1,right: width*0.1),
                      child:  Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage(),));
                              },
                              child: Container(
                                height: height*0.07,
                                width: width*0.8,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2), // Adjust opacity for better effect
                                  borderRadius: BorderRadius.circular(width*1),
                                  border: Border.all(color: Colors.white.withOpacity(0.3)),
                                ),
                                child: Center(
                                  child: Text(
                                    "Signup",
                                    style: TextStyle(color: ColorConst.text1,
                                        fontWeight: FontWeight.w600,
                                        fontSize: width*0.04
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage(),));
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.all(width*0.03),
                    //     height: height*0.08,
                    //     width: width*1,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(width*0.03),
                    //         color: ColorConst.button
                    //     ),
                    //     child: Center(
                    //       child: Text("Sign Up",style: TextStyle(
                    //           color: ColorConst.buttonText,
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: width*0.04
                    //       ),),
                    //     ),
                    //   ),
                    // ),
                    Column(
                      children: [
                        Center(
                          child: Text("or",style: TextStyle(
                              color: ColorConst.text1,
                              fontSize: width*0.04
                          ),),
                        ) ,
                        Center(
                          child: Text("Sign up with",style: TextStyle(
                              color: ColorConst.text1,
                              fontSize: width*0.04
                          ),),
                        ),
                        Hgaaaap,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(onTap: () {

                            },
                                child: Image.asset(ImageConst.apple,height: height*0.055,color: ColorConst.text1,)),
                            Wgaaaap,
                            InkWell(onTap: () {

                            },
                                child: Image.asset(ImageConst.google,height: height*0.06,)),
                            Wgaaaap,
                            InkWell(onTap: () {

                            },
                                child: Image.asset(ImageConst.facebook,height: height*0.06,))
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have account?",style: TextStyle(color: ColorConst.text1),),
                        TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                            },
                            child: Text("Log in",style: TextStyle(
                                color: ColorConst.subHead
                            ),)
                        )
                      ],
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
