import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:scrap_wala/screens/deal_screen/deal_screen.dart';
import 'package:scrap_wala/screens/home_screen/utils/deal_card.dart';
import 'package:scrap_wala/util/dimensions.dart';

import '../../util/styles.dart';
import 'controllers/all_deal_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AllDealsController>(
          init: AllDealsController(),
          builder: (allDealsController) {
            return (allDealsController.isLoding)
                ? SmartRefresher(
                    controller: _refreshController,
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 1000));
                      allDealsController.fetchAllDeals();
                      _refreshController.refreshCompleted();
                    },
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: allDealsController.allDealsList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DealScreen()));
                          },
                          child: DealTile(
                            firstImgUrl: allDealsController.allDealsList[index].deal!.images![0],
                            rate: allDealsController.allDealsList[index].deal!.rate!,
                            subCategory: allDealsController.allDealsList[index].deal!.subCategory!,
                            mainCategory: allDealsController.allDealsList[index].deal!.mainCategory!,
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ));
          }),
    );
  }
}
