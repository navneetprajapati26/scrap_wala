import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../util/styles.dart';
class DealTile extends StatelessWidget {

  String firstImgUrl;
  String rate;
  String subCategory;
  String mainCategory;
  DealTile({Key? key,required this.firstImgUrl,required this.rate, required this.subCategory,required this.mainCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:100,width:150,child: Image.network(firstImgUrl,fit: BoxFit.cover,)),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("₹ "+rate+"/Kg",style: promptBold.copyWith(fontSize: 20),),
              ],
            ),
            SizedBox(height: 5,),
            Text(subCategory+" ("+mainCategory+")",style: promptBold.copyWith(),),
          ],
        ),
      ),
    );
  }
}
