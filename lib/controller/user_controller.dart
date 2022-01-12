import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserController extends GetxController{
  fetchUser()async{
  final user = FirebaseFirestore.instance.collection("all_user");

  }
}