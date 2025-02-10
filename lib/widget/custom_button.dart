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
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        child: Ink(
          decoration: BoxDecoration(
            gradient: backgroundColorStart == Theme.of(context).colorScheme.surface ||
                    backgroundColorStart == Colors.transparent ||
                    backgroundColorStart == Theme.of(context).colorScheme.onSurface
                ? null
                : LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [backgroundColorEnd!, backgroundColorStart],
                  ),
            color: backgroundColorStart == Theme.of(context).colorScheme.surface
                ? Theme.of(context).colorScheme.surface
                : backgroundColorStart == Theme.of(context).colorScheme.onSurface
                    ? Theme.of(context).colorScheme.onSurface
                    : null,
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            border: Border.all(color: borderColor),
          ),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            onTap: onPressed,
            splashColor: Theme.of(context).colorScheme.surface.withOpacity(0.3),
            highlightColor: Theme.of(context).colorScheme.surface.withOpacity(0.1),
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
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: textColor)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
