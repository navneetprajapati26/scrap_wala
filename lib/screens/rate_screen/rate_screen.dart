import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_wala/screens/rate_screen/rate_list_category.dart';
import 'package:scrap_wala/util/dimensions.dart';

import '../../util/styles.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  List<String> subCategoryPaper = [
    "Newspaper","Books","Carton"
  ];
  List<double> subCategoryRatePaper = [
    4,5,3
  ];

  List<String> plastic = [
    "White Pugga","PVC","bottle(PET)", "color pugga","glass","mix plastic","kalla"
  ];
  List<double> ratePlastic = [
    4,5,3,3,8,10,30
  ];

  @override
  Widget build(BuildContext context) {
    print(subCategoryPaper.length);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                mainCategory: 'Paper',
                subCategory: subCategoryPaper,
                subCategoryRate: subCategoryRatePaper,
              ),

              RateListCategory(
                mainCategory: 'Plastic',
                subCategory: plastic,
                subCategoryRate: ratePlastic,
              ),
              RateListCategory(
                mainCategory: 'Plastic',
                subCategory: plastic,
                subCategoryRate: ratePlastic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}