import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? fontSize;
  final bool disable;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.disable = false,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.red;
            }
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue.shade100;
            }
            return Colors.green;
          },
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.pressed)) {
              return TextStyle(
                fontSize: fontSize != null ? fontSize! * 2 : 20,
              );
            }
            return TextStyle(
              fontSize: fontSize,
            );
          },
        ),
      ),
      child: Text(title),
    );
  }
}
