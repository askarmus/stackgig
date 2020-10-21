import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String value) onChnage;

  const RoundedInput({Key key, this.controller, this.onChnage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF27b6f6),
        borderRadius: BorderRadius.circular(29.5),
      ),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          onChnage(value);
        },
        decoration: InputDecoration(
          hintText: "Search Topics",
          hintStyle: TextStyle(color: Colors.white),
          icon: SvgPicture.asset("assets/icons/search.svg"),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
