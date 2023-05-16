import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:scrap_wala/screens/auth/login_user_screen/verify_otp_screen.dart';
import 'package:scrap_wala/screens/bottom_navigation_bar_dashboard/bottom_navigation_bar_dashboard.dart';

import 'auth_phone_model.dart';

class AuthController extends GetxController{

  var otp ;
  late String mobNo;
  bool isLoading_postMobileNum = false;
  bool isLoading_otpVerification = false;
  late OtpResponse otpResponse;

  void postMobileNum(String mobileNo) async {
    isLoading_postMobileNum = true;
    mobNo = mobileNo;
    update();
    print(isLoading_postMobileNum);
    print("postMobileNum call");
    final url = Uri.parse('https://scrapwalaa.onrender.com/api/getOtp');
    print("URI posted "+mobileNo);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json ; charset=UTF-8'},
      body: jsonEncode({"mobile_no": mobileNo}),
    );
    print(response.statusCode);
    if (response.statusCode == 200 ) {
      var jsonResponse = jsonDecode(response.body);
      otp = jsonResponse;
      Get.snackbar(
        "Note",
        "Your Otp is :-  ${otp.toString()}",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        // backgroundColor:  AppColors.toastGreenColor ,
        //  icon: Image.asset(
        //    "assets/images/success_toast.png",
        //    height: 25,
        //    width: 25,
        //    color: Colors.white,
        //  ),
      );
      isLoading_postMobileNum = false;
      update();
      print(isLoading_postMobileNum);
      print(otp);
     // print(otp.runtimeType);
      // print(responseModel.value.id);
       Get.to(() => const VerifyOtpScreen());
    }
    if(response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse.runtimeType);
      Get.snackbar(
        "Hello",
        jsonResponse['msg'],
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
       // backgroundColor:  AppColors.toastGreenColor ,
       //  icon: Image.asset(
       //    "assets/images/success_toast.png",
       //    height: 25,
       //    width: 25,
       //    color: Colors.white,
       //  ),
      );
      isLoading_postMobileNum = false;
      update();
      print(jsonResponse['msg']);
    }
    else {
      // handle error
    }
    update();
  }

  void otpVerification(var otp_by_user) async{
    isLoading_otpVerification = true;
    print("in otpVerification");
    int otp_user = int.parse(otp_by_user);
    final url = Uri.parse('https://scrapwalaa.onrender.com/api/auth/otpVerification');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json ; charset=UTF-8'},
      body: jsonEncode({
        "mobile_no":mobNo,
        "otp":otp_user,
        "otp_ent":otp
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200 ) {
      var jsonResponse = jsonDecode(response.body);

      otpResponse = OtpResponse.fromJson(jsonResponse);

      print(jsonResponse);
      print(otpResponse.mobileNo);
      Get.snackbar(
        "Hello",
        "Otp is Velid",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        // backgroundColor:  AppColors.toastGreenColor ,
        //  icon: Image.asset(
        //    "assets/images/success_toast.png",
        //    height: 25,
        //    width: 25,
        //    color: Colors.white,
        //  ),
      );
      isLoading_otpVerification = false;
      Get.to(() => BottomNavigationBarDashboard());
    }
    if(response.statusCode == 400){
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse.runtimeType);
      Get.snackbar(
        "Hello",
        jsonResponse['msg'],
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        borderRadius: 10,
        // backgroundColor:  AppColors.toastGreenColor ,
        //  icon: Image.asset(
        //    "assets/images/success_toast.png",
        //    height: 25,
        //    width: 25,
        //    color: Colors.white,
        //  ),
      );
      isLoading_otpVerification = false;
      print(jsonResponse['msg']);
    }
    else {
      // handle error
    }

  }


  

}