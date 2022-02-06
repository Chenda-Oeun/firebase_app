import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String? title;
  final int? currentIndex;
  final int? selectIndex;
  final Function(String)? onPressed;
  const CustomChip({
    Key? key,
    this.title,
    this.currentIndex = 0,
    this.selectIndex = 0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onPressed!(title!),
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            color: currentIndex == selectIndex ? Colors.pink: Colors.grey[400], borderRadius: BorderRadius.circular(8.0)),
        child: Text(
          title!,
          style:  TextStyle(
            fontSize: 16,
            color: currentIndex == selectIndex ? Colors.white : Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
