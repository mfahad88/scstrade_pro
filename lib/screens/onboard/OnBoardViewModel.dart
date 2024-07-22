import 'package:get/get.dart';


class Onboardviewmodel extends GetxController{
  var count=0.obs;

  void increment(){
    count++;
    update();
  }

  void decrement(){
    count--;
    update();
  }
}