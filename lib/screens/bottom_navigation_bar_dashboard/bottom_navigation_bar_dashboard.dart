import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_wala/screens/transction_history_screen/transction_history_screen.dart';
import '../schedule_screen/add_new_deal_screen.dart';
import 'controller/bottom_navigation_bar_dashboard_controller.dart';
import '../profile_screen/profile_screen.dart';
import '../home_screen/home_screen.dart';
import '../rate_screen/rate_screen.dart';
import '../schedule_screen/old/schedule_screen.dart';

class BottomNavigationBarDashboard extends StatelessWidget {
  // const BottomNavigationBarDashboard({Key? key}) : super(key: key);

  DashboardController dashboardController = Get.put(DashboardController());

  final screens = [
    HomeScreen(),
    RateScreen(),
    AddNewDealScreen(),
    TransctionHistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(() => IndexedStack(
            //dashboardController.changeIndex(index);
            index: dashboardController.selectedIndex.value,
            children: screens,
          )),
      bottomNavigationBar: Obx(() {
          return BottomAppBar(
            shape: CircularNotchedRectangle(),
            notchMargin: 10,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      dashboardController.changeIndex(0);
                    },
                    icon: Icon(
                      Icons.home_filled,
                      color: (dashboardController.selectedIndex.value == 0)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      dashboardController.changeIndex(1);
                    },
                    icon: Icon(
                      Icons.currency_rupee_rounded,
                      color: (dashboardController.selectedIndex.value == 1)
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).disabledColor,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      dashboardController.changeIndex(3);
                    },
                    icon: Icon(
                      Icons.history_edu_rounded,
                      color: (dashboardController.selectedIndex.value == 3)
                          ? Theme.of(context).primaryColor
                          :  Theme.of(context).disabledColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      dashboardController.changeIndex(4);
                    },
                    icon: Icon(
                      Icons.person,
                      color: (dashboardController.selectedIndex.value == 4)
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).disabledColor,
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dashboardController.changeIndex(2);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
