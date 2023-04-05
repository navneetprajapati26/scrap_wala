import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/bottom_navigation_bar_dashboard_controller.dart';
import '../profile_screen/profile_screen.dart';
import '../home_screen/home_screen.dart';
import '../pickup_screen/pickup_screen.dart';
import '../rate_screen/rate_screen.dart';
import '../schedule_screen/schedule_screen.dart';
class BottomNavigationBarDashboard extends StatefulWidget {
  const BottomNavigationBarDashboard({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarDashboard> createState() => _BottomNavigationBarDashboardState();
}

class _BottomNavigationBarDashboardState extends State<BottomNavigationBarDashboard> {
  DashboardController dashboardController = Get.put(DashboardController());
  final screens = [
    HomeScreen(),
    ScheduleScreen(),
    PickUpScreen(),
    RateScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: dashboardController.selectedIndex.value,
        children: screens,
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: context.theme.primaryColor,
        unselectedItemColor: context.theme.disabledColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          dashboardController.changeIndex(index);
        },
        currentIndex: dashboardController.selectedIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "home".tr,
            // backgroundColor: Color(0xFFF1CF63)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "schedule".tr,
            //backgroundColor: Color(0xFFF1CF63)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.car_repair_rounded),
            label: "pickUp".tr,
            //backgroundColor: Color(0xFFF1CF63)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_rupee_outlined),
            label: "rate".tr,
            // backgroundColor: Color(0xFFF1CF63)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: "profile".tr,
            // backgroundColor: Color(0xFFF1CF63)
          )
        ],
      )),
    );
  }
}
