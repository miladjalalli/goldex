import 'package:flutter/material.dart';

class GoldexTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final int? maxLines;
  final TextStyle? style;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const GoldexTextFormField({
    Key? key,
    this.title,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.maxLines,
    this.style,
    this.suffixIcon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(23, 5, 0, 7),
            child: Row(
              children: [
                Text(
                  title!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        SizedBox(
          height: 50,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText ?? false,
            maxLines: maxLines ?? 1,
            style: style??Theme.of(context).textTheme.bodySmall,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              labelText: labelText,
              suffixIcon: suffixIcon,
              contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary.withAlpha(95), width: 3),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
