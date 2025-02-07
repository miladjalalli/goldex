import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColorStart;
  Color? backgroundColorEnd;
  final Color textColor;
  final double height;
  final double width;
  final Color borderColor;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final String? icon;
  final bool isIconEnabled;

  CustomButton({
    super.key,
    required this.text,
    required this.backgroundColorStart,
    this.backgroundColorEnd,
    required this.textColor,
    required this.height,
    required this.width,
    required this.borderColor,
    required this.onPressed,
    this.borderRadius = const BorderRadius.all(Radius.circular(25.0)), // Default borderRadius
    this.textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Default textStyle
    this.icon,
    this.isIconEnabled = false,
  }) {
    backgroundColorEnd ??= backgroundColorStart;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient: backgroundColorStart == Colors.white ||
                    backgroundColorStart == Colors.transparent ||
                    backgroundColorStart == Colors.black
                ? null
                : LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [backgroundColorEnd!, backgroundColorStart],
                  ),
            color: backgroundColorStart == Colors.white
                ? Colors.white
                : backgroundColorStart == Colors.black
                    ? Colors.black
                    : null,
            borderRadius: borderRadius,
            border: Border.all(color: borderColor),
          ),
          child: InkWell(
            borderRadius: borderRadius,
            onTap: onPressed,
            splashColor: Colors.white.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.1),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isIconEnabled && icon != null) ...[
                    SvgPicture.asset(
                      icon!,
                      color: textColor,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: textStyle.copyWith(color: textColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
