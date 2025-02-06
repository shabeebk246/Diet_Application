import 'dart:ui';

import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/screens/login&signup/signup_page.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'login_page.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.background1,
      body: Padding(
        padding:  EdgeInsets.all(width*0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(backgroundColor: Colors.greenAccent,
                radius: width*0.1,
                ),
                Center(
                  child: Text("Diet App",style: TextStyle(
                    color:ColorConst.subHead,
                    fontSize: width*0.06,
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: width*0.1,right: width*0.1),
                  child:  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
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
                                "Login",
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
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                //   },
                //   child: Container(
                //     height: height*0.08,
                //     width: width*1,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(width*0.03),
                //       color: ColorConst.subHead
                //     ),
                //     child: Center(
                //       child: Text("Login",style: TextStyle(
                //         color: ColorConst.text,
                //         fontWeight: FontWeight.w600,
                //         fontSize: width*0.04
                //       ),),
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: ColorConst.text1),),
                   TextButton(
                       onPressed:() {
                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
                       } ,
                       child: Text("Signup",style: TextStyle(
                         color: ColorConst.nameText
                       ),)
                   )

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
