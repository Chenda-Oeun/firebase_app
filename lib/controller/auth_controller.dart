import 'package:firebase_app/screen/authentication.dart/auth_option.dart';
import 'package:firebase_app/screen/authentication.dart/sign_in.dart';
import 'package:firebase_app/screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final isRegisterLoading = false.obs;
  final isSignInLoading = false.obs;
//-----------------------------------------------------------------
  Future<void> signUpUser({String? email, String? password}) async {
    isRegisterLoading(true);
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((response) {
        if (response.credential.hashCode == 2011) {
          addUser();
          Get.offAll(() => const SignIn());
        }
      });
    } catch (message) {
      Get.snackbar(
        "Error",
        message.toString(),
      );
    }
    isRegisterLoading(false);
  }
  //-----------------------------------------------------------------
  Future<void> addUser(
    {
      
    }
  )async{

  }
  //-----------------------------------------------------------------

  Future<void> signInUser({String? email, String? password}) async {
    isSignInLoading(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!).then((response) {
            if(response.credential.hashCode == 2011){
              Get.offAll(()=>const HomePage());
            }
          });
    } catch (message) {
      Get.snackbar(
        "Error",
        message.toString(),
      );
    }
    isSignInLoading(false);
  }

  onCheckUser() {
    if(FirebaseAuth.instance.currentUser?.uid == null){
      Get.offAll(()=>const OptionScreen());
    }else{
      Get.offAll(()=>const HomePage());
    }
  }

  signOutUser()async{
    final auth = FirebaseAuth.instance;
    await auth.signOut().then((value)=> Get.offAll(()=> const OptionScreen()));
  }
}
