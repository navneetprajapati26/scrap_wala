import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class RateListCategory extends StatelessWidget {
  String mainCategory;
  List<String> subCategory;
  List<double> subCategoryRate;

  // Map<String,String> subCategoryRate;

  RateListCategory(
      {Key? key,
      required this.mainCategory,
      required this.subCategory,
      required this.subCategoryRate})
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
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              //physics: const NeverScrollableScrollPhysics(),
              itemCount: subCategory.length,
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
                          Text(subCategory[index],
                              style: promptBold.copyWith(
                                  fontSize: Dimensions.fontSizeDefault)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('${subCategoryRate[index]} ₹/kg',style: promptBold.copyWith(
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
