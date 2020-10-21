import 'package:flutter/material.dart';
import 'package:stackgig/utils/colors.dart';

class CustomAppBarAction extends StatelessWidget {
  final Function action;
  final IconData icon;
  final Color background;
  final int quantity;

  CustomAppBarAction({this.action, this.icon, this.background, this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          onPressed: action,
          padding: EdgeInsets.zero,
          color: background ?? Color(0xFF27b6f6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Icon(
                icon,
                size: 21,
                color: AppColors.WHITE,
              ),
              Visibility(
                visible: quantity != null,
                child: Positioned(
                  top: -5,
                  right: -10,
                  child: Container(
                    width: 15,
                    height: 15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.DARK,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      quantity.toString() ?? "",
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.WHITE,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
