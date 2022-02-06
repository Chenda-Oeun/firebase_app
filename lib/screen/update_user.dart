import 'package:firebase_app/controller/user_controller.dart';
import 'package:firebase_app/widget/custom_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateUser extends StatefulWidget {
  final String documentId;
  final String? firstname;
  final String? lastname;
  final String? age;
  final String? gender;
  const UpdateUser(
      {Key? key,
      required this.documentId,
      this.age,
      this.firstname,
      this.gender,
      this.lastname})
      : super(key: key);

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  int selectedIndex = 0;
  String gender = "";
  final userCon = Get.put(UserController());
  String firstName = "";
  String lastName = "";
  String age = "";

  @override
  void initState() {
    if (widget.gender == "Male") {
      selectedIndex = 0;
    } else if (widget.gender == "Female") {
      selectedIndex = 1;
    } else {
      selectedIndex = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update information"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 140),
                        TextFormField(
                          initialValue: widget.firstname ?? "",
                          onChanged: (value) {
                            setState(() {
                              firstName = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: "Enter first name"),
                        ),
                        TextFormField(
                          initialValue: widget.lastname ?? "",
                          onChanged: (value) {
                            setState(() {
                              lastName = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: "Enter last name"),
                        ),
                        Row(
                          children: userCon.genderList
                              .asMap()
                              .entries
                              .map(
                                (e) => CustomChip(
                                  title: e.value,
                                  currentIndex: e.key,
                                  selectIndex: selectedIndex,
                                  onPressed: (value) {
                                    setState(() {
                                      gender = value;
                                      debugPrint("------------$gender");
                                      selectedIndex = e.key;
                                    });
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        TextFormField(
                          initialValue: widget.age ?? "",
                          onChanged: (value) {
                            setState(() {
                              age = value;
                            });
                          },
                          decoration:
                              const InputDecoration(hintText: "Enter age"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                  top: 10, bottom: 20, left: 20, right: 20),
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  userCon.onUpdate(
                    docId: widget.documentId,
                    firstname: firstName != "" ?firstName : widget.firstname,
                    lastname: lastName != "" ? lastName : widget.lastname,
                    age: age != ""? age : widget.age,
                    gender: gender != "" ? gender : widget.gender,
                  );
                  Navigator.pop(context);
                },
                child: const Text("Update"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
