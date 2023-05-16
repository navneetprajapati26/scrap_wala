import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scrap_wala/screens/rate_screen/controller/rate_controller.dart';
import 'package:scrap_wala/tast/tast_controller.dart';

import '../screens/rate_screen/util/rate_list_category.dart';

class TastScreen extends StatefulWidget {
  TastScreen({Key? key}) : super(key: key);

  @override
  State<TastScreen> createState() => _TastScreenState();
}

class _TastScreenState extends State<TastScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Example'),
      ),
      body: Column(
        children: [
          GetBuilder<TastController>(
              init: TastController(),
              builder: (tastController){
                return Text(tastController.i.toString());
              }),
          SizedBox(height: 100,),
          GetBuilder<TastController>(
            init: TastController(),
              builder: (tastController){
            return CupertinoButton(
              onPressed: () {
                tastController.increment();
              },
              padding: EdgeInsets.zero,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  //color: Colors.orange,
                   // color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                alignment: Alignment.center,
                child: Text(
                  "get_otp".tr,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
          // RateListCategory(mainCategory: rateList.rateList[0].name!, rateList: rateList.rateList[0].subCategory!,)
        ],
      ),
    );
  }
}
