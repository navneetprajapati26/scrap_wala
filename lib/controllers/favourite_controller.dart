import 'package:get/get.dart';
class FavouriteController extends GetxController{




  RxList salected_scrap = [].obs ;

  //RxList<String> fruitList = ['Apple' , 'Orange' , 'Grapes' , 'Mango'].obs ;

  RxList<Map> subCategoryList = [
    {"subCategory": "Newspaper ", "rate": 14, "isChecked": false},
    {"subCategory": "Books ", "rate": 12, "isChecked": false},
    {"subCategory": "Carton ", "rate": 9, "isChecked": false},
    {"subCategory": "Magazines ", "rate": 7, "isChecked": false},
    {"subCategory": "Grey Board ", "rate": 2, "isChecked": false},
  ].obs;

  RxList<Map> subCategoryListPlastic = [
    {"subCategory": "soft plastic ", "rate": 7, "isChecked": false},
    {"subCategory": "mix plastic ", "rate": 4, "isChecked": false},
    {"subCategory": "hard plastic ", "rate": 10, "isChecked": false},
    {"subCategory": "Bumper ", "rate": 20, "isChecked": false},
  ].obs;

  RxList<Map> subCategoryListMetals = [
    {"subCategory": "copper ", "rate": 300, "isChecked": false},
    {"subCategory": "Aluminium ", "rate": 75, "isChecked": false},
    {"subCategory": "brass ", "rate": 200, "isChecked": false},
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