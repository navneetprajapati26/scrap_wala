import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/favourite_controller.dart';
class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  @override
  void initState() {
    // TODO: implement initState
    totele();
    super.initState();
  }


  final controller = Get.put(FavouriteController());
  final listController = ScrollController();

  var sum;
  totele(){
      for(int i=0; i>controller.salected_scrap.value.length; i++){
        print(controller.salected_scrap[i]["rate"]);
        sum += controller.salected_scrap[i]["rate"];

      }
      print(sum);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                //controller: listController,
                itemCount: controller.salected_scrap.length,
                  itemBuilder: (context,index){
                  return ListTile(title: Text(controller.salected_scrap[index]["subCategory"]),trailing: Text(controller.salected_scrap[index]["rate"].toString()+ " ₹/kg"),);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
