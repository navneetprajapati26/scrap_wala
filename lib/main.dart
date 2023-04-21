import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:scrap_wala/screens/auth/verify_otp_screen.dart';
import 'package:scrap_wala/screens/bottom_navigation_bar_dashboard/bottom_navigation_bar_dashboard.dart';
import 'package:scrap_wala/tast/tast_screen.dart';
import 'package:scrap_wala/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/auth_controllers.dart';
import 'controllers/language_controller.dart';
import 'firebase_options.dart';
import 'screens/auth/mobile_number_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.values.first));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences);
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Locale('en', 'US'),
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: MobileNumberScreen(),
      //home: TastScreen(),
      //home: BottomNavigationBarDashboard(),
    );
  }
}
