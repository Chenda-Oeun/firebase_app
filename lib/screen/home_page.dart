import 'package:firebase_app/controller/test.dart';
import 'package:firebase_app/screen/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'all_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myCon = Get.put(TestGetX());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              tooltip: "Profile",
              onPressed: () {
                Get.to(() => const UserProfile());
              },
              icon: const Icon(Icons.person))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    GetBuilder<TestGetX>(
                      init: TestGetX(),
                      builder: (testCon) {
                        return Text(testCon.myNumber.toString(),
                            style: Theme.of(context).textTheme.headline1);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => const AllUser(),
                  );
                },
                child: const Text("All User"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
