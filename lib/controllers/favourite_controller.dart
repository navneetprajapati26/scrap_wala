import 'package:get/get.dart';
class FavouriteController extends GetxController{




  RxList salected_scrap = [].obs ;

  //RxList<String> fruitList = ['Apple' , 'Orange' , 'Grapes' , 'Mango'].obs ;

  RxList<Map> subCategoryList = [
    {"subCategory": "Newspaper ", "rate": 3, "isChecked": false},
    {"subCategory": "Cartoon ", "rate": 6, "isChecked": false},
    {"subCategory": "File paper ", "rate": 10, "isChecked": false},
    {"subCategory": "File paper ", "rate": 10, "isChecked": false},
    {"subCategory": "File paper ", "rate": 10, "isChecked": false},
  ].obs;

  //RxInt totel = 0.obs;

  addToFavourite(Map value){
    salected_scrap.add(value);
  }
  removeFromFavourite(Map value){
    salected_scrap.remove(value);
  }
  // totele(){
  //   for(int i=0; i>salected_scrap.value.length; i++){
  //     totel.value += salected_scrap[i]["rate"];
  //   }
  //   print(totel);
  // }
}