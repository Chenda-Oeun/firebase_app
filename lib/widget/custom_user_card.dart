import 'package:firebase_app/model/user/user_models.dart';
import 'package:flutter/material.dart';

class CustomUserCard extends StatelessWidget {
  final UserModels? userModels;
  final EdgeInsetsGeometry? margin;
  const CustomUserCard({Key? key, this.userModels,this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              Text("${userModels!.firstname}  ${userModels!.lastname}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              const SizedBox(height: 3),
              Text(userModels!.email!,style: const TextStyle(color: Colors.grey),),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
        ],
      ),
    );
  }
}
