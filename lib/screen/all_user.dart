import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/user/user_models.dart';
import 'package:firebase_app/widget/custom_user_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AllUser extends StatelessWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseFirestore.instance.collection("all_user");
    return Scaffold(
      appBar: AppBar(
        title: const Text("All User"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.transparent,
        child: StreamBuilder(
          stream: user.snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.fourRotatingDots(
                    color: Colors.blue, size: 50),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Data"),
              );
            }
            if (snapshot.hasData) {
              UserModels userModels = const UserModels();
              List<UserModels> userList = <UserModels>[];
              userList.clear();
              snapshot.data!.docs.map((DocumentSnapshot snapshot) {
                userModels = UserModels.fromJson(
                    snapshot.data() as Map<String, dynamic>);
                userList.add(userModels);
              }).toList();

              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final currentUser = userList[index];
                  return CustomUserCard(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    userModels: currentUser,
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
