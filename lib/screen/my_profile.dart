import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/helper/function/local_sorage.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var userId;
  @override
  void initState() {
    onGetUser();
    super.initState();
  }

  onGetUser() async {
    userId = await LocalStorage.getStrings(key: "uid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("all_user")
              .where("uid", isEqualTo: userId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.blue,
                  size: 50,
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data"),
              );
            }
            if (snapshot.hasData) {
              final email = snapshot.data!.docs.first.get("email");
              final firstname = snapshot.data!.docs.first.get("firstname");
              final lastname = snapshot.data!.docs.first.get("lastname");
              final profile = snapshot.data!.docs.first.get("profile");
              return Column(
                children: [
                  Text(email.toString()),
                  Text(firstname.toString()),
                  Text(lastname.toString()),
                  // Text(profile.toString()),
                  Image.network(profile),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
