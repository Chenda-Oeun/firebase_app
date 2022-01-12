import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/controller/auth_controller.dart';
import 'package:firebase_app/screen/authentication.dart/sign_in.dart';
import 'package:firebase_app/screen/my_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCon = Get.put(AuthController());
    Stream collectionStream = FirebaseFirestore.instance.collection('all_user').snapshots();
    // Stream documentStream = FirebaseFirestore.instance.collection('all_user').doc('ABC123').snapshots();
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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("all_user").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child:  CircularProgressIndicator());
            }

            return ListView(
              children: snapshot.data!.docs.map((e) {
                 Map<String, dynamic> data =
                  snapshot.data!. as Map<String, dynamic>;
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(data["firstname"]));
              }).toList()
            );

            // return ListView(
            //   children: snapshot.data!.docs.map((DocumentSnapshot document) {
            //     Map<String, dynamic> data =
            //         document.data()! as Map<String, dynamic>;
            //     return ListTile(
            //       title: Text(data['full_name']),
            //       subtitle: Text(data['company']),
            //     );
            //   }).toList(),
            // );
          },
        ),
      ),
    );
  }
}
