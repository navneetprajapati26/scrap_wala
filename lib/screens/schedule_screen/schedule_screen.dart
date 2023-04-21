import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrap_wala/screens/schedule_screen/booking.dart';

import '../../controllers/favourite_controller.dart';
import '../../util/dimensions.dart';
import '../../util/styles.dart';
import '../rate_screen/rate_list_category.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  PickedFile? _imageFile;

  Future<void> _pickImage() async {
    try {
      _imageFile = await _imagePicker.getImage(
        source: ImageSource
            .gallery, // Use ImageSource.camera for taking a photo with the camera
      );
      // Do something with the picked image, e.g. display it in an ImageView widget
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  List<Map> categories = [
    {"name": "Paper", "isChecked": false},
    {"name": "Iron ", "isChecked": false},
    {"name": "Aluminium ", "isChecked": false},
  ];
  String img =
      "https://w7.pngwing.com/pngs/800/156/png-transparent-recycling-symbol-recycle-green-icon-label-text-recycling-thumbnail.png";


  final controller = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.image_rounded),
            onPressed: () {
              // _pickImage();
              Get.to(() =>Booking());
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Please Choose Your Category Scrap:",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: categories.map((favorite) {
              return CheckboxListTile(
                  activeColor: Colors.deepPurpleAccent,
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  value: favorite["isChecked"],
                  title: Text(favorite["name"]),
                  onChanged: (val) {
                    setState(() {
                      favorite["isChecked"] = val;
                    });
                  });
            }).toList()),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          if (categories[0].values.elementAt(1))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 25),
                  child: Text("Paper",
                      style: promptBold.copyWith(
                          fontSize: Dimensions.fontSizeOverLarge)),
                ),
                Container(
                  height: 134,
                  // color: Colors.redAccent,
                  child: ListView.builder(
                      itemCount: controller.subCategoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 870),
                              height: 130,
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  //color: context.theme.highlightColor,
                                  color: controller.salected_scrap.contains(
                                          controller.subCategoryList[index])
                                      ? context.theme.primaryColor
                                      : context.theme.highlightColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(img)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.subCategoryList[index]["subCategory"] ,style: promptBold,),
                                  ),
                                  Text(controller.subCategoryList[index]["rate"].toString() + " ₹/kg")
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (controller.salected_scrap
                                    .contains(controller.subCategoryList[index])) {
                                  controller.removeFromFavourite(
                                      controller.subCategoryList[index]);
                                } else {
                                  controller.addToFavourite(
                                      controller.subCategoryList[index]);
                                }
                                //color: controller.fruit.contains(controller.fruitList[index]) ?   Colors.red : Colors.white)
                                //s = controller.fruit.contains(controller.fruitList[index])? 100 :80;
                              });
                              print("inkWell ${index}");
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          if (categories[1].values.elementAt(1))
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 25),
                  child: Text("Iron",
                      style: promptBold.copyWith(
                          fontSize: Dimensions.fontSizeOverLarge)),
                ),
                Container(
                  height: 134,
                  // color: Colors.redAccent,
                  child: ListView.builder(
                      itemCount: controller.subCategoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 870),
                              height: 130,
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                //color: context.theme.highlightColor,
                                  color: controller.salected_scrap.contains(
                                      controller.subCategoryList[index])
                                      ? context.theme.primaryColor
                                      : context.theme.highlightColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(img)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.subCategoryList[index]["subCategory"] ,style: promptBold,),
                                  ),
                                  Text(controller.subCategoryList[index]["rate"].toString() + " ₹/kg")
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (controller.salected_scrap
                                    .contains(controller.subCategoryList[index])) {
                                  controller.removeFromFavourite(
                                      controller.subCategoryList[index]);
                                } else {
                                  controller.addToFavourite(
                                      controller.subCategoryList[index]);
                                }
                                //color: controller.fruit.contains(controller.fruitList[index]) ?   Colors.red : Colors.white)
                                //s = controller.fruit.contains(controller.fruitList[index])? 100 :80;
                              });
                              print("inkWell ${index}");
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),
          if (categories[2].values.elementAt(1))
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 25),
                  child: Text("Aluminium",
                      style: promptBold.copyWith(
                          fontSize: Dimensions.fontSizeOverLarge)),
                ),
                Container(
                  height: 134,
                  // color: Colors.redAccent,
                  child: ListView.builder(
                      itemCount: controller.subCategoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 870),
                              height: 130,
                              width: 130,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                //color: context.theme.highlightColor,
                                  color: controller.salected_scrap.contains(
                                      controller.subCategoryList[index])
                                      ? context.theme.primaryColor
                                      : context.theme.highlightColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(img)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.subCategoryList[index]["subCategory"] ,style: promptBold,),
                                  ),
                                  Text(controller.subCategoryList[index]["rate"].toString() + " ₹/kg")
                                ],
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                if (controller.salected_scrap
                                    .contains(controller.subCategoryList[index])) {
                                  controller.removeFromFavourite(
                                      controller.subCategoryList[index]);
                                } else {
                                  controller.addToFavourite(
                                      controller.subCategoryList[index]);
                                }
                                //color: controller.fruit.contains(controller.fruitList[index]) ?   Colors.red : Colors.white)
                                //s = controller.fruit.contains(controller.fruitList[index])? 100 :80;
                              });
                              print("inkWell ${index}");
                            },
                          ),
                        );
                      }),
                ),
              ],
            ),

        ]),
      ),
    );
  }
}
