import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/controller/user_controller.dart';
import 'package:firebase_app/model/user/user_models.dart';
import 'package:firebase_app/screen/update_user.dart';
import 'package:firebase_app/widget/custom_user_card.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:get/get.dart';

class AllUser extends StatelessWidget {
  const AllUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseFirestore.instance.collection("all_user");
    final userCon = Get.put(UserController());
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
                  final docId = snapshot.data!.docs[index].id;
                  return CustomUserCard(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    userModels: currentUser,
                    onSelected: (value) {
                      switch (value) {
                        case "update":
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateUser(
                                  documentId: docId,
                                  firstname: currentUser.firstname,
                                  lastname: currentUser.lastname ,
                                  gender: currentUser.gender,
                                  age: currentUser.age ,

                                ),
                              ),
                            );
                          }
                          break;
                        case "delete":
                          {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text(
                                    "Are you sure? Do you want to remove this user?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //delete
                                      userCon.onRemoveUser(documentId: docId);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"),
                                  )
                                ],
                              ),
                            );
                          }
                          break;
                        case "cancel":
                          {}
                          break;
                      }
                    },
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
