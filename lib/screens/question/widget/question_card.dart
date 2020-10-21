import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final Function press;
  const QuestionCard({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Material(
          color: Color(0xFF404068),
          child: GestureDetector(
            onTap: press,
            child: ListTile(
              title: Text(title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  )),
              trailing: Icon(
                Icons.dehaze,
                size: 14,
                color: AppColors.WHITE,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
