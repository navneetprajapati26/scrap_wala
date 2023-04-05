
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrap_wala/screens/profile_screen/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth/verify_otp_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferences _prefs = Get.find();

  RxBool loading = false.obs;
  RxString verificationId = ''.obs;
  RxInt resendToken = 0.obs;

  Future<void> sendOtp(String phoneNumber,BuildContext context ) async {
    loading.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        loading.value = false;
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loading.value = false;
        Get.snackbar('Error', e.message!);
      },
      codeSent: (String? id, int? token) {
        loading.value = false;
        verificationId.value = id!;
        resendToken.value = token!;
        _prefs.setString('verificationId', id);

      },
      codeAutoRetrievalTimeout: (String? id) {
        verificationId.value = id!;
        _prefs.setString('verificationId', id);
      },
      timeout: Duration(seconds: 60),
    );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOtpScreen()));
  }

  Future<void> verifyOtp(String otp,BuildContext context ) async {
    loading.value = true;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp);
    await _auth.signInWithCredential(credential);
    loading.value = false;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
  }

  Future<void> resendOtp() async {
    loading.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: _auth.currentUser!.phoneNumber!,
      forceResendingToken: resendToken.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        loading.value = false;
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        loading.value = false;
        Get.snackbar('Error', e.message!);
      },
      codeSent: (String? id, int? token) {
        loading.value = false;
        verificationId.value = id!;
        resendToken.value = token!;
        _prefs.setString('verificationId', id);
      },
      codeAutoRetrievalTimeout: (String? id) {
        verificationId.value = id!;
        _prefs.setString('verificationId', id);
      },
      timeout: Duration(seconds: 60),
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
