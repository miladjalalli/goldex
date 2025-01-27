import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  final String? icon;
  final bool isIconEnabled;

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
    this.icon,
    this.isIconEnabled = false,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: textStyle.copyWith(color: textColor),
            ),
            if (isIconEnabled && icon != null) ...[
              const SizedBox(width: 8),
              SvgPicture.asset(
                icon!,
                width: 20,
                height: 20,
              ),
            ],

          ],
        ),
      ),
    );
  }
}