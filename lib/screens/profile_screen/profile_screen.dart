import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final ThemeController _themeController = Get.put(ThemeController());



  @override
  Widget build(BuildContext context) {
    Color color = context.theme.primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => _themeController.toggleTheme(),
              icon: (context.isDarkMode)
                  ? Icon(
                Icons.sunny,
                color: Colors.yellow,
              )
                  : Icon(
                Icons.nights_stay_rounded,
                color: Colors.black87,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () => Get.updateLocale(const Locale('hi','IN')),
                  child: Text('hindi'),),
                TextButton(
                  onPressed: () => Get.updateLocale(const Locale('en','US')),
                  child: Text('english'),
                )
            ],
            ),

            SizedBox(height: 10,),
            ListTile(
              leading: Icon(
                Icons.person,
                color: color,
              ),
              title: Text('full_name'.tr),
              subtitle: Text("Navneet Prajapati"),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: color,
              ),
              title: Text('phone_number'.tr),
              subtitle: Text("7271088606"),
            ),
            ListTile(
              leading: Icon(Icons.location_on,color: color,),
              title: Text('address'.tr),
              subtitle: Text('Gurudham, Varanasi, India'),
            ),
          ],
        ),
      ),
    );
  }
}
