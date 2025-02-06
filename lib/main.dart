import 'package:diet_application/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

var height;
var width;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.from(
            colorScheme: ColorScheme.dark(),
          textTheme: GoogleFonts.poppinsTextTheme()
        ).copyWith(
          pageTransitionsTheme:PageTransitionsTheme(
            builders:<TargetPlatform , PageTransitionsBuilder>{
              TargetPlatform.android : ZoomPageTransitionsBuilder()
            }
          )
        ),
        home: SplashScreen(),
      ),
    );
  }
}

