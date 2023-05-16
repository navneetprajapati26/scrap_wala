import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/rate_model.dart';
 // Assuming the models are defined in a separate file named "models.dart"

class RateListController extends GetxController {
  var isLoading = true;
  var rateList = <RateList>[];

  @override
  void onInit() {
    super.onInit();
    fetchRateList();
  }

  void fetchRateList() async {
    //print("----------------------------------------------------------->Fatching rate");
    try {
      isLoading =true;
      var response = await http.get(Uri.parse('https://scrapwalaa.onrender.com/api/getAllProducts'));
      //print("--------------------> "+response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        //print(jsonResponse);
        var rateListJson = jsonResponse as List<dynamic>;
        rateList = rateListJson.map((json) => RateList.fromJson(json)).toList();
        //print(rateList[0].name);
      } else {
        //print('Error fetching rate list: ${response.statusCode}');
      }
    } catch (e) {
     // print('--------------------------------------------------------------> Error fetching rate list: $e');
    } finally {
      isLoading=false;
    }
    update();
  }
}
