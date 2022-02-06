import 'package:firebase_app/model/user/user_models.dart';
import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  final UserModels? userModels;
  final EdgeInsetsGeometry? margin;
  final Function(String)? onSelected;
  const CustomUserCard({
    Key? key,
    this.userModels,
    this.margin,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.only(left: 20,top: 20,bottom: 20,right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0.1, 0.1),
                spreadRadius: 3,
                blurRadius: 4,
                color: Colors.grey[200]!)
          ]),
      child: Row(
        children: [
          const Icon(Icons.person),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (userModels!.firstname != "" || userModels!.lastname != "")
                Text(
                  "${userModels!.firstname}  ${userModels!.lastname}",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              const SizedBox(height: 3),
              if (userModels!.email != "")
                Text(
                  userModels!.email!,
                  style: const TextStyle(color: Colors.grey),
                ),
            ],
          ),
          const Spacer(),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              onSelected!(value.toString());
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: "update",
                  child: Text("Update"),
                ),
                const PopupMenuItem(
                  value: "delete",
                  child: Text("Delete"),
                ),
                const PopupMenuItem(
                  value: "cancel",
                  child: Text("Cancel"),
                ),
              ];
            },
          )
        ],
      ),
    );
  }
}
