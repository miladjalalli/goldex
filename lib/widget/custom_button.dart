import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final Color borderColor;
  final VoidCallback onPressed;
  final BorderRadiusGeometry borderRadius;
  final TextStyle textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.width,
    required this.borderColor,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)), // Default borderRadius
    this.textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Default textStyle
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: Size(double.infinity, height),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(color: borderColor),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle.copyWith(color: textColor), // Apply textColor to the provided textStyle
        ),
      ),
    );
  }
}
