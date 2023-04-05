import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US' : {
      'phone_number':'Phone Number',
      'get_otp' : 'Get OTP',

      //verify otp screen
      'verify_otp':'Verify OTP',
      'otp_not_founde':'OTP not founde ?',
      'resand_otp':'Resand Otp',

      //home
      'home':'Home',



      //Schedule
      'schedule':'Schedule',



      //PickUp
      'pickUp':'PickUp',



      //Rate
      'rate':'Rate',


      //Profile
      'profile':'Profile',
      'full_name':'Full Name',
      'phone_number':'Phone Number',
      'address':'Address'
    },
    'hi_IN' : {
      'phone_number':'फ़ोन नंबर',
      'get_otp' : 'ओटीपी प्राप्त करें',

      //verify otp screen
      'verify_otp':'ओटीपी सत्यापित करें',
      'otp_not_founde':'ओटीपी नहीं मिला ?',
      'resand_otp':'ओटीपी पुनः भेजें',

      //home
      'home':'होम',



      //Schedule
      'schedule':'शिड्यूल',



      //PickUp
      'pickUp':'उठाना',



      //Rate
      'rate':'दर',


      //Profile
      'profile':'प्रोफ़ाइल',
      'full_name':'पूरा नाम',
      'phone_number':'फ़ोन नंबर',
      'address':'पता'



    }
  };

}