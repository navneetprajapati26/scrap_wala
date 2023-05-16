import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../bottom_navigation_bar_dashboard/bottom_navigation_bar_dashboard.dart';
import 'auth_controller.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String? otpCode;
  late bool code;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    startTimer();
    secondsRemaining = 30;
    super.initState();
  }

  int secondsRemaining = 30;
  bool enableResend = true;
  late Timer timer;
  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      // print(timer);
      if (secondsRemaining != 0) {
        setState(() => secondsRemaining = secondsRemaining - 1);
      } else {
        setState(() {
          enableResend = true;
          timer.cancel();
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xffffff),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_LARGE),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<AuthController>(
                  init: AuthController(),
                  builder: (authTastCont) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Otp is "+authTastCont.otp.toString()),
                  );
                }
              ),

              SvgPicture.asset(
                context.isDarkMode ? Images.logo_dark : Images.logo_light,
                //Images.logo_light,
                height: Dimensions.screenHeight / 6,
                width: Dimensions.screenWidth / 2,
              ),
              SizedBox(
                height: 20,
              ),
              // OTPTextField(
              //   length: 4,
              //   width: MediaQuery.of(context).size.width,
              //   fieldWidth: 50,
              //   otpFieldStyle: OtpFieldStyle(
              //     enabledBorderColor: Theme.of(context).disabledColor,
              //     focusBorderColor: Theme.of(context).primaryColor,
              //   ),
              //   style: const TextStyle(fontSize: 20),
              //   fieldStyle: FieldStyle.box,
              //   outlineBorderRadius: Dimensions.RADIUS_DEFAULT,
              //   textFieldAlignment: MainAxisAlignment.spaceAround,
              //   onCompleted: (otp) {
              //     print(otp);
              //     setState(() {
              //       //_authController.verifyMobileNumber(otp);
              //       otpCode = otp;
              //     });
              //     code = true;
              //   },
              // ),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                //maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Enter Otp',
                  prefixIcon: const Icon(Icons.edit_note_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                //onChanged: widget.onSearch,
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

                        authTastCont.otpVerification(otpController.text);

                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 65,
                        decoration: BoxDecoration(
                          //color: Colors.orange,
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        alignment: Alignment.center,
                        child: authTastCont.isLoading_otpVerification
                            ? CircularProgressIndicator(
                          color: Colors.black,
                        )
                            : Text(
                          "verify_otp".tr,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("otp_not_founde".tr),
                  TextButton(
                      onPressed: enableResend ? () => initState() : null,
                      child: Text("resand_otp".tr+" "+ secondsRemaining.toString())),
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
