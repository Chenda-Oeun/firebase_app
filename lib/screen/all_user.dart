import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/model/user/user_models.dart';
import 'package:flutter/material.dart';

class AllUser extends StatelessWidget {
  AllUser({Key? key}) : super(key: key);

  List<String> mylist = [];
  @override
  Widget build(BuildContext context) {
    CollectionReference allUser =
        FirebaseFirestore.instance.collection("all_user");

    return Scaffold(
      appBar: AppBar(
        title: const Text("All User"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.transparent,
        child: Column(
          children: [
            StreamBuilder(
              stream: allUser.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  UserModels _userModel = const UserModels();
                  List<UserModels> _userList = [];

                  snapshot.data!.docs.map((e) {
                    mylist.add(e.get("firstname"));
                    print(e.get("firstname"));
                    // _userModel =
                    //     UserModels.fromJson(e.data() as Map<String, dynamic>);
                    // _userList.add(_userModel);
                  });

                  return Column(children: mylist.map((e) => Text(e)).toList());
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
