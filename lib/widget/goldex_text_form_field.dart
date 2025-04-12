import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  final Widget? suffix;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool isLoading;
  final InputTypeMode inputTypeMode;

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
    this.suffix,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.isLoading = false,
    required this.inputTypeMode,

  }) : super(key: key);

  List<TextInputFormatter> _getInputFormatters() {
    switch (inputTypeMode) {
      case InputTypeMode.englishLetters:
        return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))];
      case InputTypeMode.englishNumbers:
        return [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))];
      case InputTypeMode.englishLettersAndNumbers:
        return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]'))];
      case InputTypeMode.englishLettersAndNumbersAndDash:
        return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9-_rg]'))];
      case InputTypeMode.englishLettersAndSpace:
        return [FilteringTextInputFormatter.allow(RegExp(r'[ a-zA-Z]'))];
      case InputTypeMode.none:
      default:
        return [];
    }
  }

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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface),
                ),
              ],
            ),
          ),
        TextFormField(
          inputFormatters: _getInputFormatters(),
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          cursorColor: Theme.of(context).primaryColor,
          maxLines: maxLines ?? 1,
          style: style ?? TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Theme.of(context).colorScheme.onSurface),
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
            fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.tertiary
            ),
            labelText: labelText,
            suffix: isLoading ? Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: SpinKitThreeBounce(
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
            ) : suffix,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary.withAlpha(95), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}

enum InputTypeMode {
  englishLetters,
  englishNumbers,
  englishLettersAndNumbers,
  englishLettersAndNumbersAndDash,
  englishLettersAndSpace,
  none,
}
