import 'package:get/get.dart';

class TestGetX extends GetxController {
  final str = "".obs;
  final number = 0.0.obs;

  ///GetBuilder
  int myNumber = 0;

  onIncrement(){
    myNumber = myNumber + 1;
    update();
  }
}