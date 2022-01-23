import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/screen/all_user.dart';
import 'package:firebase_app/screen/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      CollectionReference allUser =
        FirebaseFirestore.instance.collection("all_user");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
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
            //  FutureBuilder(
            //   future: allUser.get(),
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasData) {
            //       UserModels _userModel = const UserModels();
            //       List<UserModels> _userList = [];

            //       snapshot.data!.docs.map((e) {
                    
            //         _userModel =
            //             UserModels.fromJson(e.data() as Map<String, dynamic>);
            //         _userList.add(_userModel);
            //       }).toList();

            //       return Column(children: _userList.map((e) => Text(e.firstname!)).toList());
            //     }
            //     return Container();
            //   },
            // ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => AllUser(),
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
