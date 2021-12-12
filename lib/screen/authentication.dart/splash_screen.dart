import 'package:firebase_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final authCon = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      authCon.onCheckUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  "https://cdn.dribbble.com/users/2543315/screenshots/16765731/media/ab41e8eaf702f3e557a71ec1e6387845.png?compress=1&resize=400x300"),
            ),
            SizedBox(height: 15),
            Text(
              "Metaverse",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 100),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
