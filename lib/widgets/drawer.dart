import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stackgig/screens/question/question_controller.dart';

Drawer buildDrawer(BuildContext context) {
  final QuestionController _questionController = Get.find();

  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/images/stackgig-logo-icon.png"),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF009be6),
          ),
          accountName: Text(
            "STACKGIG.COM",
            style: TextStyle(color: Colors.white),
          ),
          accountEmail:
              Text("V 0.0.0.1", style: TextStyle(color: Colors.white)),
        ),
        ListTile(
          title: Text("Delete favorite questions"),
          trailing: Icon(Icons.delete_forever),
          onTap: () {
            _questionController.clearFavoriteQuestion();
            Navigator.of(context).pop();
            Get.snackbar("Success", "Favorite question cleared.");
          },
        ),
      ],
    ),
  );
}
