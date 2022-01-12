import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/controller/auth_controller.dart';
import 'package:firebase_app/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseFirestore.instance.collection("all_user");
    final userCon = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FutureBuilder<DocumentSnapshot>(
          future: user.doc(userCon.userId.value.toString()).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Full Name: ${data['firstname']} ${data['lastname']}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Email : ${data["email"]}",
                    style: const TextStyle(fontSize: 25),
                  ),
                   Text(
                    "Age : ${data["age"]}",
                    style: const TextStyle(fontSize: 25),
                  ),
                  Image.network(data["profile"],width: 200,height: 200,),
          
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
