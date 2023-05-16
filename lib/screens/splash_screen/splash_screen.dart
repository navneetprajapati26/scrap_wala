import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';
import '../../util/images.dart';
import '../bottom_navigation_bar_dashboard/bottom_navigation_bar_dashboard.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarDashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          context.isDarkMode ? Images.logo_dark : Images.logo_light,
          //Images.logo_light,
          height: Dimensions.screenHeight / 6,
          width: Dimensions.screenWidth / 2,
        ),
      ),
    );
  }
}
