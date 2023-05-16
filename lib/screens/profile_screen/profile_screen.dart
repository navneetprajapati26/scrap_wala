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

  String firstUser= "https://img.freepik.com/premium-photo/lord-ganesha-sculpture-background-ganesh-chaturthi-generative-ai_834602-421.jpg?w=740";
  String user = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhwbPcNzn1p_X0EAmiwbUU1wUOQGF7cVCuaQ&usqp=CAU";




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
        child: SingleChildScrollView(
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
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).shadowColor,
                backgroundImage: NetworkImage(firstUser),
                //backgroundImage: SvgPicture.asset("assets/svg/user_icon.svg"),
              ),

              // SizedBox(
              //   height: 100,
              //     child: SvgPicture.asset("assets/svg/user_icon.svg")),

              SizedBox(height: 10),
              Text(
                'Ganesh',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'bhagwan_ganesh',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Mobile Number'),
                subtitle: Text('123-456-7890'),
                trailing: TextButton(child: Text("Change"),onPressed: (){},),
              ),

              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Pick up address'),
                subtitle: Text('Hyderabad ,Telangana '),
                trailing: TextButton(child: Text("Change"),onPressed: (){},),
              ),
              ListTile(
                leading: Icon(Icons.business),
                title: Text('Company name'),
                subtitle: Text('Scrap Wala'),
                trailing: TextButton(child: Text("Change"),onPressed: (){},),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                trailing: TextButton(child: Text("Change"),onPressed: (){},),
              ),

              SizedBox(height: 10,),
              Divider(),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).shadowColor,borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text('Refer a friend'),
                    onTap: (){},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).shadowColor,borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share'),
                    onTap: (){},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).shadowColor,borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Rating'),
                    onTap: (){},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).shadowColor,borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('Feedback'),
                    onTap: (){},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
