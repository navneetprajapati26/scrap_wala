import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_wala/screens/rate_screen/util/rate_list_category.dart';
import 'package:scrap_wala/util/dimensions.dart';

import '../../controllers/favourite_controller.dart';
import '../../util/styles.dart';
import 'controller/rate_controller.dart';

class RateScreen extends StatelessWidget {
  //const RateScreen({Key? key}) : super(key: key);

  List<String> subCategoryPaper = ["Newspaper", "Books", "Carton"];

  List<double> subCategoryRatePaper = [4, 5, 3];

  List<String> plastic = [
    "White Pugga",
    "PVC",
    "bottle(PET)",
    "color pugga",
    "glass",
    "mix plastic",
    "kalla"
  ];

  List<double> ratePlastic = [4, 5, 3, 3, 8, 10, 30];

  List<Map> rateList = [
    {"subCategory": "Paper", "rate": 3},
    {"subCategory": "Iron ", "rate": 6},
    {"subCategory": "Aluminium ", "rate": 10},
    {"subCategory": "Aluminium ", "rate": 10},
  ];

  final controller = Get.put(RateListController());

  // @override
  @override
  Widget build(BuildContext context) {
    /// print(subCategoryPaper.length);
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<RateListController>(
        builder: (context) {
          return SafeArea(
            child: (controller.rateList.isNotEmpty)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            //controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            //onChanged: widget.onSearch,
                          ),
                        ),
                        RateListCategory(
                          mainCategory: controller.rateList[0].name!,
                          rateList: controller.rateList[0].subCategory!,
                        ),
                        RateListCategory(
                          mainCategory: controller.rateList[1].name!,
                          rateList: controller.rateList[1].subCategory!,
                        ),
                        RateListCategory(
                          mainCategory: controller.rateList[2].name!,
                          rateList: controller.rateList[2].subCategory!,
                        ),
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
