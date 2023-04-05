import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:scrap_wala/controllers/auth_controllers.dart';
import 'package:scrap_wala/screens/auth/verify_otp_screen.dart';
import 'package:scrap_wala/util/dimensions.dart';
import 'package:scrap_wala/util/images.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({Key? key}) : super(key: key);

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final AuthController _authController = Get.find();
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
              SvgPicture.asset(
                context.isDarkMode ? Images.logo_dark : Images.logo_light,
                //Images.logo_light,
                height: Dimensions.screenHeight / 6,
                width: Dimensions.screenWidth / 2,
              ),
              SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                decoration:  InputDecoration(
                  labelText: 'phone_number'.tr,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.RADIUS_DEFAULT))),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  //todo: commplet number
                  phoneNumber = phone.completeNumber.toString();
                  print(phone.completeNumber);
                },
              ),
              SizedBox(
                height: 20,
              ),
              CupertinoButton(
                onPressed: () {
                  //todo: Login btn
                  Get.to(() => const VerifyOtpScreen());
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
                  child: Text(
                    "get_otp".tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
