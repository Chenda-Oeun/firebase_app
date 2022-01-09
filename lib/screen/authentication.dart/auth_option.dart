import 'package:firebase_app/screen/authentication.dart/sign_in.dart';
import 'package:firebase_app/screen/authentication.dart/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.pink[100]!,
                Colors.blue[200]!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp),
        ),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 140),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://cdn.dribbble.com/users/2543315/screenshots/16765731/media/ab41e8eaf702f3e557a71ec1e6387845.png?compress=1&resize=400x300"),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        "Welcome to Meta",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => const SignUp());
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink[300]!,
                                  Colors.blue[300]!,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                tileMode: TileMode.clamp),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up with email",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  "Already have account? ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: (){
                    Get.offAll(()=> const SignIn());
                  },
                  child: const Text(
                    "Signin",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
