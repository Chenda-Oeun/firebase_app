import 'package:firebase_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authCon = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => authCon.isRegisterLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 140),
                              TextField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                    hintText: "Enter email"),
                              ),
                              TextField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                    hintText: "Enter password"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            authCon.signUpUser(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                          child: const Text("Sign Up")),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
