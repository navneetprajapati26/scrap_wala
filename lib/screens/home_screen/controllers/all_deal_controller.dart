import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/all_deal_model.dart';


class AllDealsController extends GetxController {
  late List<AllDeals> allDealsList;
  bool isLoding = false;

  @override
  void onInit() {
    super.onInit();
    fetchAllDeals();
  }

  void fetchAllDeals() async {
    final url = 'https://scrapwalaa.onrender.com/api/getAllDeals'; // Replace with your API endpoint

    try {
      final response = await http.get(Uri.parse(url));
      print('response code of all deals  : ${response.statusCode}');

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);

        allDealsList = jsonResponse.map((json) => AllDeals.fromJson(json)).toList();
        isLoding = true;

        update();
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
