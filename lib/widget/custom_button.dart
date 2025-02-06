import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goldex/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double width;
  final Color borderColor;
  final VoidCallback onPressed;
  final BorderRadius borderRadius;
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
      child: Material(
        color: Colors.transparent,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            gradient: backgroundColor == Colors.white || backgroundColor == Colors.transparent
                ? null
                : const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [colorDarkGreen, colorGreen],
            ),
            color: backgroundColor == Colors.white ? Colors.white : null,
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
