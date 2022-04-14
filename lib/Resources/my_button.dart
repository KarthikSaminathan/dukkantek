import 'package:flutter/material.dart';

enum ButtonType { normal, normalWithoutBg }

class MyButton extends StatelessWidget {
  const MyButton(
      {this.buttonName,
      this.onPressed,
      this.width,
      this.fontsize,
      this.height = 45,
      this.type = ButtonType.normal});
  final String? buttonName;
  final GestureTapCallback? onPressed;
  final double? width;
  final double? fontsize;
  final double height;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        width: width,
        height: height,
        child: RawMaterialButton(
          fillColor: type == ButtonType.normal ? Colors.blue : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              buttonName!,
              style: TextStyle(
                  fontSize: fontsize != null ? fontsize! : 17,
                  fontWeight: FontWeight.bold,
                  color:
                      type == ButtonType.normal ? Colors.white : Colors.blue),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
