import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:diet_application/constants/color_constents.dart';
import 'package:diet_application/screens/home/home_page.dart';
import 'package:diet_application/screens/profile/profile_screen.dart';
import 'package:diet_application/userdata/user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

   int _selectedIndex = 0;

  
  List Pages = [
    const HomePage(),
    const UserInfo(),
    const ProfileScreen(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
          elevation: 0,
          backgroundColor: ColorConst.containerBackground,
          activeColor: ColorConst.container,
          items: [
            TabItem(icon:Icon(Icons.home,color: ColorConst.text1,),
            activeIcon: Icon(Icons.home,color: ColorConst.text,)
            ),
            TabItem(icon: Icon(CupertinoIcons.plus,color: ColorConst.text1,),
            activeIcon: Icon(CupertinoIcons.plus,color: ColorConst.text,)
            ),
            TabItem(icon: Icon(Icons.person,color: ColorConst.text1,),
            activeIcon: Icon(Icons.person,color: ColorConst.text,)
            ),
          ],
        initialActiveIndex: 0,
        onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
        },
      ),
      body: Pages[_selectedIndex],

    );
  }
}
