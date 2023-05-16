import 'package:get/get.dart';
class TastController extends GetxController{
  int i = 0;
  void increment(){
    i++;
    update();
  }
}