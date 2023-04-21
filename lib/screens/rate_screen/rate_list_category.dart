import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class RateListCategory extends StatelessWidget {
  String mainCategory;

  List<Map> rateList;

  RateListCategory(
      {Key? key, required this.mainCategory, required this.rateList
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mainCategory,
                style: promptBold.copyWith(
                    fontSize: Dimensions.fontSizeOverLarge)),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: rateList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 100,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          color: context.theme.highlightColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(rateList[index].values.elementAt(0).toString(),
                              style: promptBold.copyWith(
                                  fontSize: Dimensions.fontSizeDefault)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${rateList[index].values.elementAt(1).toString()} ₹/kg',style: promptBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge)),
                          )
                        ],
                      )),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
