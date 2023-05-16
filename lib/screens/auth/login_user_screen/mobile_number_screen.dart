import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:scrap_wala/screens/auth/login_user_screen/verify_otp_screen.dart';
import 'package:scrap_wala/util/dimensions.dart';
import 'package:scrap_wala/util/images.dart';

import 'auth_controller.dart';

class MobileNumberScreen extends StatelessWidget {
  //const MobileNumberScreen({Key? key}) : super(key: key);

  // final AuthController _authController = Get.find();
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: SvgPicture.asset(
                  context.isDarkMode ? Images.logo_dark : Images.logo_light,
                  //Images.logo_light,
                  // height: Dimensions.screenHeight / 6,
                  // width: Dimensions.screenWidth / 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'phone_number'.tr,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.RADIUS_DEFAULT))),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  //todo: commplet number
                  phoneNumber = phone.number.toString();
                  //print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (authTastCont) {
                    return CupertinoButton(
                      onPressed: () async {
                        //todo: Login btn

                        authTastCont.postMobileNum(phoneNumber);
                        print(phoneNumber);
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                            //color: Colors.orange,
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: authTastCont.isLoading_postMobileNum
                            ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                            : Text(
                                "get_otp".tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                    );
                  }),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Obx(() {
              //     if (_authController.isDone.value) {
              //       return Text(
              //           "OTP Sent! ID: ${_authController.responseModel.value.id}");
              //     } else {
              //       return Text("Waiting for response...");
              //     }
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
